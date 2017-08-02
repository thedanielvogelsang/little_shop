FactoryGirl.define do
  factory :user do
    sequence :username do |i|
        "#{i}MyName"
      end
    password "MyString"
    first_name "MyString"
    last_name "MyString"
    street_address "123 Blueberry Lane"
    city "Seattle"
    state "Washington"
    zip_code "123456"
    role 0
  end

  trait :with_orders do
    transient do
      order_count 3
    end

    after(:create) do |user, evaluator|
      FactoryGirl.create_list(:order, evaluator.order_count)
    end
  end
end
