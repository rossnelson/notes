window.formatTwelveHour = (date) ->
  hours = date.getHours()
  minutes = date.getMinutes()
  ampm = (if hours >= 12 then "pm" else "am")
  hours = hours % 12
  hours = (if hours then hours else 12) # the hour '0' should be '12'
  minutes = (if minutes < 10 then "0" + minutes else minutes)
  strTime = hours + ":" + minutes + " " + ampm
  strTime
