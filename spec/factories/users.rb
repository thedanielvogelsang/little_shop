FactoryGirl.define do
  factory :user do
    sequence :username do |t|
      "#{t}MyString"
    end
    password 'MyString'
    first_name 'MyString'
    last_name 'MyString'
    email 'MyString'
    role 0
  end
end
