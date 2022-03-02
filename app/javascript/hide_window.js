window.addEventListener("load", hide_window, false);

function hide_window() {
  if (document.getElementById('btn-close') !== null) {
    document.getElementById('btn-close').addEventListener('click', function () {
      document.getElementById('win-message').style.display = 'none';
    });
  }
}
