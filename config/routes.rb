ActionController::Routing::Routes.draw do |map|
  map.resources :songs
  map.root :controller => "songs"
end
