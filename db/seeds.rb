## BRANDS ##

brands = []

brands << Brand.create(name: 'Frontier Outdoor Supply',
                      account_id: 'aabacd',
                      secret_key: '123')

brands << Brand.create(name: 'Recreational Equipment Incorporated',
                      account_id: 'bbcbde',
                      secret_key: '123')

## CUSTOMERS ##

emails = ['sam@email.com', 'sally@email.com', 'james@email.com']

emails.each do |email|
  customer = Customer.create(email: email,
                            password: '12345678',
                            password_confirmation: '12345678')
  customer.brands << brands
end

## REWARD PROGRAMS ##

brands[0].reward_programs.create(name: 'Frontier Rewards')
