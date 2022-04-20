module Cargo::OrdersHelper
  def cargo_order_customer_exist(order)
    if order.customer.present?
      text_field_tag 'customer_id', nil, placeholder: "customer", value:  order.customer.name, class: "w-100"
    else
      text_field_tag 'customer_id', nil, placeholder: "customer", class: "w-100"
    end
  end

  def cargo_order_town_from_exist(order)
    html = nil
    if order.town_from.present?
      html = text_field_tag 'town_from_id', order.town_from.title, placeholder: "town in"
      html += hidden_field_tag 'town_from_id_h', order.town_from.id
    else
      html = text_field_tag 'town_from_id', nil, placeholder: "town in"
      html += hidden_field_tag 'town_from_id_h', nil
    end
    html
  end

  def cargo_order_town_in_exist(order)
    html = nil
    if order.town_in.present?
      html = text_field_tag 'town_in_id', order.town_in.title, placeholder: "town in"
      html += hidden_field_tag 'town_in_id_h', order.town_in.id
    else
      html = text_field_tag 'town_in_id', nil, placeholder: "town in"
      html += hidden_field_tag 'town_in_id_h', nil
    end
    html
  end

  def cargo_order_carrier_exist(order)
    if order.carrier.present?
      text_field_tag 'carrier_id', order.carrier.name, placeholder: "carrier", class: "w-100"
    else
      text_field_tag 'carrier_id', nil, placeholder: "carrier", class: "w-100"
    end
  end

  def cargo_order_car_exist(order)
    html = nil
    if order.car.present?
      html = content_tag(:div, "#{order.car.brand} #{order.car.reg_mark}",
        class: "position-relative border border-dark bg-light p-1", id: "car_show")
      html += hidden_field_tag 'car_id', order.car.id
    else
      html = content_tag(:div, "", class: "position-relative border border-dark bg-light p-1", id: "car_show")
      html += hidden_field_tag 'car_id', nil
    end
    html
  end

  def cargo_order_driver_exist(order)
    html = nil
    if order.driver.present?
      html = content_tag(:div, order.driver.name, class: "position-relative border border-dark bg-light p-1 pull-right", id: "driver_show")
      html += hidden_field_tag 'driver_id', order.driver.id
    else
      html = content_tag(:div, "", class: "position-relative border border-dark bg-light p-1 pull-right", id: "driver_show")
      html += hidden_field_tag 'driver_id', nil
    end
    html
  end

  def cargo_order_payment_exist(order)
    html = nil
    if order.payment.present?
      html = number_field_tag 'sum', order.payment.sum, placeholder: "sum", class: "w-100"
      html += hidden_field_tag 'payment_id', order.payment.id
      html += number_field_tag 'sin', order.payment.sin, placeholder: "sin", class: "w-100"
    else
      html = number_field_tag 'sum', nil, placeholder: "sum", class: "w-100"
      html += hidden_field_tag 'payment_id', nil
      html += number_field_tag 'sin', nil, placeholder: "sin", class: "w-100"
    end
    html
  end

  def date_name_folder
    Time.now.strftime("%y-%m-%d")
  end
end
