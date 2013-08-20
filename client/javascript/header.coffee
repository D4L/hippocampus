Template.header.events
  'click .all-memory-link': (evt) ->
    Session.set("page", "all-bite")
    evt.preventDefault()

  'click .add-memory-link': (evt) ->
    Session.set("page", "add-bite")
    evt.preventDefault()

  'click .home-link': (evt) ->
    Session.set("page", "home")
    evt.preventDefault()

  'click .about-link': (evt) ->
    Session.set("page", "about")
    evt.preventDefault()

  'click .logout' : (evt) ->
    Session.set("page", "home")
    Meteor.logout()
    evt.preventDefault()
