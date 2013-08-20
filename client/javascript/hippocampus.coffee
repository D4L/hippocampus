oneDay = 1000 * 60 * 60 * 24
Session.set("page", "home")

resetError = (evt) ->
  $(evt.target).parent("form").find(".error").html("")

Template.user.username = ->
  Meteor.user().username

Template.user.events
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

  'focus .login-user input' : resetError
  'focus .create-user input' : resetError

Template.hook.userHook = ->
  Bites.find
    user_id: Meteor.user()._id
    next_recall_at: {$lt: new Date()}

Template.hookBite.events
  'click .recall' : (evt) ->
    Bites.update
      _id: @_id
      {
        $set:
          next_recall_at:       new Date(@next_recall_at.getTime() + oneDay * @next_recall_interval)
        $inc:
          next_recall_interval: 1
      }
    evt.preventDefault()