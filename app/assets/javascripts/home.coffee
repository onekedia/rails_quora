# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $('#answers').on 'click', '.toggle-comments', ->
    hideComments this
    return

  $('#answers').on 'click', '.toggle-comment', ->
    hideComments this
    return
  return
  showForm = (elem, formClass) ->
    $(elem).parent().prev().find(formClass).show()
    $(elem).parent().prev().find(formClass + ' textarea').first().focus()
    $(elem).parent().hide()
    return

  hideForm = (elem, formClass) ->
    $(elem).closest(formClass).hide()
    $(elem).closest('.forms').next().show()
    return

  $('.input-group textarea').each(->
    @setAttribute 'style', 'min-height:34px;height:34px;overflow-y:hidden;'
    return
  )
  
  $('#answers').on 'input', '.input-group textarea', ->
    @style.height = '0px'
    @style.height = @scrollHeight + 2 + 'px'
    return

  $('#answers').on 'click', '.show-new-form', ->
    showForm this, '.new-form'
    return

  $('#answers').on 'click', '.show-edit-form', ->
    showForm this, '.edit-form'
    $(this).parent().prevAll('.text:first').hide()
    $('textarea').trigger 'input'
    return

  $('#answers').on 'blur', '.new-form textarea', ->
    if $(this).val() == ''
      hideForm this, '.new-form'
    return

  $('#answers').on 'click', '.hide-edit-form', ->
    hideForm this, '.edit-form'
    $(this).closest('.forms').prevAll('.text:first').show()
    $(this).closest('.edit-form')[0].reset()
    return
  return