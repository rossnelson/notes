NotePad.Views.NoteItem = Backbone.View.extend
  tagName: "li"
  template: HandlebarsTemplates["app/templates/note_item"]

  events:
    'click .title'         : 'selectNote'
    'click .remove'        : 'selectRemove'
    'click:remove .remove' : 'destroy'

  initialize: (options={})->
    @model = options.model
    @page()

    @listenTo @model, 'destroy', @remove
    @listenTo @model, 'change', @render

  render: ->
    temp = @template(@model.attributes)
    @$el.html(temp)
    @

  selectNote: ->
    $("li").removeClass "active clicked"
    @$el.addClass "active"
    $("li.active .remove").removeClass "clicked"
    @page.render()

  page: ->
    @page = new NotePad.Views.Page(model: @model)
    @page

  selectRemove: ->
    unless @$el.find('.remove').hasClass('clicked')
      @$el.find('.remove').addClass('clicked')
    else
      @$el.find('.remove').trigger('click:remove')

  destroy: ->
    @model.destroy()
