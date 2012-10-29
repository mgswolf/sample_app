FactoryGirl.define do
  factory :user do
    name "Michel Harl"
    email "michel@example.com"
    password "foobar"
    password_confirmation 'foobar'
  end
end
