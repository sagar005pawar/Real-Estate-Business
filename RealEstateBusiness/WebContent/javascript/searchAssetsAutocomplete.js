/**
 * 
 */
$(document).ready(function() {
	
	$("#searchBar").autocomplete({
		
		source: function(request, response){
			$.ajax({
				url: 'BargainCntr?page=searchAutoComplete',
				type: "POST",
				dataType:"json",
				data: 'searchBar='+$("#searchBar").val(),
				success:function(data){
					response(data);
				}
			});
		}
	});
	
});