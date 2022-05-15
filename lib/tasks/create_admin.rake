task create_admin: :environment do
  Operator.first_or_create!(
    username: 'admin',
    first_name: 'Ad',
    last_name: 'min',
    password: 'admin',
    password_confirmation: 'admin',
  )
end
