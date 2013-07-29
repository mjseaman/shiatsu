$(document).ready(function(){

	$('.edit').on('click',function(){
		console.log("in edit listener")
		showUpdateForm($(this));
	});

})

function showUpdateForm(element) {

	console.log("in showupdateform");

	var row = element.closest('tr');
	var type = row.find('.type').text();
	var form = element.closest('tr').next('.update_form');

	console.log(type);

	element.removeClass('btn-warning');
	element.addClass('btn-default');
	element.text('Cancel');

	row.addClass('info');
	form.removeClass('hide');
}

function hideUpdateForm(element) {

	console.log("in hideupdateform");

	var row = element.closest('tr');
	var type = row.find('.type').text();
	var form = element.closest('tr').next('.update_form');

	console.log(type);

	row.addClass('info');
	form.removeClass('hide');
}