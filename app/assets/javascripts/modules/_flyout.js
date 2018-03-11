// Toggles visability of the profile dropdown if present

if (document.querySelector('.flyout')) {
  var flyout = document.querySelector('.flyout');

  document.addEventListener('click', function(e) {
    if (e.target == flyout) {
      flyout.classList.toggle('active');
    } else if (flyout.classList.contains('active')) {
      flyout.classList.remove('active');
    }
  });
}
