jQuery ->
    $('#apis').imagesLoaded ->
        $('#apis').masonry itemSelector: ".box"

		if $('.pagination').length
			$(window).scroll ->
				url = $('.pagination .next_page a').attr('href')
				if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
					 # What to do at the bottom of the page
				   $('.pagination').text("Fetching more APIs...")
				   $.getScript(url)
				$(window).scroll()
