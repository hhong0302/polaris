  function submitSearch() {
    var searchInput = document.getElementById('searchInput');
    var query = searchInput.value;

    var searchUrl = 'search?query=' + encodeURIComponent(query);
    window.location.href = searchUrl;
  }