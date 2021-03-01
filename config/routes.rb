Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'lotto#lotto_numbers'
  
  get 'welcome/index'
  get 'lotto', to: 'lotto#lotto_numbers'  
end
