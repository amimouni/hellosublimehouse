
$(function() {
  // Smooth scroll
  console.log('initialisation de smoothy');

  $('a[href*=#]:not([href=#])').click(function() {
    console.log('click called', this);
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html,body').animate({
          scrollTop: target.offset().top
        }, 1000);
        return false;
      }
    }
  });
  // Scroll reveal
  window.sr = new scrollReveal();
});
