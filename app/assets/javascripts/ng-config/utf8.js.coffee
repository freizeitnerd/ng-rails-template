# based on following blog: http://mightygio.com/2013/04/integrating-rails-and-angularjs-part-2-model-view-win-controllers-and-routes/
app.config ($httpProvider) ->
  $httpProvider.defaults.transformRequest.push (data, headersGetter) ->
    utf8_data = data
    unless angular.isUndefined(data)
      d = angular.fromJson(data)
      d["_utf8"] = "☃"
      utf8_data = angular.toJson(d)
    utf8_data