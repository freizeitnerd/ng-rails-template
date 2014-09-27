app.config ($httpProvider) ->
  #TODO: This doesn't work when cached
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken