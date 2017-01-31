Rails.application.routes.draw do

  get  '/'              => 'main#index'

  post '/process_money' => 'main#fate'

  get  '/reset'         => 'main#clear'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
