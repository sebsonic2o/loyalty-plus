module AuthorizeCustomer
  extend ActiveSupport::Concern

private

  def load_and_authorize(args = {})
    args[:resources] ||= controller_name
    resource = args[:resources].singularize
    klass = args[:resources].classify.constantize
    args[:inst_var] ||= resource
    args[:redirect_url] ||= customer_accounts_path
    args[:customer_id] ||= :customer_id

    instance_variable_set("@#{args[:inst_var]}", klass.find(params["#{resource}_id"] || params[:id]))

    if current_customer.id != instance_variable_get("@#{args[:inst_var]}").send(args[:customer_id])
      respond_to do |format|
        format.html { redirect_to args[:redirect_url], status: :see_other }
        format.js { render js: "window.location = '#{args[:redirect_url]}'" }
      end
    end
  end
end
