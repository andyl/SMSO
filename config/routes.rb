SMSO::Application.routes.draw do

  def get_pages(page_list, controller)
    page_list.each do |page|
      get "/#{controller}/#{page}" => "#{controller}##{page}"
    end
  end

  zp1 = %w(index banded banner blog boxy contact feed grid icons)
  zp2 = %w(marketing orbit realty sidebar store tables workspace)
  ZESB_PAGES = zp1 + zp2
  HOME_PAGES = %w(index)
  INFO_PAGES = %w(not_authorized domain_not_found page_not_found inactive no_access not_member)

  get_pages ZESB_PAGES, "zesb"
  get_pages HOME_PAGES, "home"
  get_pages INFO_PAGES, "info"

  get "login"  => "sessions#new",     :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"

  resources :sessions
  resources :users
  resources :members
  resources :team_tweets

  root :to => 'home#index'

end
