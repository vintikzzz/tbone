class TokensController < ApplicationController
  before_filter :set_token
  def set_token
    @token = form_authenticity_token
  end
  def show
    @token
  end
end
