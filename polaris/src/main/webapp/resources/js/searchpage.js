const likeimgswList = document.querySelectorAll(".likeimgsw");

likeimgswList.forEach(function(likeimgsw) {
    likeimgsw.addEventListener("click", function(event) {
        event.preventDefault();

        const likeimg1 = this.querySelector(".likeimg1");
        const likeimg2 = this.querySelector(".likeimg2");

        if (likeimg1.style.display === "none") {
            likeimg1.style.display = "block";
            likeimg2.style.display = "none";
        } else {
            likeimg1.style.display = "none";
            likeimg2.style.display = "block";
        }
    });
});

var startIdx = 10; 
var limit = 10; 

    var searchResults = document.querySelectorAll(".book-box"); // 검색 결과 요소들
    var loadMoreButton = document.getElementById("loadMoreButton");

    var startIndex = 10; // 시작 인덱스 값
    var showCount = 10; // 한 번에 보여줄 개수

    function showNextResults() {
        for (var i = startIndex; i < startIndex + showCount; i++) {
            if (searchResults[i]) {
                searchResults[i].style.display = "block";
            }
        }

        startIndex += showCount; // 시작 인덱스 값 갱신

        // 숨겨진 결과가 더 이상 없을 경우 더보기 버튼 숨기기
        if (startIndex >= searchResults.length) {
            loadMoreButton.style.display = "none";
        }
    }

    // 초기에 처음 10개의 결과만 보이도록 설정
    for (var i = 0; i < searchResults.length; i++) {
        if (i >= 10) {
            searchResults[i].style.display = "none";
        }
    }

    // "더보기" 버튼 클릭 시 추가 결과 표시
    loadMoreButton.addEventListener("click", showNextResults);
