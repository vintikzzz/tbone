define [
  'jquery'
  'backbone'
  'bootstrap'
  'views/common/alert_view'
], ($, Backbone, App, AlertView) ->

  class App.Views.Common.FormView extends AlertView
    events: ->
      'submit':      'save'
      'click .back': 'back'

    initialize: ->
      @model.on('change:errors', @renderErrors, this)
      @on 'databind', @databind, @

    databind: ->


    cleanErrors: ->
      @form.find(".error").removeClass("error")
      @form.find(".help-block").remove()

    save: (e) ->
      e.preventDefault()
      e.stopPropagation()
      @model.unset("errors", silent: true)
      @model.save(null,
        success: (e) =>
          @success(e)

        error: (e, jqXHR) =>
          @error(e, jqXHR)
      )

    close: ->
      super
      @model.off("change:errors", @renderErrors, this)
      @remove()
      @off()

    error: (e, jqXHR) ->
      @model.set({errors: $.parseJSON(jqXHR.responseText)})

    markErrorField: (name, error) ->
      field = @form.find(":input[name=" + name + '_' + @model.cid + "]")
      controlGroup = field.parents('.control-group')
      controlGroup.append("<div class='help-block'>" + error + "</div>")
      controlGroup.addClass("error")

    renderErrors: ->
      @errors = @model.get('errors')
      @form = $(@el)
      @cleanErrors()
      if @errors?
        if @errors.error?
          @addErrorAlert(@errors.error)
          @renderAlerts()
        @markErrorField(name, error) for name, error of @errors
      @

    render: ->
      $(@el).html(@template(@))
      @renderAlerts()
      @trigger('databind')
      @form = $(@el)
      @form.backboneLink(@model)
      @

    back: ->
      window.history.back()
