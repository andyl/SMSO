SMSO::Application.routes.draw do

  def get_pages(page_list, controller)
    page_list.each do |page|
      get "/#{controller}/#{page}" => "#{controller}##{page}"
    end
  end

  zp1 = %w(index banded banner blog boxy contact feed grid icons)
  zp2 = %w(marketing orbit realty sidebar store tables workspace)
  ZESB_PAGES = zp1 + zp2
  SMSO_PAGES = %w(index)
  HOME_PAGES = %w(index)

  get_pages ZESB_PAGES, "zesb"
  get_pages HOME_PAGES, "home"
  get_pages SMSO_PAGES, "smso"

  get "login"  => "sessions#new",     :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"

  resources :sessions
  resources :users
  resources :members
  resources :team_tweets

  root :to => 'home#index'

end
