$(function(){
    $('.change-b').click(function(){
        $('.change-b').toggleClass('active');
        if($('.change-b').hasClass('active')){
            $('.change-b').text("수정 취소");
            $('#new-birth').val('');
            $('.change-b').css("backgroundColor", "#797979");
            $('.changeBirthArea').css("display","block");

        }else{
            $('.change-b').text("변경하기");
            $('.change-b').css("backgroundColor", "#3345a4");
            $('.changeBirthArea').css("display","none");

        }
    })
})

const nowPass = document.getElementById('now-pass');
const newPass = document.getElementById('new-pass');
const rePass = document.getElementById('re-pass');

const currentPass = document.getElementById('current-pass');

const passcheckno = document.getElementsByClassName('passcheckno')[0];
const newpassno = document.getElementsByClassName('newpassno')[0];
const renewpassno = document.getElementsByClassName('renewpassno')[0];

let passcheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;

document.addEventListener('keyup', function(){
    if(nowPass.value == currentPass.value || nowPass.value == ''){
        passcheckno.style.display = 'none';
    }else{
        passcheckno.style.display = 'flex';
    }
});
document.addEventListener('keyup', function(){
    if(passcheck.test(newPass.value) || newPass.value == ''){
        newpassno.style.display = 'none';
    }else{
        newpassno.style.display = 'flex';
    }
});
document.addEventListener('keyup', function(){
    if(rePass.value == newPass.value || rePass.value == ''){
        renewpassno.style.display = 'none';
    }else{
        renewpassno.style.display = 'flex';
    }
});

function changePass(){
    if(nowPass.value == ''){
        alert('현재 비밀번호를 입력하세요.');
        nowPass.focus();
        return false;
    }else if(newPass.value == ''){
        alert('새 비밀번호를 입력하세요.');
        newPass.focus();
        return false;
    }else if(rePass.value == ''){
        alert('새 비밀번호 확인을 입력하세요.');
        rePass.focus();
        return false;
    }else if(!passcheck.test(nowPass.value)){
        alert("비밀번호를 형식에 맞게 입력하세요.");
        nowPass.focus();
        return false;
    }else if(!passcheck.test(newPass.value)){
        alert("새 비밀번호를 형식에 맞게 입력하세요.");
        newPass.focus();
        return false;
    }else if(nowPass.value == newPass.value){
        alert("이전에 사용했던 비밀번호는 사용할 수 없습니다.");
        newPass.focus();
        return false;
    }
    else{
        document.memberUpdate.submit();
    }
}
function changeBirth(){
    if(document.getElementById('new-birth').value == ''){
        alert("변경할 생년월일을 입력하세요.");
        document.getElementById('new-birth').focus();
        return false;
    }else{
        document.changeBirthArea.submit();
    }
}

