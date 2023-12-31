function delInterest(bookcode){
	 $.ajax({
        url: 'delInterest',
        method: 'GET', 
        data: {"bookcode": bookcode
         }, // 서버로 보낼 데이터
        success: function(response) {
            console.log('찜하기가 삭제 되었습니다.');
            console.log(response);
            $('#deleteBtn').remove();
			alert("취소되었습니다.");
			location.reload();
        },
        error: function(xhr, status, error) {
            
            console.log('찜하기 취소가 실패하였습니다.');
           	alert("다시 시도해주세요");
        }
        

    });
    
    return false; 
}


function returnBook(bookcode, num) {
    $.ajax({
        url: 'bookloan',
        method: 'GET', 
        data: {"bookcode": bookcode, "num": num }, // 서버로 보낼 데이터
        success: function(response) {
            console.log('책 반납이 완료되었습니다.');
            alert ("책 반납이 완료되었습니다.");
            location.reload();
        },
        error: function(xhr, status, error) {
            
            console.log('책 반납에 실패하였습니다.');
           	alert("힝푱");
        }
    });
    
    return false; 
}


//리뷰 리스트 부분
let listPageNum=0;
let listType;
let allReviewDatas=0;	//화면에 보이는 최대 수
let scrollCount=0;

const pastbook = document.getElementsByClassName("choi-past-book-big");
const pgnum_detail = document.getElementsByClassName("pageNum-detail")[0];
const pgbtn_prev = document.getElementsByClassName("prv")[0];
const pgbtn_next = document.getElementsByClassName("nxt")[0];



//지난 대여 목록 총 리스트
function pageAllList(userid){

	$.ajax({
		url : "pastLoanAllCounter",
		type: "GET",
		dataType: "json",
		data: {"userid":userid},
		async:false,
		contentType: "application/json",
		success : function(datas) {
			let listCount=0;	//초기 리스트 개수. 총 개수가 60보다 적으면 
			let rvButtonList="";	//리스트가 총 몇개인지
		  	if(datas==0)
			{
				rvButtonList+=`<button class="pageNum-pagebtn ">1</button>`;
			}
			else
			{
				allReviewDatas=Math.ceil(datas/12);
				
				if(datas<60) listCount=Math.ceil(datas/12);

				else
				{
					listCount=5;
					pgbtn_next.classList.add("active");
				}
				for(let i=1;i<=listCount;i++)
				{
					rvButtonList+=`<button class="pageNum-pagebtn " onclick="pageNumBtnClick(${i-1}, '${userid}')">${i}</button>`;
				}
			}
				pgnum_detail.innerHTML=rvButtonList;
  		},
  		error : function() {
  		console.log("error");
  		}
		});
		document.getElementsByClassName("pageNum-pagebtn")[0].click();

		//페이지 처음에 1페이지로 가는거
		
		$('.pageNum-pagebtn').click(function(e){
		    $('.pageNum-pagebtn').removeClass('active');
		    $(this).toggleClass('active');
		})
		}

//지난 대여 1,2,3,4,5 그 버튼
function pageNumBtnClick(listNumber, userid)
{
	const pgNum_pgbtn = document.getElementsByClassName("pageNum-pagebtn");
	let reviewList = "";
	let pastList = "";
$.ajax({
		url : "pageAllList",
		type: "GET",
		dataType: "json",
		data:{"listnum":listNumber, "userid":userid},
		async:false,
		contentType: "application/json",
		success : function(datas) {
			
			for(let i=0;i<datas.length;i++){
			if(i<6)
				{

					reviewList+=`<div class="choi-past-book">
                    <div class="choi-past-img">
                        <img src="resources/bookimg/${datas[i].bookcode }.jpg" alt="book">
                    </div>
                    <div class="choi-past-text">
                    	<div class = "choi-past-text-top active">
	                        <p>${datas[i].booktitle}</p>
                    	</div>
    					<div class = "choi-past-text-bottom">
	                        <span>${datas[i].author }</span>
	                        <span>${datas[i].publisher }</span>
    					</div>
                    </div>
                </div>`;
			
			    }
			    else{
			    
			    	pastList+=`<div class="choi-past-book">
                    <div class="choi-past-img">
                        <img src="resources/bookimg/${datas[i].bookcode }.jpg" alt="book">
                    </div>
                    <div class="choi-past-text">
                    	<div class = "choi-past-text-top active">
	                        <p>${datas[i].booktitle}</p>
                    	</div>
    					<div class = "choi-past-text-bottom">
	                        <span>${datas[i].author }</span>
	                        <span>${datas[i].publisher }</span>
    					</div>
                    </div>
                </div>`;
			    
			    }
			    
			    }

		},
  		error : function() {
  		console.log("error");
  		}
	});
	pastbook[0].innerHTML = reviewList;
	pastbook[1].innerHTML = pastList;
	
	
}
	
