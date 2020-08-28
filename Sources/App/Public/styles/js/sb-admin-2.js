(function($) {
  "use strict"; // Start of use strict

  // Toggle the side navigation
  $("#sidebarToggle, #sidebarToggleTop").on('click', function(e) {
    $("body").toggleClass("sidebar-toggled");
    $(".sidebar").toggleClass("toggled");
    if ($(".sidebar").hasClass("toggled")) {
      $('.sidebar .collapse').collapse('hide');
    };
  });

  // Close any open menu accordions when window is resized below 768px
  $(window).resize(function() {
    if ($(window).width() < 768) {
      $('.sidebar .collapse').collapse('hide');
    };

    // Toggle the side navigation when window is resized below 480px
    if ($(window).width() < 480 && !$(".sidebar").hasClass("toggled")) {
      $("body").addClass("sidebar-toggled");
      $(".sidebar").addClass("toggled");
      $('.sidebar .collapse').collapse('hide');
    };
  });

  // Prevent the content wrapper from scrolling when the fixed side navigation hovered over
  $('body.fixed-nav .sidebar').on('mousewheel DOMMouseScroll wheel', function(e) {
    if ($(window).width() > 768) {
      var e0 = e.originalEvent,
        delta = e0.wheelDelta || -e0.detail;
      this.scrollTop += (delta < 0 ? 1 : -1) * 30;
      e.preventDefault();
    }
  });

  // Scroll to top button appear
  $(document).on('scroll', function() {
    var scrollDistance = $(this).scrollTop();
    if (scrollDistance > 100) {
      $('.scroll-to-top').fadeIn();
    } else {
      $('.scroll-to-top').fadeOut();
    }
  });

  // Smooth scrolling using jQuery easing
  $(document).on('click', 'a.scroll-to-top', function(e) {
    var $anchor = $(this);
    $('html, body').stop().animate({
      scrollTop: ($($anchor.attr('href')).offset().top)
    }, 1000, 'easeInOutExpo');
    e.preventDefault();
  });



// $("#danger-alert").hide();

// $("#RegisterAccount").click(function showAlert() {
//     $("#danger-alert").fadeTo(2000, 500);
// });


var hiddenBox = $( "#danger-alert" );

  $("#RegisterAccount").on('click', function(e) {
    // hiddenBox.show();
    var firstName = $("#exampleFirstName").val();
    var lastName = $("#exampleLastName").val();
    var email = $("#exampleInputEmail").val();
    var password = $("#exampleInputPassword").val();
    var repeatPassword = $("#exampleRepeatPassword").val();

    $.ajax({
    type: 'POST',
    url: 'users',
    data: {
      firstName : firstName,
      lastName : lastName,
      emailAddress : email,
      password : repeatPassword
    },
  }).done(function(data){
    var user = data;
    alert('你好'+ user['lastName'] + '创建成功')

}).fail(function(xmlHttpRequest, statusText, errorThrown) {
    alert(
      'Your form submission failed.\n\n'
        + 'XML Http Request: ' + JSON.stringify(xmlHttpRequest)
        + ',\nStatus Text: ' + statusText
        + ',\nError Thrown: ' + errorThrown);
  });
  });

})(jQuery); // End of use strict
