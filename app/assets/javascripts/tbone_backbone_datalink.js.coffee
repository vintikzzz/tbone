(($) ->
  $.extend $.fn,
    backboneLink: (model) ->
      form = $(this)
      renameInputs = (cid, name) ->
        $('*[name="' + name + '"]:input', form).attr('name', name + '_' + cid)

      getInputs = (cid, name) ->
        $('*[name="' + name + '_' + cid + '"]:input', form)

      setValue = (cid, name, value) ->
        inputs = getInputs(cid, name)
        return if inputs.length == 0
        input = $(inputs[0])
        if (input.is('input') && input.attr('type') == 'text') || input.is('textarea')
          input.val(value)
        if input.is('input') && input.attr('type') == 'radio'
          inputs.filter('[value="' + value + '"]').attr('checked', true)
        if input.is('select')
          options = $('option', input)
          options.filter('[value="' + value + '"]').attr('selected', true)

      getValue = (inputs) ->
        input = $(inputs[0]) if inputs.length > 0
        val = null
        if (input.is('input') && input.attr('type') == 'text') || input.is('textarea')
          val = input.val()
        if input.is('input') && input.attr('type') == 'radio'
          val = inputs.filter(':checked').val()
        if input.is('select')
          val = $('option:selected', input).val()
        val

      $.each model.attributes, (name, value) ->
        renameInputs(model.cid, name)
        setValue(model.cid, name, value)
        model.bind 'change:' + name, ->
          setValue(model.cid, name, model.get(name))
        inputs = getInputs(model.cid, name)
        inputs.bind 'change', (e) =>
          el = $(e.target)
          model.set(name, getValue(el))

) jQuery
