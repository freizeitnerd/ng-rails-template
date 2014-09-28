app.config ($httpProvider) ->
  #TODO: This doesn't work when cached
  #authToken = $("meta[name=\"csrf-token\"]").attr("content")
  authToken = 12345
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken