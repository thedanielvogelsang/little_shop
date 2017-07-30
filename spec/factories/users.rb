FactoryGirl.define do
  factory :user do
    sequence :username do |i|
        "#{i}MyName"
      end
    password "MyString"
    first_name "MyString"
    last_name "MyString"
    email "MyString"
    role 1
  end
end
