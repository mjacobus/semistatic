Rails.application.routes.draw do
  match ':slug.html' => 'zpages/page_view#show', as: :page
  mount Zpages::Engine => "/admin"
end
