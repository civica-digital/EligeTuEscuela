# Track application events with google Analytics
$(() ->
  $(".js-search-form-home").on("submit", (event) ->
    GoogleAnalytics.trackEvent("Search", "Home")
  )
  $(".js-search-form-results").on("submit", (event) ->
    GoogleAnalytics.trackEvent("Search", "ResultsList")
  )
)
