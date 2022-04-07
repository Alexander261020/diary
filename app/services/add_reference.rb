class AddReference
  def self.call(order, params)
    car = Cargo::Car.find(params[:car_id]) if params[:car_id].present?
    driver = Cargo::Driver.find(params[:driver_id]) if params[:driver_id].present?
    carrier = Cargo::Carrier.find_by(name: params[:carrier_id]);
    customer = Cargo::Customer.find_by(name: params[:customer_id]);

    order.car = car if car.present?
    order.driver = driver if driver.present?
    order.customer = customer if customer.present?
    order.carrier = carrier if carrier.present?
  end
end
