Template.biteAll.userTagAll = () ->
  JSON.stringify Bites.find
    user_id: Meteor.userId()
  .map (bite) ->
    bite.tag
  # remove the empty tags
  .filter (tag) ->
    tag
  .unique()

Template.biteAll.hasFilterTag = ->
  !Session.equals("filterTag", "")

Template.biteAll.filteredLine = ->
  Bites.find
    user_id:  Meteor.user()._id
    tag:
      $regex : ".*" + Session.get("filterTag") + ".*"

Template.biteAll.line = ->
  Bites.find
    user_id:  Meteor.user()._id

Template.biteAll.events
  'click .delete' : (evt) ->
    Bites.remove @_id
    evt.preventDefault()

  'click .edit' : (evt) ->
    Session.set("page", "edit-bite")
    Session.set("selectedBite", @_id)
    evt.preventDefault()

  'keyup [name="filter-tag"]' : (evt) ->
    Session.set("filterTag", evt.target.value)

