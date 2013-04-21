jQuery ->
    $('#apis').imagesLoaded ->
        $('#apis').masonry itemSelector: ".box"

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
		}