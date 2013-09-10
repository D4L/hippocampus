Array.prototype.unique = ->
  @filter (e, i) =>
    @lastIndexOf(e) == i
