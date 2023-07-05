function submitSearch(event) {
    var searchInput = document.getElementById('searchInput');
    var query = searchInput.value.trim();
    if (query.length === 0) {
    	alert("검색 단어를 입력해주세요.");
        event.preventDefault();
        return false; // 폼 제출 중지
    } else {
        var searchForm = document.getElementById('searchForm');
        searchForm.submit();
        return true; // 폼 제출
    }
}

function reject() {
    alert("로그인 후 이용 가능합니다");
    return false; // 폼 제출 중지
}

const nonClick = document.querySelectorAll(".menu");

