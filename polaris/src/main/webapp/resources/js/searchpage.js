var searchResults = document.querySelectorAll(".book-box"); // 검색 결과 요소들
var loadMoreButton = document.getElementById("loadMoreButton");

let startIndex = 10; // 시작 인덱스 값
const showCount = 10; // 한 번에 보여줄 개수

document.getElementById("nowcount").innerHTML = startIndex;

function showNextResults() {
    for (var i = startIndex; i < startIndex + showCount; i++) {
        if (searchResults[i]) {
            searchResults[i].style.display = "block";
        }
    }

    startIndex += showCount; // 시작 인덱스 값 갱신
    document.getElementById("nowcount").innerHTML = startIndex;

    // 숨겨진 결과가 더 이상 없을 경우 더보기 버튼 숨기기
    if (startIndex >= searchResults.length) {
        loadMoreButton.style.display = "none";
    }
}

// 초기에 처음 10개의 결과만 보이도록 설정
for (var i = 0; i < searchResults.length; i++) {
    if (i >= startIndex) {
        searchResults[i].style.display = "none";
    }
}

// "더보기" 버튼 클릭 시 추가 결과 표시
loadMoreButton.addEventListener("click", showNextResults);



//찜하기 insert,delete
function likeSuccess(bookcode, uid, booktitle, author, publisher) {
    $.ajax({
        url: "searchLike",
        type: 'GET',
        data: {
            bookinfo: bookcode,
            userid: uid,
            booktitle: booktitle,
            author: author,
            publisher: publisher
        },
        success: function(data) {
           location.reload();
        },
        error: function() {
            alert("Error");
        }
    });
}
function rejectloanbook(){
	alert("책 대여는 한번에 3개까지 가능합니다.");
}


//대여하기

function loanbook(bookcode, userid, booktitle, author, publisher) {
	$.ajax({
		url: "searchLoanBook",
		type: 'GET',
		data: {
			bookinfo: bookcode,
			userid: userid,
			booktitle: booktitle,
			author: author,
			publisher: publisher
		},
		success: function(data) {
			location.reload();
		},
		error: function() {
			alert("error");
		}
	});
}