$(function(){
	$("#title").click(function(){
		$("#title").css("background-color", "blue");
	});

	$('.actions#todo-submit').on("click", function(){
		var valuesToSubmit = $('form#new_todo').serialize();
		$.ajax({
			type: "POST",
			url: "/todos",
			data: valuesToSubmit,
			dataType: "HTML"
		}).success(function(data) {
			alert("success");
			$("table").append(data);
			return false;
		});
		return false;
	});	
});
