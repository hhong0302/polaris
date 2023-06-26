
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
	hg_pwinput[i].addEventListener("focusout",function()
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
//ID