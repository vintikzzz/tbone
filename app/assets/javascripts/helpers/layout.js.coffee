
define [
  'jquery'
  'backbone'
  'bootstrap'
], ($, Backbone, App) ->
  class Layout extends Backbone.Model
    setContent: (content) ->
      do @currentContent.close if @currentContent?
      @currentContent = content
      e = content.render().el
      @trigger('render:content', e)
      ($ '#content').html e

  App.Helpers.Layout = new Layout
