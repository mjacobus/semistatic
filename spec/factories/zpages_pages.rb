# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :zpages_page, :class => 'Page' do
    title "MyString"
    slug "MyString"
  end
end
