Rails.application.routes.draw do
  
  root to: 'twitters#top'

  resources:tops do 
    collection do 
        post :confirm
    end 
  end
  
  resources:contacts do
      collection do 
          post :confirm
      end 
  end

  resources:blogs do
    collection do 
        post :confirm
    end 
  end


  resources:twitters do
    collection do 
      post :confirm
      get :top
    end 
  end
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
end