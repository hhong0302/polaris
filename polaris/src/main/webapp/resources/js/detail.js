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
			location.reload();
		},
		error: function() {
			alert("insert error");
		}
	});
}

function loanReject(){
	alert("책 대여는 한번에 3개까지 가능합니다.");
}

/***** 대여하기 *****/
function loanBook(bookcode, userid, booktitle, author, publisher) {
	$.ajax({
		url: "detailbookloan",
		type: 'GET',
		data: {
			bookinfo: bookcode,
			userid: userid,
			booktitle: booktitle,
			author: author,
			publisher: publisher
		},
		success: function(data) {
			location.reload();
		},
		error: function() {
			alert("detailbookloan error");
		}
	});
}
