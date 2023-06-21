const userid = document.getElementById('userid');
const userpass = document.getElementById('userpass');
const reuserpass = document.getElementById('reuserpass');
const username = document.getElementById('username');
const birth = document.getElementById('birth');
const tel = document.getElementById('tel');
const email = document.getElementById('email');

const check0 = document.getElementById('check-option0');
const check1 = document.getElementById('check-option1');
const check2 = document.getElementById('check-option2');


const fregister = document.getElementsByClassName('fregister')[0];



const idcheckno = document.getElementsByClassName('idcheckno')[0];
const passcheckno = document.getElementsByClassName('passcheckno')[0];
const passcheckok = document.getElementsByClassName('passcheckok')[0];
const repasscheckno = document.getElementsByClassName('repasscheckno')[0];
const repasscheckok = document.getElementsByClassName('repasscheckok')[0];
const namecheckno = document.getElementsByClassName('namecheckno')[0];
const birthcheckno = document.getElementsByClassName('birthcheckno')[0];
const telcheckno = document.getElementsByClassName('telcheckno')[0];
const mailcheckno = document.getElementsByClassName('mailcheckno')[0];

const checkbtn = document.getElementById('idcheck');

let idcheck = /^(?=.*[0-9]+)[a-zA-Z][a-zA-Z0-9]{5,20}$/g;
let passcheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;
let passcheck1 = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])/;
let passcheck2 = /(?=.*[0-9]).{8,20}$/;
let emailcheck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
let phonecheck = /[0-9]{11,11}$/;
let birthcheck = /[0-9]{8,8}$/;




userid.addEventListener('keyup', function(){
    if(!idcheck.test(userid.value)){
        idcheckno.style.display = 'flex';
    }else{
        idcheckno.style.display = 'none';
        checkbtn.style.backgroundColor = "blue";
    }
});

userpass.addEventListener('keyup', function(){
    if(!passcheck.test(userpass.value)){
        passcheckno.style.display = "flex";
        passcheckok.style.display = 'none';
    }else{
        passcheckno.style.display = 'none';
        passcheckok.style.display = "flex";
    }

});
reuserpass.addEventListener('focusout', function(){
    if(reuserpass.value == '' && reuserpass.value == userpass.value){
        repasscheckno.style.display = 'none';
        repasscheckok.style.display = 'none';

    }else if(reuserpass.value != userpass.value){
        repasscheckno.style.display = 'flex';
        repasscheckok.style.display = 'none';
        
    }else if(userpass.value == reuserpass.value){
        repasscheckno.style.display = 'none';
        repasscheckok.style.display = 'flex';
    }else{
        return false;
    }
});
username.addEventListener('focusout', function(){
    if(username.value == ''){
        namecheckno.style.display = 'flex';
       
    }else{
        namecheckno.style.display = 'none';
        
    }
});
birth.addEventListener('focusout', function(){
    if(!birthcheck.test(birth.value)){
        birthcheckno.style.display = 'flex';
       
    }else{
        birthcheckno.style.display = 'none';
        
    }
});
tel.addEventListener('focusout', function(){
    if(!phonecheck.test(tel.value)){
        telcheckno.style.display = 'flex';
        
    }else{
        telcheckno.style.display = 'none';
        
    }
});
email.addEventListener('focusout', function(){

    if(!emailcheck.test(email.value)){
        mailcheckno.style.display = "flex";
        
    }else{
        mailcheckno.style.display = 'none';
        
    }
});
userpass.addEventListener('keyup', function(){
    if(passcheck1.test(userpass.value)){
        document.querySelector('#check-option1').classList.add('blue');
        document.querySelector(".fa-check").classList.add('blue');
    }else{
            document.querySelector('#check-option1').classList.remove('blue');
            document.querySelector(".fa-check").classList.remove('blue');
    }
});
userpass.addEventListener('keyup', function(){
    if(passcheck2.test(userpass.value)){
        document.querySelector('#check-option2').classList.add('blue');
        document.querySelector(".fa-check").classList.add('blue');
    }else{
            document.querySelector('#check-option2').classList.remove('blue');
            document.querySelector(".fa-check").classList.remove('blue');
    }
});

document.addEventListener('focusout', function(){
    if(userid.value != '' && userpass.value != '' && reuserpass.value != '' && username.value != '' && birth.value != '' && tel.value != '' && email.value != ''){
        fregister.style.backgroundColor = '#4563ff';
    }
})


function register(){
    if(userid.value == ''){
        alert("아이디를 입력하세요.");
        userid.focus();
        return false;
    }else if(idcheck.test(userid.value)){
        alert("아이디를 형식에 맞게 입력 하세요");
        userid.focus();
        return false;
    }else if(userpass.value == ''){
        alert("비밀번호를 입력하세요.");
        userpass.focus();
        return false;
    }
    else if(passcheck.test(userpass.value)){
        alert("비밀번호를 형식에 맞게 입력 하세요");
        userpass.focus();
        return false;
    }else if(reuserpass.value == ''){
        alert("비밀번호 확인을 입력하세요.");
        reuserpass.focus();
        return false;
    }
    else if(username.value == ''){
        alert("이름를 입력하세요.");
        username.focus();
        return false;
    }
    else if(birth.value == ''){
        alert("생년월일 입력하세요.");
        birth.focus();
        return false;
    }
    else if(tel.value == ''){
        alert("휴대폰 번호를 입력하세요.");
        tel.focus();
        return false;
    }
    else if(email.value == ''){
        alert("이메일을 입력하세요.");
        email.focus();
        return false;
    }else{
        document.registerform.submit();
    }
}



var idck = 0;
$(function(){
    $("#idcheck").click(function(){
        var userid = $("#userid").val();
        $.ajax({
            async: true,
            type: 'POST',
            url: "idcheck?userid="+userid,
            dataType: "json",
            contentType: "application/json; charset=UTF-8",
            success: function(data){
                console.log(data);
                if(data > 0){
                    $(".alreadyid").css("display", "flex");
                    $(".idcheckok").css("display", "none");
                    $(".idcheckno").css("display", "none");
                }else if(data == 0){
                    $(".alreadyid").css("display", "none");
                    $(".idcheckok").css("display", "flex");
                    $(".idcheckno").css("display", "none");
                }else{
                    $(".alreadyid").css("display", "none");
                    $(".idcheckok").css("display", "none");
                    $(".idcheckno").css("display", "flex");
                }
            },
            error: function(error){
                console.log("error : " + error);
            }
        });
    });
}); //jquery

