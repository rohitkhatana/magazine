# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@registerWithReply = () ->
	$(".showReplyForm").click(() ->
		type = $(this).data("type")
		path = $(this).data("path")
		commentId = $(this).data("comment-id")
		replyForm(path, commentId, type)
	)

@replyForm = (path, commentId, type) ->
	source = $("#replyForm").html()
	template = Handlebars.compile(source)
	debugger
	$(commentNode(commentId)).html(template({path: path, commentId: commentId, type: type}))

commentNode = (commentId) -> 
	return "#comment-" + commentId
