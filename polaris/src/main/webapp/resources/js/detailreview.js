let reviewCount = 0;

const rv_writespan=document.getElementsByClassName("review-writedspan")[0];
const rv_title=document.getElementById("reviewtitle");
const rvbox_detail = document.getElementsByClassName("reviewBox-detail")[0];
const review_deletebtn=document.getElementsByClassName("review-deletebtn")[0];
const listNav_recent=document.getElementById("recent");
const listNav_like=document.getElementById("like");
const rvbox_detail_num = document.getElementsByClassName("reviewBox-detail")[0].scrollHeight;
const rv_title_value=rv_title.value;
const rvbox_detail_value=rvbox_detail.innerHTML;

window.onload=function()
{
	if(rvbox_detail_num<=95) document.getElementById("rvcontentmoreWatchbtnbox").innerHTML="";
	else document.getElementById("rvcontentmoreWatchbtnbox").innerHTML=`<button type="button" 
	class="rvcontentmoreWatchbtn" onclick="rvmoreWatch(this)">모두보기<i class="fa-solid fa-angle-down"></i>
	</button>`;
	
	listNav_recent.click();
}

rv_title.addEventListener('keydown', function(event) {
  if (event.keyCode === 13) {
	rvbox_detail.focus();
    event.preventDefault();
  };
}, true);

//리뷰 최초 작성
function reviewSubmit()
{
	if(rv_title.value.replace(/\s/gi, "")=="")
	{
		alert("공백을 제외하고 한 글자 이상 입력하세요.");
		return false;
	}
	if(rvbox_detail.value.replace(/\s/gi, "")=="")
	{
		alert("공백을 제외하고 한 글자 이상 입력하세요.");
		return false;
	}
	document.reviewWriteForm.submit();
}

//리뷰작성/수정/삭제 부분
function reviewModify()
{	
	if(reviewCount==0)
	{
		rv_writespan.style.display="none";
		rv_title.setAttribute("type","text");
		rvbox_detail.readOnly=false;
		rvbox_detail.classList.remove("review-writedarea");
		rvbox_detail.classList.remove("active");
		rvbox_detail.classList.add("action");
		document.getElementById("rvcontentmoreWatchbtnbox").innerHTML="";
		rvbox_detail.style.height="130px";
		review_deletebtn.innerHTML="수정 취소";
		reviewCount=1;
	}
	else
	{
		if(rv_title.value.replace(/\s/gi, "")=="")
		{
			alert("공백을 제외하고 한 글자 이상 입력하세요.");
			return false;
		}
		if(rvbox_detail.value.replace(/\s/gi, "")=="")
		{
			alert("공백을 제외하고 한 글자 이상 입력하세요.");
			return false;
		}
		document.reviewModifyForm.submit();
	}
}

function reviewModifyCancel()
{
	if(reviewCount==1)
	{
		rv_writespan.style.display="block";
		rv_title.value=rv_title_value;
		rvbox_detail.value=rvbox_detail_value;
		rv_title.setAttribute("type","hidden");
		rvbox_detail.readOnly=true;
		rvbox_detail.classList.add("review-writedarea");
		rvbox_detail.classList.add("active");
		rvbox_detail.classList.remove("action");
		rvbox_detail.style.height="95px";
		rvbox_detail.scrollTo({ top: 0, left:0}); 
		if(rvbox_detail_num>95)
		{
		document.getElementById("rvcontentmoreWatchbtnbox").innerHTML=`<button type="button" class="rvcontentmoreWatchbtn" onclick="rvmoreWatch(this)">모두보기<i class="fa-solid fa-angle-down"></i></button>`;
		}
		review_deletebtn.innerHTML="리뷰 삭제";
		reviewCount=0;
	}
	else
	{
		//리뷰삭제 메소드
		const hg_bookcode = document.getElementById("hg-bookcode").value;
		let y = confirm("정말로 삭제하시겠습니까?");
		if(y) $.ajax({
		url : "reviewDeleteController",
		type: "GET",
		dataType: "json",
		data:{"bookcode":hg_bookcode},
		async:false,
		contentType: "application/json",
		success : function() {
			
		},
  		error : function() {
  		location.reload();
  		}
		});
	}
}

function rvmoreWatch(e)
{
	if(rvbox_detail.clientHeight==95)
	{
		e.innerHTML= `접기<i class="fa-solid fa-angle-up"></i>`;
		rvbox_detail.style.height=rvbox_detail.scrollHeight+"px";
		rvbox_detail.classList.remove("active");
	}
	else
	{
		e.innerHTML= `모두보기<i class="fa-solid fa-angle-down"></i>`;
		rvbox_detail.style.height="95px";
		rvbox_detail.classList.add("active");
	}
}
//리뷰 작성/수정/삭제 부분

