# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pundit

  before_action :authenticate_user!
  after_action :verify_authorized
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
end
