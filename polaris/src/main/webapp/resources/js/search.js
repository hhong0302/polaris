function submitSearch() {
  var searchInput = document.getElementById('searchInput');
  var query = searchInput.value;

  var searchForm = document.getElementById('searchForm');
  searchForm.submit();
}