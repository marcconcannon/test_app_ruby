Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles
  resources :users, except: [:new  ]

root 'welcome#home'
get 'about', to: 'welcome#about' # I think the # means sub of class welcome
get 'signup', to: 'users#new'
post 'users', to: 'users#create'
get 'users/:id', to: 'users#edit'



end
