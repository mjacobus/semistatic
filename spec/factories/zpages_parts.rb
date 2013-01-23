# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :zpages_part, :class => 'Zpages::Part' do
    name { generate(:name) }
    association :page
    value "MyText"
  end
end
