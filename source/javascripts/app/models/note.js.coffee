NotePad.Note = Backbone.Model.extend
  defaults:
    title: "Another Note"
    content: ""
    secondaryContent: ""
    updated: new Date
    active: false

  initialize: ()->
    unless @get('prettyDate')
      date = @prettyDate()
      @set(prettyDate: date)

  prettyDate: ->
    date = new Date
    day = date.getDate()
    month = date.getMonth()
    year = date.getFullYear()
    time = formatTwelveHour(date)
    "#{month}/#{day}/#{year} #{time}"
