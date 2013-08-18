Session.set("subPage", "hook")

Template.home.ifSubPageIs = (data, options) ->
  if Session.get("subPage") == data
    options.fn(this)

Template.home.events
  'click .line-link': (evt) ->
    Session.set("subPage", "line")
    evt.preventDefault()

  'click .hook-link': (evt) ->
    Session.set("subPage", "hook")
    evt.preventDefault()
