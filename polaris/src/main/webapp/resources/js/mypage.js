function deleteBtn(){
	let bookimg = document.querySelector('.deleteBtn');
	if(bookimg){
		bookimg.remove();
	}
}


function returnBook(bookcode, num) {
    $.ajax({
        url: '/bookloan',
        method: 'POST', 
        data: { bookcode: bookcode, num: num }, // 서버로 보낼 데이터
        success: function(response) {
            console.log('책 반납이 완료되었습니다.');
        },
        error: function(xhr, status, error) {
            
            console.log('책 반납에 실패하였습니다.');
           	history.back();
        }
    });
    
    return false; 
}


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
		listPageNum=0;
		document.getElementById("prev-list-btn").click();
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
						if(hg_number>0) reviewList+=`<button class="likeBox-detail-like active" onclick="reviewLike('${bookcode}',${datas[i].num},${i})">
					   					<img alt="like" class="review-like-images" src="resources/images/like-detail.png"><span class="review-like-count">${datas[i].relike}</span>
				   			 		</button>`;
						else reviewList+=`<button class="likeBox-detail-like" onclick="reviewLike('${bookcode}',${datas[i].num},${i})">
					   					<img alt="like" class="review-like-images" src="resources/images/dislike-detail.png"><span class="review-like-count">${datas[i].relike}</span>
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
		pgbtn_prev.classList.remove("active");
		return false;
	}
	if(listPageNum>Math.floor(allReviewDatas/5))
	{
		listPageNum=Math.floor(allReviewDatas/5);
		pgbtn_next.classList.remove("active");
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

	if(listPageNum==Math.floor(allReviewDatas/5)) pgbtn_next.classList.remove("active");
	else pgbtn_next.classList.add("active");
}
