if Meteor.isClient

  Template.content.username = ->
    Meteor.user().username

  Template.content.events
    'click .logout' : (evt) ->
      Meteor.logout()
      evt.preventDefault()
    'submit .create-user' : (evt) ->
      username = $("input[name=username]").val()
      password = $("input[name=password]").val()
      Accounts.createUser
        "username" : username
        "password" : password
      evt.preventDefault()


if Meteor.isServer
  Meteor.startup ->
    # code to run on server at startup
