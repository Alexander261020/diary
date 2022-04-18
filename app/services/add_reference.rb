class AddReference
  def self.call(order, params)

    car = Cargo::Car.find(params[:car_id]) if params[:car_id].present?
    driver = Cargo::Driver.find(params[:driver_id]) if params[:driver_id].present?
    carrier = Cargo::Carrier.find_by(name: params[:carrier_id]);
    customer = Cargo::Customer.find_by(name: params[:customer_id]);

    town_from = Cargo::Town.find(params[:town_from_id_h]) if params[:town_from_id_h].present?
    town_in = Cargo::Town.find(params[:town_in_id_h]) if params[:town_in_id_h].present?

    order.car = car if car.present?
    order.driver = driver if driver.present?
    order.customer = customer if customer.present?
    order.carrier = carrier if carrier.present?
    order.town_from = town_from if town_from.present?
    order.town_in = town_in if town_in.present?

    if params[:payment_id].present?
      payment = Cargo::Payment.find params[:payment_id]
      payment.update(sum: params[:sum], sin: params[:sin]) if params[:sum].present?
    else
      Cargo::Payment.create(sum: params[:sum], sin: params[:sin], order: order) if params[:sum].present?
    end
  end
end
