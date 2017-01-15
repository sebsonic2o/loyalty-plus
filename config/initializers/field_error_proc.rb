ActionView::Base.field_error_proc = Proc.new { |html_tag, instance|
  checkbox_type_index = html_tag.index "type=\"checkbox\""

  if checkbox_type_index || html_tag =~ /^<label/
    html_tag.html_safe
  else
    "<div class=\"field_with_errors\">#{html_tag}</div>".html_safe
  end
}
