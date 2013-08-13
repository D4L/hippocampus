Template.header.events
  'click .home-link': (evt) ->
    Session.set("page", "home")
    evt.preventDefault()

  'click .about-link': (evt) ->
    Session.set("page", "about")
    evt.preventDefault()