//리뷰 리스트 부분
let listPageNum=0;
let listType;
let allReviewDatas=0;
let scrollCount=0;
const rvcmtcontent = document.getElementsByClassName("reviewComment-content");
const reviewcommentlist = document.getElementsByClassName("reviewcommentlist-detail")[0];
const rvmenu_detail = document.getElementsByClassName("reviewMenu-detail");
const rvtitle_detail = document.getElementsByClassName("reviewTitle-detail");
const pgnum_detail_btnbox = document.getElementsByClassName("pageNum-detail-btnbox")[0];
const pgbtn_prev = document.getElementsByClassName("prv")[0];
const pgbtn_next = document.getElementsByClassName("nxt")[0];

//인기/최신 버튼
function listNav_click(reviewType,bookcode)
{
	let reviewList = "";
	if(reviewType=="recent")
	{
		rvmenu_detail[0].classList.add("action");
		rvtitle_detail[0].classList.add("action");
		rvmenu_detail[1].classList.remove("action");
		rvtitle_detail[1].classList.remove("action");
		listType="recent";
	}
	else//reviewType==relike
	{
		rvmenu_detail[0].classList.remove("action");
		rvtitle_detail[0].classList.remove("action");
		rvmenu_detail[1].classList.add("action");
		rvtitle_detail[1].classList.add("action");
		listType="relike";
	}
		$.ajax({
		url : "reviewController",
		type: "GET",
		dataType: "json",
		data:{"reviewType":reviewType,"bookcode":bookcode},
		async:false,
		contentType: "application/json",
		success : function(datas) {
			let listCount=0;
			let rvButtonList="";
		  	if(datas==null||datas==""||datas==0)
			{
				rvButtonList+=`<button class="pageNum-pagebtn">1</button>`;
			}
			else
			{
				allReviewDatas=Math.ceil(datas.length/5);
				
				if(datas.length<25) listCount=Math.ceil(datas.length/5);
				else
				{
					listCount=5;
					pgbtn_next.classList.add("active");
				}
				for(let i=1;i<=listCount;i++)
				{
					rvButtonList+=`<button class="pageNum-pagebtn" onclick="pageNumBtnClick(this,${i-1},'${listType}','${bookcode}')">${i}</button>`;
				}
			}
				reviewcommentlist.innerHTML=reviewList;
				pgnum_detail_btnbox.innerHTML=rvButtonList;
  		},
  		error : function() {
  		console.log("error");
  		}
		});
		document.getElementsByClassName("pageNum-pagebtn")[0].click();	
}

