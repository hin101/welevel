FactoryBot.define do
  factory(:user) do
    firstname { Faker::Name.name }
    last_name { Faker::Name.name }
    email { Faker::Internet.email }
  end
end