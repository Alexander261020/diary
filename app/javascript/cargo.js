if (document.getElementById('customer_id') !== null) {
  search_customer = document.getElementById('customer_id');
  customers_show = document.getElementById('customers_show');
  search_customer.addEventListener('keyup', function () {
    console.log(search_customer.value);

    if (search_customer.value == '') {
      customers_show.style.display = 'none';
    } else {
      customers_show.style.display = 'block';
    }
    $.ajax({
      type:"get",
      url: 'http://'+ document.location.host + '/ajax/customers_show',
      data:{'search_customers' :search_customer.value},
      cache:false,
      success:function(data){
        customers_show.innerHTML = data;

        class_customers = document.getElementsByClassName('class-customer');
        for (var i=0; i < class_customers.length; i++) {
          class_customers[i].addEventListener('click', function () {
            pick_customer(this.getAttribute('id_customer'))
          });
        };
      }
    });
  });
}

function pick_customer(id){
  console.log(id)
}
