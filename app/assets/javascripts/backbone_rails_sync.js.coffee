define [
  'jquery'
  'backbone'
], ($, Backbone) ->
  Backbone._sync = Backbone.sync

  Backbone.sync = (method, model, options) =>
    if (!options.noCSRF)
      beforeSend = options.beforeSend

      options.beforeSend = (xhr) =>
        token = $('meta[name="csrf-token"]').attr('content')
        xhr.setRequestHeader('X-CSRF-Token', token) if token
        return beforeSend.apply(this, arguments) if beforeSend

    if (options.data == null && model && (method == 'create' || method == 'update' || method == 'patch'))
      options.contentType = 'application/json'
      data = JSON.stringify(options.attrs || model.toJSON(options))
      if (model.paramRoot)
        data = {}
        data[model.paramRoot] = model.toJSON(options)
      else
        data = model.toJSON();

      options.data = JSON.stringify(data);

    Backbone._sync(method, model, options);
