/**
 * everyWhere에서 사용하게될 alert창! 
 */

function everywhereAlert(alertTitle, alertMessage){
	//alert(alertTitle+"FF"+alertMessage)
	$("body").append("<div id='dialog-message' class='everywhereAlert' style='z-index:99999!important;'></div>");
	$(".everywhereAlert").attr("title", alertTitle).append("<p></p>");
	$(".everywhereAlert>p").append("<span id='everywhereAlertSpan' class='ui-icon ui-icon-circle-check' style='float:left; margin:0 7px 50px 0;'></span>").text(alertMessage);
	  $(function() {
		    $( "#dialog-message" ).dialog({
		      modal: true,
		      buttons: {
		        Ok: function() {
		          $( this ).dialog( "close" );
		        }
		      }
		    });
		  });
}