@app.config ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->
  $stateProvider
    .state "home",
      url: '/home'
      templateUrl: 'templates/home.html'
  $urlRouterProvider.otherwise('home')
]
