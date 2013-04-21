$(document).ready(function () { 
	$('.add-review').on('click', function(e) {
		e.preventDefault();
		$('#review-form').show();
	});
	$('#review-form').on('submit', function(e) {
		$('.api-descript').show();
		$('.all-reviews').show();
		$('.add-review').show();
	});
});