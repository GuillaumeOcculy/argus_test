require 'pry'
class DeliveryRouter
  def initialize(restaurants, customers, riders)
    @restaurants  = restaurants
    @customers    = customers
    @riders       = riders

    @orders       = []
  end

  def add_order(params)
    customer = @customers.detect{ |x| x.id == params[:customer] }
    restaurant = @restaurants.detect{ |x| x.id == params[:restaurant] }
    @orders << { customer: customer, restaurant: restaurant }
  end

  def clear_orders(params)
    @orders.delete_if{ |x| x[:customer].id == params[:customer] }
  end

  def route(params)
    @rider = @riders.detect{ |x| x.id == params[:rider] }
    restaurant = @orders.last[:restaurant]
    customer = @orders.last[:customer]
    
    nearest_rider = @riders.min do |rider1, rider2|
      euclidean_distance([restaurant.x, restaurant.y], [rider1.x, rider1.y]) <=> euclidean_distance([restaurant.x, restaurant.y], [rider2.x, rider2.y])
    end

    nearest_rider == @rider ? [restaurant, customer] : []
  end

  def delivery_time(params)
    order = @orders.detect{ |x| x[:customer].id == params[:customer] }
    restaurant = order[:restaurant]
    customer = order[:customer]

    distance_rider_to_restaurant = euclidean_distance([@rider.x, @rider.y], [restaurant.x, restaurant.y])
    time_rider_to_restaurant = (distance_rider_to_restaurant / @rider.speed) * 60

    distance_restaurant_to_customer = euclidean_distance([customer.x, customer.y], [restaurant.x, restaurant.y])
    time_restaurant_to_customer = (distance_restaurant_to_customer / @rider.speed) * 60    

    time_rider_to_restaurant + remaining_time_cooking(restaurant.cooking_time, time_rider_to_restaurant) + time_restaurant_to_customer
  end

  private
  def euclidean_distance(p1, p2)
    sum_of_squares = 0
    p1.each_with_index do |p1_coord, index| 
      sum_of_squares += (p1_coord - p2[index]) ** 2 
    end
    Math.sqrt(sum_of_squares)
  end

  def remaining_time_cooking(cooking_time, rider_time)
    cooking_time > rider_time ? (cooking_time - rider_time).abs : 0
  end
end
