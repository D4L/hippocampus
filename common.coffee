@oneDay = 1000 * 60 * 60 * 24

Array.prototype.unique = ->
  @filter (e, i) =>
    @lastIndexOf(e) == i
