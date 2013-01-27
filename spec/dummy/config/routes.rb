Rails.application.routes.draw do
  match ':slug.html' => 'semistatic/page_view#show', as: :page
  mount Semistatic::Engine => "/admin"
end
