SMSO::Application.routes.draw do

  zesb_pages  = %w(index banded banner blog boxy contact feed grid icons)
  zesb_pages += %w(marketing orbit realty sidebar store tables workspace)
  zesb_pages.each do |page|
    get  "/zesb/#{page}"  => "zesb##{page}"
  end

  home_pages = %w(index)
  home_pages.each do |page|
    get "/home/#{page}" => "home##{page}"
  end

  get "login"  => "sessions#new",     :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"

  resources :sessions

  root :to => 'home#index'

end
