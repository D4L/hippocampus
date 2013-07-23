Template.user.username = ->
  Meteor.user().username

Template.user.events
  'click .logout' : (evt) ->
    Meteor.logout()
    evt.preventDefault()
  'submit .create-user' : (evt) ->
    username = $(".create-user > input[name=username]").val()
    password = $(".create-user > input[name=password]").val() || ""
    try
      Accounts.createUser
        "username" : username
        "password" : password
        (error) ->
          if error
            $(".create-user > .error").text( error.reason )
    catch error
      $(".create-user > .error").text( "Must set password" )
    evt.preventDefault()
  'submit .login-user' : (evt) ->
    username = $(".login-user > input[name=username]").val()
    password = $(".login-user > input[name=password]").val()
    Meteor.loginWithPassword username, password, (error) ->
      if error
        $(".login-user > .error").text( error.reason )
    evt.preventDefault()

Template.list.userItems = ->
  Items.find
    user_id: Meteor.user()._id

Template.list.events
  'submit .add-item' : (evt) ->
    name = $(".add-item > input[name=name]").val()
    if name == ""
      $(".add-item > .error").text( "Must enter name" )
    else
      Items.insert
        user_id:  Meteor.user()._id
        name:     name
    evt.preventDefault()
