Template.user.username = ->
  Meteor.user().username

Template.user.events
  'click .logout' : (evt) ->
    Meteor.logout()
    evt.preventDefault()
  'submit .create-user' : (evt) ->
    form = $(evt.target)
    username = form.find("input[name=username]").val()
    password = form.find("input[name=password]").val() || ""
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

Template.list.userItems = ->
  Items.find
    user_id: Meteor.user()._id

Template.list.events
  'submit .add-item' : (evt) ->
    form = $(evt.target)
    name = form.find("input[name=name]").val()
    if name == ""
      form.find(".error").text( "Must enter name" )
    else
      Items.insert
        user_id:  Meteor.user()._id
        name:     name
    evt.preventDefault()
