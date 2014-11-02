NotePad.Views.Control = Backbone.View.extend
  className: "control"
  template: HandlebarsTemplates["app/templates/control"]

  events:
    'click .new-note' : 'create'

  initialize: (options={})->
    @collection = options.collection

  render: ()->
    temp = @template()
    @$el.append(temp)
    $('.sidebar').append(@$el)
    @

  create: ()->
    @collection.create()
    false
