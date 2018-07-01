Rails.application.routes.draw do
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
    end 
  end
  
end