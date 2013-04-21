$(document).ready(function () { 
	$('.add-review').on('click', function(e) {
		e.preventDefault();
		$('#review-form').show();
	});
});