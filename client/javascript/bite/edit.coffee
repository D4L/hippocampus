Template.biteEdit.selectedBite = ->
  Session.get("selectedBite")

Template.biteEdit.events
  'click .cancel' : (evt) ->
    Session.set("page", "all-bite")
    evt.preventDefault()

  'click .save' : (evt) ->
    Session.set("page", "all-bite")
    evt.preventDefault()
