Template.biteAll.line = ->
  Bites.find
    user_id:  Meteor.user()._id

Template.biteAll.events
  'click .delete' : (evt) ->
    Bites.remove @_id
    evt.preventDefault()

  'click .edit' : (evt) ->
    Session.set("page", "edit-bite")
    Session.set("selectedBite", @)
    evt.preventDefault()
