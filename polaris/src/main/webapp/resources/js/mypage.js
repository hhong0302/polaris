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
let allReviewDatas=0;	//화면에 보이는 최대 수
let scrollCount=0;

const pastbook = document.getElementsByClassName("choi-past-book-big")[0];
const pgnum_detail = document.getElementsByClassName("pageNum-detail")[0];
const pgbtn_prev = document.getElementsByClassName("prv")[0];
const pgbtn_next = document.getElementsByClassName("nxt")[0];



//지난 대여 목록 총 리스트
function pageAllList(){

	$.ajax({
		url : "pastLoanAllCounter",
		type: "GET",
		dataType: "json",
		async:false,
		contentType: "application/json",
		success : function(datas) {
			let listCount=0;	//초기 리스트 개수. 총 개수가 60보다 적으면 
			let rvButtonList="";	//리스트가 총 몇개인지
		  	if(datas==0)
			{
				rvButtonList+=`<button class="pageNum-pagebtn">1</button>`;
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
					rvButtonList+=`<button class="pageNum-pagebtn" onclick="pageNumBtnClick(${i-1})">${i}</button>`;
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
		}

//1,2,3,4,5 그 버튼
function pageNumBtnClick(listNumber)
{
	const pgNum_pgbtn = document.getElementsByClassName("pageNum-pagebtn");
	let reviewList = "";
$.ajax({
		url : "pageAllList",
		type: "GET",
		dataType: "json",
		data:{"listnum":listNumber},

		async:false,
		contentType: "application/json",
		success : function(datas) {
			for(let i=0;i<datas.length;i++)
				{

					reviewList+=`<div class="choi-past-book">
                    <div class="choi-past-img">
                        <img src="resources/bookimg/${datas.bookcode }.jpg" alt="book">
                    </div>
                    <div class="choi-past-text">
                    	<div class = "choi-past-text-top">
	                        <p>${datas.booktitle}</p>
                    	</div>
    					<div class = "choi-past-text-bottom">
	                        <span>${datas.author }</span>
	                        <span>${datas.publisher }</span>
    					</div>
                    </div>
                </div>`;
			    			
			    }

		},
  		error : function() {
  		console.log("error");
  		}
	});
	pastbook.innerHTML=reviewList;
}
	
//이전,다음 버튼
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
