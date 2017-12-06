window.addEventListener("load", function() {
  $("li.tab").on("click", function() {
    $("li.tab.selected").removeClass("selected");
    $(this).addClass("selected");
    $(".contents div").hide();
    $("." + this.id).show();
  });
});