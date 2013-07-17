if Meteor.isClient
  console.log("hi client")

if Meteor.isServer
  Meteor.startup ->
    # code to run on server at startup
