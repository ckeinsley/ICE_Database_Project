/** namespace. */
var rh = rh || {}
rh.mq = rh.mq || {}

/** Tracks the editing state */
rh.mq.editing = false
rh.mq.deleting=false

/** Set up the click listners for the page */
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
	$("#add-order").click(function(){
		$("#insert-order-modal .modal-title").html("Add a New Order");
		$("#insert-order-modal button[type=submit]").html("Add Order");
		
	});
	$(".edit-order").click(function(){
		$("#insert-order-modal .modal-title").html("Edit an order");
		$("#insert-order-modal button[type=submit]").html("Update Order");
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
};


/**Main*/
$(document).ready(function(){
	rh.mq.enableButtons();
	// rh.mq.attachEventHandlers();
})