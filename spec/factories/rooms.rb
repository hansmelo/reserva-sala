FactoryGirl.define do
  factory :room do
    user
    day DateTime.now.beginning_of_week
    hour 9
  end
end