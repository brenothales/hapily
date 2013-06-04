jQuery ->
  $('#apis').masonry
    itemSelector: ".box"
    isAnimated: true


$ ->
	$('.filter').on 'click', (e) ->
		console.log 'click', this, arguments
		element = $(e.currentTarget)
		e.preventDefault()
		$.ajax {
			url: element.attr('href')
			complete: (xhr, status) ->
				console.log 'complete', this, arguments
				$('#apis').html xhr.responseText
				$('#apis').masonry('reload')
				$('.pagination').hide()
		}

window.something = ->
  console.log this, arguments, 'done jsonp!'

$ -> 
	$('#all-apis').on 'click', (e) ->
		console.log 'click', this, arguments
		element = $(e.currentTarget)
		e.preventDefault()
		$.ajax
      dataType: 'jsonp'
      crossDomain: true
      jsonpCallback: 'something'
      url: element.attr('href')
			complete: (xhr, status) ->
				console.log 'complete', this, arguments
				$('#apis').html xhr.responseText
				$('#apis').masonry('reload')


$ ->
  $('.upvote').on 'click', (e) ->
    console.log 'click', this, arguments
    element = $(e.currentTarget)
    e.preventDefault()
    $.ajax {
      url: element.attr('href')
      complete: (xhr, status) ->
        console.log 'complete', this, arguments
        $('#apis').html xhr.responseText
        $('#apis').masonry('reload')
    }

app = angular.module("Hapily", ["ngResource"])

@SearchCtrl = ($scope, $resource) ->
  Search = $resource('/display/')
  $scope.results = Search.get()