//1,2,3,4,5 그 버튼
function pageNumBtnClick(e,listNumber,lstType,bookcode)
{
	const pgNum_pgbtn = document.getElementsByClassName("pageNum-pagebtn");
	let reviewList = "";
	$.ajax({
		url : "reviewListController",
		type: "GET",
		dataType: "json",
		data:{"listnum":listNumber,
		"listType":lstType,
		"bookcode":bookcode},
		async:false,
		contentType: "application/json",
		success : function(datas) {
			for(let i=0;i<datas.length;i++)
				{
					reviewList+=`<div class="reviewComment-detail">
			    		<div class="reviewTop-detail">
				    		<div class="reviewInfo-detail">
					    		<h1 class="reviewtitle-detail">
					    			${datas[i].retitle}
					    		</h1>
				    			<textarea class="reviewComment-content active" readonly>${datas[i].recontent}</textarea>
								<div class="moreWatchbtnbox">
									<button class="moreWatchbtn" onclick="moreWatch(this,${i})">모두보기<i class="fa-solid fa-angle-down"></i></button>
				    			</div>
							</div>
			    		</div>
			    		<div class="reviewBottom-detail">
		    				<div class="likeBox-detail-span">
				    			<span class="reviewUser-detail">${datas[i].userid}</span>
								<span id="hg-dottes"></span>
				    			<span class="reviewDate-detail">${datas[i].redate}</span>
			    			</div>`;
			    	$.ajax({
					url : "reviewLikeController",
					type: "GET",
					dataType: "json",
					data:{"bookcode":bookcode,
					"writer":datas[i].userid},
					async:false,
					contentType: "application/json",
					success : function(hg_number) {
						if(hg_number>0) reviewList+=`<button class="likeBox-detail-like active">
					   					<img alt="like" src="resources/images/like-detail.png">${datas[i].relike}
				   			 		</button>`;
						else reviewList+=`<button class="likeBox-detail-like">
					   					<img alt="like" src="resources/images/dislike-detail.png">${datas[i].relike}
				   			 		</button>`;
			  		},
			  		error : function() {
			  		console.log("error");
			  		}
					});
					reviewList+=`</div>
				    	</div>`;
				}
				reviewcommentlist.innerHTML=reviewList;
		},
  		error : function() {
  		console.log("error");
  		}
	});
	for(let i=0;i<rvcmtcontent.length;i++)
	{
		if(rvcmtcontent[i].scrollHeight<=43)
		{
			document.getElementsByClassName("moreWatchbtnbox")[i].innerHTML="";
		}
	}
	
	const reviewUser_detail = document.getElementsByClassName("reviewUser-detail");
	for(let i=0;i<reviewUser_detail.length;i++)
	{
		const reviewUser_detail_innerHTML = reviewUser_detail[i].innerHTML;
		reviewUser_detail[i].innerHTML = reviewUser_detail_innerHTML.substring(0,4)+"****";
	}
	
	const reviewDate_detail = document.getElementsByClassName("reviewDate-detail");
	for(let i=0;i<reviewDate_detail.length;i++)
	{
		const reviewDate_detail_innerHTML = reviewDate_detail[i].innerHTML;
		const after_days = 
		reviewDate_detail_innerHTML.substring(0,reviewDate_detail_innerHTML.indexOf(" ")).replaceAll("-",".");
		const nowDate = new Date();
		const rvDate = new Date(reviewDate_detail_innerHTML);
		hg_minusDate = nowDate - rvDate;
		const hg_years = Math.floor(hg_minusDate / (365*24*60*60*1000));
		const hg_month = Math.floor(hg_minusDate / (30*24*60*60*1000));
		const hg_days = Math.floor((hg_minusDate / (24*60*60*1000))%365);
		const hg_hours = Math.floor((hg_minusDate / (60*60*1000))%24);
		const hg_minutes = Math.floor((hg_minusDate / (60*1000))%60);
		const hg_seconds = Math.floor((hg_minusDate / 1000)%60);

		if(hg_years==0)
		{
		    if(hg_month==0)
		    {
		        if(hg_days==0)
		        {
		             if(hg_hours==0)
		             {
		                 if(hg_minutes==0)
		                 {
		                    reviewDate_detail[i].innerHTML = hg_seconds+"초 전";
		                 }
		                 else
		                 {
		                    reviewDate_detail[i].innerHTML = hg_minutes+"분 전";
		                 }
		             }
		             else
		             {
		                reviewDate_detail[i].innerHTML = hg_hours+"시간 전";
		             }
		         }
		         else
		         {
		             reviewDate_detail[i].innerHTML = after_days;
		         }
		     }
		     else
		     {
		         reviewDate_detail[i].innerHTML = after_days;
		     }
		}
		else
		{
		     reviewDate_detail[i].innerHTML = after_days;
		}
	}
	
	if(scrollCount>0) window.scrollTo({ top: 
	window.pageYOffset+document.getElementById("listTile-detail").getBoundingClientRect().top-70, behavior: "smooth" }); 
	scrollCount=1;
	for(let i=0;i<pgNum_pgbtn.length;i++)
	{
		pgNum_pgbtn[i].classList.remove("active");
	}
	
	e.classList.add("active");
}

//이전,다음 버튼
function rvListPrevNxtBtn(hg_number,bookcode)
{
	/*console.log(Math.floor(allReviewDatas/5));
	console.log(listPageNum);*/
	const pgNum_pgbtn = document.getElementsByClassName("pageNum-pagebtn");
	listPageNum+=hg_number;
	if(listPageNum<0)
	{
		listPageNum=0;
		return false;
	}
	if(listPageNum>Math.floor(allReviewDatas/5)-1)
	{
		listPageNum=Math.floor(allReviewDatas/5-1);
		return false;
	}
	let rvButtonList="";
	for(i=(listPageNum*5)+1;i<=(listPageNum*5)+5;i++)
	{
		if(i>allReviewDatas)
		{
			break;
		}
		rvButtonList+=`<button class="pageNum-pagebtn" onclick="pageNumBtnClick(this,${i-1},'${listType}','${bookcode}')">${i}</button>`;
	}
	pgnum_detail_btnbox.innerHTML=rvButtonList;
	if(hg_number==1)
	{
		pgNum_pgbtn[0].click();
	}
	else
	{
		pgNum_pgbtn[4].click();
	}
	
	if(listPageNum==0) pgbtn_prev.classList.remove("active");
	else pgbtn_prev.classList.add("active");

	if(listPageNum==Math.floor(allReviewDatas/5)-1) pgbtn_next.classList.remove("active");
	else pgbtn_next.classList.add("active");
}

//모두보기 누르면 나왔다 들어갔다 버튼
function moreWatch(e,hg_number)
{
	if(rvcmtcontent[hg_number].clientHeight==43)
	{
		e.innerHTML= `접기<i class="fa-solid fa-angle-up"></i>`;
		rvcmtcontent[hg_number].style.height=rvcmtcontent[hg_number].scrollHeight+"px";
		rvcmtcontent[hg_number].classList.remove("active");
	}
	else
	{
		e.innerHTML= `모두보기<i class="fa-solid fa-angle-down"></i>`;
		rvcmtcontent[hg_number].style.height="43px";
		rvcmtcontent[hg_number].classList.add("active");
	}
}















