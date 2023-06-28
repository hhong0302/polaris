$(function(){
	$('.eye').click(function(){
        if($(this).hasClass('active')){
            $(this).removeClass("active");
            $(this).find('.fa-solid').removeClass('fa-eye').addClass('fa-eye-slash');
          $('.pass-area').attr('type', 'password');
        }else{    
          $(this).addClass("active");
          $(this).find('.fa-solid').removeClass('fa-eye-slash').addClass('fa-eye');
          $('.pass-area').attr('type', 'text');
        }  
       });
});