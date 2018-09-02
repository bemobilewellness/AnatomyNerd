Rails.application.routes.draw do
  match '/alexa' => 'alexa#index', via: :post
end
