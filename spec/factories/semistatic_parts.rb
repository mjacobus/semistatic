# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :part, :class => 'Semistatic::Part' do
    name { generate(:name) }
    association :page, factory: :page
    value "MyText"
  end
end
