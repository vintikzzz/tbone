define [
  'jquery'
  'models/token'
  'views/tokens/show_view'
  'backbone-rails'
],

($, Token, TokensView) ->
  class Tbone
    constructor: ->
      @token = new Token()
      new TokensView(model: @token)

  new Tbone()
