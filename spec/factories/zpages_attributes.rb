# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :zpages_attribute, :class => 'Attribute' do
    title "MyString"
    page nil
    value "MyText"
  end
end
