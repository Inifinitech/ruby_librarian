Rails.application.routes.draw do
  root 'books#index'

  resources :books do
    resources :borrowings, only: [:create]
    post 'return', to: 'borrowings#return'
  end

  get 'borrowers/:name', to: 'borrowings#history', as: :borrower_history
end
