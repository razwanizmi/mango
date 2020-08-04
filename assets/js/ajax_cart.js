function ajaxHandler(e) {
  e.preventDefault();
  var post_url = $(this).attr("action");
  var form_data = $(this).serialize();

  $.post(post_url, form_data, function (resp) {
    $.bootstrapGrowl(resp.message, {
      offset: { from: "top", amount: 60 },
      type: "info",
    });

    $("cart-count").text(resp.cart_count);
  });
}

var ajaxCart = {
  init: function () {
    $(function () {
      $(".cart-form").on("submit", ajaxHandler);
    });
  },
};

export default ajaxCart;
