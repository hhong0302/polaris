
//password
function findPw()
{
	const url = "findpassword";
	const width = 345, height=667;
	let left = (document.body.offsetWidth / 2)-(width / 2);
	let top = (document.body.offsetHeight / 2)-(height / 2);
	left+=window.screenLeft;
	
	window.open(url, "popup", `width=${width}, height=${height}, left=${left}, top=${top}`);
}

const hg_pwinput = document.getElementsByClassName("pw-input");
const hg_findpwalrt = document.getElementsByClassName("hg-findpwalrt");
for(let i=0;i<hg_pwinput.length;i++)
{
	hg_pwinput[i].addEventListener("keyup",function()
	{
		if(hg_pwinput[i].value.replace(/\s/gi, "")=="") hg_findpwalrt[i].classList.add("active");
		else hg_findpwalrt[i].classList.remove("active");
		
		if(i==2)
		{
			if(hg_pwinput[i].value.length<8)
			{
				hg_findpwalrt[i].classList.add("active");
				document.getElementById("findpwbtn").classList.remove("active");
				return false;
			}
		}
		for(let i=0;i<hg_pwinput.length;i++)
		{
			if(hg_pwinput[i].value.replace(/\s/gi, "")=="")
			{
				document.getElementById("findpwbtn").classList.remove("active");
				return false;
			}
		}
		document.getElementById("findpwbtn").classList.add("active");
	})
}
function findPwSubmit()
{
	for(let i=0;i<hg_pwinput.length;i++)
	{
		if(hg_pwinput[i].value.replace(/\s/gi, "")=="")
		{
			hg_findpwalrt[i].classList.add("active");
			return false;
		}
		if(i==2)
		{
			if(hg_pwinput[i].value.length<8)
			{
				hg_findpwalrt[i].classList.add("active");
				return false;
			}
		}
	}
	
	document.findpassword.submit();
}
//password


//ID
function findid()
{
	const url = "findid";
	const width = 345, height=564;
	let left = (document.body.offsetWidth / 2)-(width / 2);
	let top = (document.body.offsetHeight / 2)-(height / 2);
	left+=window.screenLeft;
	
	window.open(url, "popup", `width=${width}, height=${height}, left=${left}, top=${top}`);
}

const mjname = document.getElementById('mj-name');
const mjbirth = document.getElementById('mj-birth');
const mjtel = document.getElementById('mj-tel');

const nameno = document.getElementsByClassName('nameno')[0];
const birthno = document.getElementsByClassName('birthno')[0];
const telno = document.getElementsByClassName('telno')[0];
const findidbtn = document.getElementsByClassName('findid-btn')[0];

mjname.addEventListener('focusout', function(){
	if(mjname.value == ''){
		nameno.style.display = 'block';
	}else{
		nameno.style.display = 'none';
	}
});
mjbirth.addEventListener('focusout', function(){
	if(mjbirth.value == ''){
		birthno.style.display = 'block';
	}else{
		birthno.style.display = 'none';
	}
});
mjtel.addEventListener('focusout', function(){
	if(mjtel.value == ''){
		telno.style.display = 'block';
	}else{
		telno.style.display = 'none';
	}
});

document.addEventListener('focusout', function(){
	if(mjname.value != '' && mjbirth.value != '' && mjtel.value != ''){
		findidbtn.style.backgroundColor = '#4563FF';
	}
});

function findidok(){
	if(mjname.value == ''){
		alert('이름을 입력하세요.');
		mjname.focus();
		return false;
	}else if(mjbirth.value == ''){
		alert('생년월일을 입력하세요.');
		mjbirth.focus();
		return false;
	}else if(mjtel.value == ''){
		alert('휴대폰 번호를 입력하세요.')
		mjtel.focus();
		return false;
	}else{
		document.findid.submit();
	}
}
//ID