//지난 대여 이전,다음 버튼
function rvListPrevNxtBtn(hg_number,bookcode)
{

	const pgNum_pgbtn = document.getElementsByClassName("pageNum");

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
	pgnum_detail.innerHTML=rvButtonList;

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


<!-- 찜한상품 -->
const jjimbook = document.getElementsByClassName("choi-jjim-book");
const jjimnum_detail = document.getElementsByClassName("jjim-pageNum-detail")[0];

function jjimLoanAllCounter(){

	$.ajax({
		url : "jjimAllCounter",
		type: "GET",
		dataType: "json",
		async:false,
		contentType: "application/json",
		success : function(datas) {
			let listCount=0;	//초기 리스트 개수. 총 개수가 60보다 적으면 
			let rvButtonList="";	//리스트가 총 몇개인지
		  	if(datas==0)
			{
				rvButtonList+=`<button class="jjim-pageNum-pagebtn active">1</button>`;
			}
			else
			{
				allReviewDatas=Math.ceil(datas/12);
				
				if(datas<60) listCount=Math.ceil(datas/12);

				else
				{
					listCount=5;
					<!-- pgbtn_next.classList.add("active"); -->
				}
				for(let i=1;i<=listCount;i++)
				{
					rvButtonList+=`<button class="jjim-pageNum-pagebtn active" onclick="jjimpageNumBtnClick(${i-1})">${i}</button>`;
				}
			}
				jjimnum_detail.innerHTML=rvButtonList;
  		},
  		error : function() {
  		console.log("error");
  		}
		});
		document.getElementsByClassName("jjim-pageNum-pagebtn")[0].click();
		//페이지 처음에 1페이지로 가는거
		
		jjimpageNumBtnClick(0);
		// 페이지 로딩 시에 첫 번째 페이지를 자동으로 보여주도록 호출
		}
		
		
		
//찜한 상품 1,2,3,4,5 그 버튼
function jjimpageNumBtnClick(listNumber)
{
	const pgNum_pgbtn = document.getElementsByClassName("jjim-pageNum-pagebtn");
	let reviewList = "";
	let pastList = "";
$.ajax({
		url : "jjimAllList",
		type: "GET",
		dataType: "json",
		data:{"listnum":listNumber},
		async:false,
		contentType: "application/json",
		success : function(datas) {

			for(let i=0;i<datas.length;i++){
			if(i<6)

				{

					reviewList+=`<div class="choi-jjim-innerbook">
                    <div class="choi-jjim-img">
                        <img src="resources/bookimg/${datas[i].bookcode }.jpg" alt="book">
                    </div>
                    
                    <div class="choi-jjim-text">
                    	<div class = "choi-close-btn">
                    		<a class = "deleteBtn" onclick = "delInterest('${datas[i].bookcode }');"><img src="resources/images/Vector.png" alt="x" /></a>
                    	</div>
                    	<div class = "choi-jjim-text-top active">
	                        <p>${datas[i].booktitle}</p>
                    	</div>
    					<div class = "choi-jjim-text-bottom">
	                        <span>${datas[i].author }</span>
	                        <span>${datas[i].publisher }</span>
    					</div>
                    </div>
                   </div> `;
			
			    }
			    else{
			    
			    	pastList+=`<div class="choi-jjim-innerbook">
                    <div class="choi-jjim-img">
                        <img src="resources/bookimg/${datas[i].bookcode }.jpg" alt="book">
                    </div>
                    
                    <div class="choi-jjim-text">
                    	<div class = "choi-close-btn">
                    		<a class = "deleteBtn" onclick = "delInterest('${datas[i].bookcode }');"><img src="resources/images/Vector.png" alt="x" /></a>
                    	</div>
                    	<div class = "choi-jjim-text-top active">
	                        <p>${datas[i].booktitle}</p>
                    	</div>
    					<div class = "choi-jjim-text-bottom">
	                        <span>${datas[i].author }</span>
	                        <span>${datas[i].publisher }</span>
    					</div>
                    </div>
                   </div>`;
			    
			    }
			    
			    }

		},
  		error : function() {
  		console.log("error");
  		}
	});
	jjimbook[0].innerHTML = reviewList;
	jjimbook[1].innerHTML = pastList;
}
	
window.onload=function()
{
	jjimLoanAllCounter();
}

	
//찜한 상품 대여 이전,다음 버튼
function jjimListPrevNxtBtn(hg_number,bookcode)
{

	const pgNum_pgbtn = document.getElementsByClassName("pageNum");

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
		rvButtonList+=`<button class="pageNum-pagebtn" onclick="jjimpageNumBtnClick(this,${i-1},'${listType}','${bookcode}')">${i}</button>`;
	}
	jjimnum_detail.innerHTML=rvButtonList;

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

function ready(){
	alert("아직 준비 중인 서비스입니다");
}