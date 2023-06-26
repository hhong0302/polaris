
//password
function findPw()
{
	const url = "findpassword";
	const width = 500, height=350;
	let left = (document.body.offsetWidth / 2)-(width / 2);
	let top = (document.body.offsetHeight / 2)-(height / 2);
	left+=window.screenLeft;
	
	window.open(url, "popup", `width=${width}, height=${height}, left=${left}, top=${top}`);
}
//password


//ID

//ID