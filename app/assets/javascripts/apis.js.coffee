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

$ -> 
	$('#all-apis').on 'click', (e) ->
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