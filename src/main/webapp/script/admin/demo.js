function demoControl() {
	var widget = $("table");
	var headers = widget.ariaSorTable("option", "headers");
	var colsToHide = widget.ariaSorTable("option", "colsToHide");
		var html = 	'<div id="ui-table-control">';
		html +=		'	<fieldset class="ui-widget-content ui-corner-all" style="border-width: 0px;">';
		html +=		'		<form id="search">';
/*		html +=		'			<label class="ui-corner-all" for="search-field">Search</label>';*/
		html +=		'			<input type="text" id="search-field" class="text ui-widget-content ui-corner-all" />';
		html +=		'			<input type="submit" id="submit" value="Search" class="submit ui-state-default ui-corner-all" />';
		html +=		'		</form>';
		html +=		'	</fieldset>';
		html +=		'</div>';
	$("#wrapper").append(html);
	var controlWrapper = $("#ui-table-control");
	
	// Row Search
	var search = controlWrapper.find("#search")
	search.find("input:submit")
		.bind("mouseenter", function(){ $(this).addClass('ui-state-hover'); })
		.bind("mouseleave", function(){ $(this).removeClass('ui-state-hover'); })
		.bind("focus", function(){ $(this).addClass('ui-state-focus'); })
		.bind("blur", function(){ $(this).removeClass('ui-state-focus'); });

	search.find("#submit").click( function (event) {
		event.preventDefault();
		var query = search.find("input:text").val();
		var originalData = widget.ariaSorTable("option", "originalData");
		var colsToHide = widget.ariaSorTable("option", "colsToHide");
		var tableData = [];
		var xIndex = 0;
		for (var x = 0; x < originalData.length; x++) {
			var found = false;
			var temp = [];
			for (var y = 0; y < originalData[x].length; y++) {
				if (originalData[x][y].search(query) != -1) {
					found = true;
				}
				if (!colsToHide[y]) temp.push(originalData[x][y]);
			}
			if (found) {
				tableData[xIndex] = [];
				tableData[xIndex] = temp;
				xIndex++;
			}
		}
		widget.ariaSorTable("option", "tableData", tableData);
		widget.ariaSorTable("option", "rowsToShow", tableData.length);
		widget.ariaSorTable('setHTML', 1);
		$(".ui-table-pager").fadeOut();
		$("#ui-table-control #colSelect").parent().fadeOut();

	});
}