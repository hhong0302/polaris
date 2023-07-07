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


//대여하기
function loanbook(bookcode, booktitle) {
    $.ajax({
        url: "searchLoanBook",
        type: "GET",
        data: { "bookinfo": bookcode, "booktitle": booktitle },
        async: false,
        contentType: "application/json",
        success: function(data) {
            $.ajax({
                url: "searchloanCount",
                type: "GET",
                data: { "bookcode": bookcode, "booktitle": booktitle },
                success: function(data) {
                    var loanStatus = parseInt(data);
                    var code = bookcode;
                    if (loanStatus == 0) {
                        alert("반납하시겠습니까?");
                        location.reload();
                        $(".searchloan-" + code).text("대여하기");                     
                    }else{
                        alert("대여하시겠습니까?");  
                        location.reload();                     
                        $(".searchloan-" + code).text("반납하기");
                    }
                },
                error: function() {
                    alert("에러");
                }
            });
        },
        error: function() {
            alert("에러");
        }
    });
}