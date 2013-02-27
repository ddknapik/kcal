$(document).ready(function(){

	$("#search").autocomplete({
		source: function(request,response ){                     
			$.ajax({
				url: "/search_suggestions",
				data: {
		    	term: request.term,
		    	kcal: request.kcal
		  	},       
		    dataType: "json",                                                                                                                                 
		    success: function( data ){
		    	response( $.map( data, function( item ){
		      	return{
		  	      label: "<strong>" + item.term + "</strong><span class=\"suggestion-label-kcal\">" + item.kcal /10 + " kcal/100g</span>",
		          value: item.term                                
		        }
		      }));
		    }
		  });               
		},
	});

	$[ "ui" ][ "autocomplete" ].prototype["_renderItem"] = function( ul, item) {
		return $( "<li></li>" )
		.data( "item.autocomplete", item )
		.append( $( "<a></a>" ).html( item.label ) )
		.appendTo( ul );
	};

});