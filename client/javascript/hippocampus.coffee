oneDay = 1000 * 60 * 60 * 24
Session.set("page", "home")

resetError = (evt) ->
  $(evt.target).parent("form").find(".error").html("")

Handlebars.registerHelper "ifPageIs", (data, options) ->
  if Session.get("page") == data
    options.fn(this)
  else
    options.inverse(this)

Template.signin.events
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

