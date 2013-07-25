$(document).ready(function() {
  
  // Comment vote listeners
  $('.commentvote').on('click',function() {
  	var link = $(this);
  	console.log("in comment upvote");
  	$.post('/comment/'+link.data('commentid')+'/upvote').done(function(){
  		console.log("successful comment vote post")
  		link.addClass('hide');
  		link.parent().find('.commentunvote').removeClass('hide');
  	});
  });

  $('.commentunvote').on('click',function() {
  	var link = $(this);
  	console.log("in comment downvote");
  	$.ajax({
  		url: ('/comment/'+link.data('commentid')+'/upvote'),
  		type: 'DELETE'
  	}).done(function(){
  		console.log("successful comment vote delete call");
  		link.addClass('hide');
  		link.parent().find('.commentvote').removeClass('hide');
  	});
  })


  // Post vote listeners
  $('.postvote').on('click',function() {
  	var link = $(this);
  	console.log("in post upvote");
  	$.post('/post/'+link.data('postid')+'/upvote').done(function(){
  		console.log("successful post vote post");
  		console.log(link);
  		link.addClass('hide');
  		link.parent().find('.postunvote').removeClass('hide');
  	});
  });

  $('.postunvote').on('click',function() {
  	var link = $(this);
  	console.log("in post downvote");
  	$.ajax({
  		url: ('/post/'+link.data('postid')+'/upvote'),
  		type: 'DELETE'
  	}).done(function(){
  		console.log("successful post vote delete call");
  		link.addClass('hide');
  		link.parent().find('.postvote').removeClass('hide');
  	});
  });
});
