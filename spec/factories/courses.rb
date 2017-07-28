FactoryGirl.define do
  factory :course do
    sequence :title do |i|
        "#{i}MyCourse"
      end
      description "Course Details"
      price 50.00
      image "https://robohash.org/0.png"
      category
  end
end
