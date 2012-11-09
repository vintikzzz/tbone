define [
  'jquery'
  'backbone'
  'bootstrap'
  'templates/common/alert_message'
], ($, Backbone, App) ->

  class App.Views.Common.AlertMessageView extends Backbone.View
    template: JST["common/alert_message"]

    events: ->
      'click .close': 'destroy'

    render: ->
      $(@el).html(@template @)
      @model.set('shown', true)
      @

    destroy: ->
      @model.destroy()
      @remove()
