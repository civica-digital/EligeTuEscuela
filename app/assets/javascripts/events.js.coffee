# Track application events with google Analytics
$(() ->
  $(".js-search-form-home").on("submit", (event) ->
    GoogleAnalytics.trackEvent("Search", "Home")
  )
  $(".js-search-form-results").on("submit", (event) ->
    GoogleAnalytics.trackEvent("Search", "ResultsList")
  )
  $(".js-filter-form").on("submit", (event) ->
    filters = $(this).find("input:checkbox:checked").map(->
      return $(this).val()
    ).get()
    filtersString = filters.join(",")
    GoogleAnalytics.trackEvent("Search", "Filter", filtersString)
  )
)
