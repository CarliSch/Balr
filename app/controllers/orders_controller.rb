class OrdersController < ApplicationController
	def index
    @orders = Order.order(:departure_date).all
    render json: @orders.to_json
  end

  def active
    if !params[:q]
      @orders = Order.order(:departure_date).where(active: true)
    else
      @orders = Order.order(:departure_date).where("reference = ? OR client_name = ? OR departure_city = ? OR arrival_city = ?",
        params[:q], params[:q], params[:q], params[:q])
        .where(active: true)
    end
    render json: @orders.to_json
  end

  def refresh
    response = RestClient.get 'https://wakeo-technical-test.s3.eu-west-3.amazonaws.com/api.json'
    json = JSON.parse response

    if !json.nil?
      json.each do |order|
        old_order = Order.find_by(reference: order["client_number"])
        if !old_order.nil?
          old_order.update(departure_date: order["dep_time"])
          old_order.update(arrival_date: order["arr_time"])
          old_order.update(client_name: order["company"])
          old_order.update(departure_city: order["dep_city"])
          old_order.update(arrival_city: order["arr_city"])
        end
      end
    else
      puts "error seeding external API"
    end
  end
end
