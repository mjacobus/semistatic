# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :zpages_page, :class => 'Zpages::Page' do
    title { generate(:title) }
    slug { generate(:title) }
    template_name 'template_name'
  end
end
