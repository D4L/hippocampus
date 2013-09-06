Template.biteEdit.selectedBite = ->
  Bites.findOne Session.get("selectedBite")

Template.biteEdit.events
  'click .cancel' : (evt) ->
    Session.set("page", "all-bite")
    evt.preventDefault()

  'submit .edit-memory' : (evt) ->
    form = $(evt.target)
    title = form.find("input[name=title]").val()
    content = form.find("[name=content]").val()
    Bites.update Session.get("selectedBite"),
      $set:
        title:    title
        content:  content
    Session.set("page", "all-bite")
    evt.preventDefault()
