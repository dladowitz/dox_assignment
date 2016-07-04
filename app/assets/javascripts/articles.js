$(function () {
  $(".pagination").on("click", "a", function () {
    $.get(this.href, null, null, "script");
    return false;
  });

  $('#title').bind('railsAutocomplete.select', function(event, data){
    $('#search-form').submit()
  });
});
