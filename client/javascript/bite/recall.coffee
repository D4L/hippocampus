# TODO globalize this
oneDay = 1000 * 60 * 60 * 24

Template.biteRecall.oneHook = ->
  Bites.findOne
    user_id: Meteor.user()._id
    next_recall_at: {$lt: new Date()}

Template.biteRecall.events
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
