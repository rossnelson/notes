NotePad.Notes = Backbone.Collection.extend
  localStorage: new Backbone.LocalStorage("Notes")
  model: NotePad.Note
