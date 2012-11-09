define [
  'jquery'
  'models/token'
  'views/tokens/show_view'
  'backbone-rails'
  'hamlcoffee'
],

($, Token, TokensView) ->
  class Tbone
    constructor: ->
      @token = new Token()
      new TokensView(model: @token)

  new Tbone()
