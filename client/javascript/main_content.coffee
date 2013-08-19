Template.mainContent.ifPageIs = (data, options) ->
  if Session.get("page") == data
    options.fn(this)

