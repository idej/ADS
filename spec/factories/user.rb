FactoryGirl.define do
  factory :user do
    email 'user@example.com'
    password 'please'
    password_confirmation 'please'
    #confirmed_at DateTime.now
  end

  factory :admin, class: User do
    email 'user@example.com'
    password 'please'
    password_confirmation 'please'
    role 'admin'
  end
end