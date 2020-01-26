$( function() {
  $( '#user_name' ).autocomplete({
    autoFocus: true,
    source: "/images/auto_complete.json",
    minLength: 1

  });
});
