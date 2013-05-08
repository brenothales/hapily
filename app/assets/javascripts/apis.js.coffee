jQuery ->
  $('#apis').masonry
    itemSelector: ".box"
    isAnimated: true

		if $('.pagination').length
			$(window).scroll ->
				url = $('.pagination .next_page a').attr('href')
				if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
				  $('.pagination').text("Fetching more APIs...")
				  $.getScript(url)
				$(window).scroll()

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