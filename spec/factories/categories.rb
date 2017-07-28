FactoryGirl.define do
  factory :category do
    sequence :title do |i|
      "#{i}MyCategory"
    end
  end
end
