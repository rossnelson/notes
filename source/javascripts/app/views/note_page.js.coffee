NotePad.Views.Page = Backbone.View.extend
  className: "page"
  template: HandlebarsTemplates["app/templates/page"]

  events:
    'keyup .title' : 'save'
    'keyup .secondary-content' : 'save'
    'keyup .note' : 'save'
    'keyup .body' : 'resize'

  initialize: (options={})->
    @model = options.model
    @listenTo @model, 'destroy', @remove

    temp = @template(@model.attributes)
    @$el.append(temp)

  render: ->
    $('.page-wrap').html(@$el)
    @delegateEvents()

    height = $(".note").height()
    $(".content .left-decorative").height height

  save: ->
    title = @$el.find('.title').html()
    sc = @$el.find('.secondary-content').html()
    note = @$el.find('.note').html()
    @model.save 
      title: title
      content: note
      secondaryContent: sc
      updated: new Date
      prettyDate: @model.prettyDate()

  resize: ->
    height = @$el.find('.note').height()
    @$el.find(".content .left-decorative").height height

