$('a.info').click(function(){
    $('a.review>span').removeClass('action');
    $('a.info>span').addClass('action');
});
$('a.review').click(function(){
    $('a.info>span').removeClass('action');
    $('a.review>span').addClass('action');
});
$('a.recent').click(function(){
    $('.listLike-detail').removeClass('action');
    $('a.like>span').removeClass('action');
    $('.listRecent-detail').addClass('action');
    $('a.recent>span').addClass('action');

});
$('a.like').click(function(){
    $('.listRecent-detail').removeClass('action');
    $('a.like>span').removeClass('action');
    $('.listLike-detail').addClass('action');
    $('a.recent>span').addClass('action');
});


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