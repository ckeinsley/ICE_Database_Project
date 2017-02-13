/** namespace. */
var rh = rh || {}
rh.mq = rh.mq || {}

/** Tracks the editing state */
rh.mq.editing = false

/** Set up the click listners for the page */
rh.mq.enableButtons = function() {
	// $('#add-quote-modal').on('show.bs.modal',function(){
	// 	$("input[name='quote']").focus();
	// });
	$("#toggle-edit").click(function() {
		if (rh.mq.editing) {
			rh.mq.editing = false;
			$(".edit-actions").addClass("hidden");
			$(this).html("Edit");
		} else {
			rh.mq.editing = true;
			$(".edit-actions").removeClass("hidden");
			$(this).html("Done");
		}
	});
	$("#add-order").click(function(){
		$("#insert-ordee-modal .modal-title").html("Add a New Order");
		$("#insert-order-modal button[type=submit]").html("Add Order");
		
		rh.mq.hideNavbar();
	});
	$(".edit-order").click(function(){
		$("#insert-order-modal .modal-title").html("Edit an order");
		$("#insert-order-modal button[type=submit]").html("Update Order");
		// var name=$(this).find(".name").html();
		// var price=$(this).find(".price").html();
		// var calorie=$(this).find(".calorie").html();
		// var img=$(this).find(".img").html();
		// var description=$(this).find(".description").html();
		// $("#insert-recipe-modal input[name=name]").val(name);
		// $("#insert-recipe-modal input[name=price]").val(price);
		// $("#insert-recipe-modal input[name=calorie]").val(calorie);
		// $("#insert-recipe-modal input[name=calorie]").val(calorie);
		// $("#insert-recipe-modal input[name=description]").val(description);
	});
	// $(".delete-movie-quote").click(function(){
	// 	var entityKey=$(this).find(".entity_key").html();
	// 	console.log("entity_key ="+entityKey);
	// 	$("#delete-quote-modal input[name=entity_key]").val(entityKey).prop("disabled",false);
	// });
};



/**Events*/
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