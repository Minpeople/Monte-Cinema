# frozen_string_literal: true

Rails.application.routes.draw do
resources :cinema_hall, only: [:index, :new, :create, :show, :update, :edit, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
