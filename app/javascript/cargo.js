// for customers
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
            pick_customer(this.getAttribute('id_customer'), this.innerHTML)
          });
        };
      }
    });
  });
}
function pick_customer(id, value){
  search_customer = document.getElementById('customer_id');
  search_customer.value = value.trim()
  customers_show = document.getElementById('customers_show');
  customers_show.style.display = "none";
  console.log(id,value)
}
/////////////////////////////////////////////////////
// for carriers
if (document.getElementById('carrier_id') !== null) {
  search_carrier = document.getElementById('carrier_id');
  carriers_show = document.getElementById('carriers_show');
  search_carrier.addEventListener('keyup', function () {
    console.log(search_carrier.value);
    if (search_carrier.value == '') {
      carriers_show.style.display = 'none';
    } else {
      carriers_show.style.display = 'block';
    }
    console.log('http://'+ document.location.host + '/ajax/carriers_show');
    $.ajax({
      type:"get",
      url: 'http://'+ document.location.host + '/ajax/carriers_show',
      data:{'search_carriers' :search_carrier.value},
      cache:false,
      success:function(data){
        carriers_show.innerHTML = data;
        class_carriers = document.getElementsByClassName('class-carrier');
        for (var i=0; i < class_carriers.length; i++) {
          class_carriers[i].addEventListener('click', function () {
            pick_carrier(this.getAttribute('id_carrier'), this.innerHTML)
          });
        };
      }
    });
  });
}


function pick_carrier(id, value){
  search_carrier = document.getElementById('carrier_id');
  search_carrier.value = value.trim()
  carriers_show = document.getElementById('carriers_show');
  carriers_show.style.display = "none";

  //берем машины перевозчика
  $.ajax({
    type:"get",
    url: 'http://'+ document.location.host + '/ajax/cars',
    data:{'id_carrier' :id},
    cache:false,
    success:function(data){
      car_show = document.getElementById('car_show');
      car_show.innerHTML = data
      cars_class = document.getElementsByClassName('cars-class');
      for (var i=0; i < cars_class.length; i++) {
        cars_class[i].addEventListener('click', function () {
          pick_car(this.getAttribute('id_car'), this.innerHTML)
        });
      };
    }
  });

  //берем водителей перевозчика
  $.ajax({
    type:"get",
    url: 'http://'+ document.location.host + '/ajax/drivers',
    data:{'id_carrier' :id},
    cache:false,
    success:function(data){

      driver_show = document.getElementById('driver_show');
      driver_show.innerHTML = data
      drivers_class = document.getElementsByClassName('drivers-class');
      for (var i=0; i < drivers_class.length; i++) {
        drivers_class[i].addEventListener('click', function () {
          pick_driver(this.getAttribute('id_driver'), this.innerHTML)
        });
      };

    }
  });

  cars_drivers = document.getElementById('cars_drivers');
  cars_drivers.style.display = "block";
}

function pick_car(id, value){
  cars = document.getElementById('cars');
  cars.innerHTML = value.trim()
  car_id = document.getElementById('car_id');
  car_id.value = id
}

function pick_driver(id, value){
  drivers = document.getElementById('drivers');
  drivers.innerHTML = value.trim()
  driver_id = document.getElementById('driver_id');
  driver_id.value = id
}
