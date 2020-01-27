$( function() {
  $( '#idol_search' ).autocomplete({
    autoFocus: true,
    source: "/images/auto_complete.json",
    minLength: 1

  });
});
