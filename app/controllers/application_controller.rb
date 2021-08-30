# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pundit

  protect_from_forgery
  before_action :authenticate_user!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
end
