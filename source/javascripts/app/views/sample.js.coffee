
NotePad.Views.Sample = Backbone.View.extend
  className: "page"
  template: HandlebarsTemplates["app/templates/sample"]

  render: ->
    temp = @template(window)
    @$el.html(temp)
    $('.page-wrap').html(@el)

