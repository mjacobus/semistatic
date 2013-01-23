FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
end

FactoryGirl.define do
  sequence :slug do |n|
    "slug-#{n}"
  end
end

FactoryGirl.define do
  sequence :name do |n|
    "The Name #{n}"
  end
end

FactoryGirl.define do
  sequence :title do |n|
    "Title #{n}"
  end
end