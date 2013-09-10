oneDay = 1000 * 60 * 60 * 24

Template.biteAdd.events
  'submit .add-memory' : (evt) ->
    form    = $(evt.target)
    title   = form.find("input[name=title]").val()
    content = form.find("[name=content]").val()
    tag = form.find("input[name=tag]").val()
    if title == "" || content == ""
      form.find(".error").text( "Must enter all info" )
    else
      Bites.insert
        user_id:                Meteor.user()._id
        title:                  title
        content:                content
        tag:                    tag
        next_recall_at:         new Date(new Date().getTime() + oneDay)
        next_recall_interval:   2
      form[0].reset()
    evt.preventDefault()

  # TODO: fix resetError
  # 'focus .add-memory input' : resetError
  # 'focus .add-memory textarea' : resetError
