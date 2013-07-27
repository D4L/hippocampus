Template.user.username = ->
  Meteor.user().username

Template.user.events
  'click .logout' : (evt) ->
    Meteor.logout()
    evt.preventDefault()
  'submit .create-user' : (evt) ->
    form = $(evt.target)
    username = form.find("input[name=username]").val()
    password = form.find("input[name=password]").val()
    try
      Accounts.createUser
        "username" : username
        "password" : password
        (error) ->
          if error
            form.find(".error").text( error.reason )
    catch error
      form.find(".error").text( "Must set password" )
    evt.preventDefault()
  'submit .login-user' : (evt) ->
    form = $(evt.target)
    username = form.find("input[name=username]").val()
    password = form.find("input[name=password]").val()
    Meteor.loginWithPassword username, password, (error) ->
      if error
        form.find(".error").text( error.reason )
    evt.preventDefault()

Template.hook.userBites = ->
  Bites.find
    user_id: Meteor.user()._id

Template.hook.events
  'submit .add-bite' : (evt) ->
    form = $(evt.target)
    name = form.find("input[name=name]").val()
    if name == ""
      form.find(".error").text( "Must enter name" )
    else
      Bites.insert
        user_id:          Meteor.user()._id
        name:             name
        next_recall_at:   new Date(new Date().getTime() + 1000 * 60 * 60 * 24)
    evt.preventDefault()

Template.bite.events
  'click .delete' : (evt) ->
    Bites.remove @_id
    evt.preventDefault()

