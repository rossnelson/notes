NotePad.Views.NoteList = Backbone.View.extend
  tagName: "ul"
  className: "list unselectable"

  initialize: (options={})->
    @collection = options.collection
    @listenTo @collection, 'add', @addToList
    @listenTo @collection, 'destroy', @substitute
    @renderControls()

  render: ->
    @renderList()
    @

  renderList: ->
    @collection.each (note)=>
      view = new NotePad.Views.NoteItem(model: note)
      @$el.append(view.render().$el)
      if @collection.length == 1
        view.selectNote()
    $('.sidebar .list-wrap').html(@$el)

  addToList: (model)->
    view = new NotePad.Views.NoteItem(model: model)
    @$el.prepend(view.render().$el)
    view.selectNote()

  renderControls: ->
    control = new NotePad.Views.Control(collection: @collection)
    control.render()

  substitute: ()->
    sample = new NotePad.Views.Sample
    sample.render()
