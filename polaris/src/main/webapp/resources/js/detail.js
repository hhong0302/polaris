function scroll_move(seq){
    var offset = $("#move" + seq).offset();
    $('html, body').animate({scrollTop : offset.top-60}, 0);
}

$('.container-detail a').click(function(e){
    $('.container-detail a').removeClass('active');
    $(this).toggleClass('active');
})

function navOn() {
    var nowTop = $(window).scrollTop();
    var move1_offset = $('#move1').offset().top;
    var move2_offset = $('#move2').offset().top-100;

    $('.membership-menu ul button').removeClass('active');

    if ( nowTop >=  0 && nowTop < move2_offset) {
    $('a.review>span').removeClass('action');
    $('a.info>span').addClass('action');
    } else if( nowTop >=  move2_offset) {
    $('a.info>span').removeClass('action');
    $('a.review>span').addClass('action');
    } 
    
};
navOn();

$(window).scroll(function() {
    navOn();
});

function reject() {
	alert("로그인후 이용가능합니다")
}


/***** 찜하기 *****/
function interest(bookcode, userid, booktitle, author, publisher) {
	$.ajax({
		url: "insertLike",
		type: 'GET',
		data: {
			bookinfo: bookcode,
			userid: userid,
			booktitle: booktitle,
			author: author,
			publisher: publisher
		},
		success: function(data) {
			$.ajax({
			    url: "detailUserLike",
			    type: 'GET',
			    data: {
			        bookcode: bookcode
			    },
			    success: function(data) {
			    	$.ajax({
			    	url: "detailLikeCount",
			    	type: 'GET',
			    	data: {
			        	bookcode: bookcode
			    	},
			    	success: function(data) {
			        	var likeCount = parseInt(data);
			       		var likeClick = parseInt(data);
			        	var code = bookcode;
			        	if (likeClick === 1) {
			        		$(".likeimg-" + code).attr("src", "resources/images/fillheart.png");
			           		$(".likecount-" + code).text("찜 "+likeCount);			            
			        	} else {
			        		$(".likeimg-" + code).attr("src", "resources/images/emptyheart.png");
			            	$(".likecount-" + code).text("찜 "+likeCount);
			        	}
			    	},
			    	error: function() {
        				alert("likeCount error");
    				}
			});

			},
			    error: function() {
        			alert("userLike error");
    			}
				});
		},
		error: function() {
			alert("insert error");
		}
	});

	
}