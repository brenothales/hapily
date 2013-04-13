jQuery ->
		$('#show-faves').imagesLoaded ->
				$('#show-faves').masonry itemSelector: ".box"