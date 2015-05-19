(function($){
  $(function(){

    $('.post-rate').on('click', function(event) {
      var rate_element = $(this);

      $.ajax({  url: rate_element.data('url'),
                type: "POST",
                data: { act: rate_element.data('act') },
                success: function(data) {
                  $(".post-rating").text(String(data));
                }
      });
    });

  }); // end of document ready
})(jQuery); // end of jQuery name space
