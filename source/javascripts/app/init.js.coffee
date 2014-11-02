#= require handlebars.runtime
#= require handlebars
#= require_directory ./templates
#= require ./defaults
#= require_directory ./models
#= require_directory ./collections
#= require_directory ./views


NotePad.Workspace = Backbone.Router.extend
  routes: 
    "":        "index"
    "note/:id": "note"    

  index: ()->
    c = new NotePad.Notes
    c.fetch()

    if c.length == 0
      c.create(title: "My First Note", content: "Type some notes here...")

    nl = new NotePad.Views.NoteList(collection : c)
    nl.render()

  note: (id)->
    c = new NotePad.Notes
    c.fetch()
    model = c.get(id)
    console.log model

$(document).ready ()->
  router = new NotePad.Workspace
  Backbone.history.start()
