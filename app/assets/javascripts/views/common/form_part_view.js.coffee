define [
  'jquery'
  'backbone'
  'bootstrap'
  'views/common/form_view'
], ($, Backbone, App, FormView) ->

  class App.Views.Common.FormPartView extends FormView
    renderAlerts: ->
