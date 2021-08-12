# frozen_string_literal: true

cinema_halls_list = [
 { name: 'Tokyo', capacity: 200},
 { name: 'Yokohama', capacity: 100},
 { name: 'Osaka', capacity: 100},
 { name: 'Nagoya', capacity: 100},
 { name: 'Sapporo', capacity: 100},
 { name: 'Kobe', capacity: 50},
 { name: 'Kyoto', capacity: 50},
 { name: 'Fukuoka', capacity: 50},
 { name: 'Kawasaki', capacity: 50},
 { name: 'Hiroshima', capacity: 20}
]
                                 
cinema_halls_list.each do |cinema_hall_parameters|
  cinema_hall = CinemaHall.create(cinema_hall_parameters)
  seats = CinemaHalls::GenerateSeats.new.generate_seats(cinema_hall.capacity)

  seats.each do |seat|
    cinema_hall.seats.create(code: seat)
  end
end
