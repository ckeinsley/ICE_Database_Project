/** namespace. */
var rh = rh || {}
rh.mq = rh.mq || {}

/** Tracks the editing state */
rh.mq.editing = false
rh.mq.deleting=false

rh.mq.enableButtons = function() {
	// $('#add-quote-modal').on('show.bs.modal',function(){
	// 	$("input[name='quote']").focus();
	// });
	$("#toggle-edit").click(function() {
		if (rh.mq.editing) {
			rh.mq.editing = false;
			$(".edit-actions").addClass("hidden");
			$("#change").attr("value","POST");
			$(this).html("Edit");
		} else {
			rh.mq.editing = true;
			$(".edit-actions").removeClass("hidden");
			$("#change").attr("value","PUT");
			$(this).html("Done");
		}
	});

	$('.delete').click(function(){
		rh.mq.deleting=true;
		$("#del").attr("value","DELETE");
		$("#change").attr("value","NOT");
		console.log("entity_key =");
	});

	$('.revert-del').click(function(){
		rh.mq.deleting=false;
		$("#del").attr("value","POST");
		$("#change").attr("value","PUT");
	});
	// $("#add-quote").click(function(){
	// 	$("#insert-quote-modal .modal-title").html("Add a MovieQuote");
	// 	$("#insert-quote-modal button[type=submit]").html("Add Quote");
	// 	$("#insert-quote-modal input[name=quote]").val("");
	// 	$("#insert-quote-modal input[name=movie]").val("");
	// 	$("#insert-quote-modal input[name=entity_key]").val("").prop("disabled",true);
	// 	rh.mq.hideNavbar();
	// });
	// $(".edit-movie-quote").click(function(){
	// 	$("#insert-quote-modal .modal-title").html("Edit a MovieQuote");
	// 	$("#insert-quote-modal button[type=submit]").html("Update Quote");
	// 	var quote=$(this).find(".quote").html();
	// 	var movie=$(this).find(".movie").html();
	// 	var entityKey=$(this).find(".entity_key").html();
	// 	$("#insert-quote-modal input[name=quote]").val(quote);
	// 	$("#insert-quote-modal input[name=movie]").val(movie);
	// 	$("#insert-quote-modal input[name=entity_key]").val(entityKey).prop("disabled",false);
	// });
	// $(".delete-movie-quote").click(function(){
	// 	var entityKey=$(this).find(".entity_key").html();
	// 	console.log("entity_key ="+entityKey);
	// 	$("#delete-quote-modal input[name=entity_key]").val(entityKey).prop("disabled",false);
	// });
};



// /**Events*/
// rh.mq.attachEventHandlers=function(){
// 	$('#insert-quote-modal').on('show.bs.modal',function(){
// 		$("input[name='quote']").focus();
// 	});
// };

/**Main*/
$(document).ready(function(){
	rh.mq.enableButtons();
	// rh.mq.attachEventHandlers();
})