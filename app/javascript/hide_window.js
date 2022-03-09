window.addEventListener("load", hide_window, false);

function hide_window() {
  if (document.getElementById('btn-close') !== null) {
    document.getElementById('btn-close').addEventListener('click', function () {
      document.getElementById('win-message').style.display = 'none';
    });
  }
}

let search = document.getElementById('search');
search.addEventListener('keyup', function () {
  let block = document.getElementById('conteiner');
  $.ajax({
    type:"get",
    url:'http://localhost:3000/ajax/show',
    data:{'search' :search.value},
    cache:false,
    success:function(data){
      //console.log(data);
      block.innerHTML = data;
    }
  });
});
