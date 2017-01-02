/**
 * 
 */

$(document).ready(function(){
	$('#login').click(function(){
		$('#errorMessage').text("Validating Please wait...");
		var username=$('#usname').val();
		var password=$('#pass').val();
		
		$.ajax({
			type:'POST',
			url:'UserController?page=LoginPage',
			data:{'name':username, 'pass':password},
			/*$('#errorMessage').text("Validating Please wait..."),*/
			success:function(data){
				if(data=="valid"){
					$(location).attr('href','BargainCntr?page=BuyerLink');
				}
				else if(data=="invalid"){
					
					$('#errorMessage').text("Invalid credentials");
				}
				else{
					$('#errorMessage').text("You are not yet authenticated. Please try after some time");
				}
			}
		});
	});
});

