  function submitSearch(event) {
    var searchInput = document.getElementById('searchInput');
    var query = searchInput.value.trim();
    if (query.length === 0) {
      event.preventDefault(); 
    } else {
      var searchForm = document.getElementById('searchForm');
      searchForm.submit();
    }
  }
  function reject() {
	alert("로그인후 이용가능합니다")
}