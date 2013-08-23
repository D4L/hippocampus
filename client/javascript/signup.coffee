Template.signup.events
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
