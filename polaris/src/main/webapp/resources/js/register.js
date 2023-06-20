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


let idcheck = /^(?=.*[0-9]+)[a-zA-Z][a-zA-Z0-9]{5,20}$/g;
let passcheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;
let passcheck1 = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])/;
let passcheck2 = /(?=.*[0-9]).{8,20}$/;
let emailcheck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
let phonecheck = /[0-9]{11,11}$/;
let birthcheck = /[0-9]{8,8}$/;




userid.addEventListener('focusout', function(){
    if(!idcheck.test(userid.value)){
        idcheckno.style.display = 'flex';
    }else{
        idcheckno.style.display = 'none';
    }
});

userpass.addEventListener('keypress', function(){
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
userpass.addEventListener('keydown', function(){
    if(passcheck1.test(userpass.value)){
        document.querySelector('#check-option1').classList.add('blue');
        document.querySelector(".fa-check").classList.add('blue');
    }else{
            document.querySelector('#check-option1').classList.remove('blue');
            document.querySelector(".fa-check").classList.remove('blue');
    }
});
userpass.addEventListener('keydown', function(){
    if(passcheck2.test(userpass.value)){
        document.querySelector('#check-option2').classList.add('blue');
        document.querySelector(".fa-check").classList.add('blue');
    }else{
            document.querySelector('#check-option2').classList.remove('blue');
            document.querySelector(".fa-check").classList.remove('blue');
    }
})




