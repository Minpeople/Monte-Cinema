# frozen_string_literal: true

cinema_hall = CinemaHall.create([{name: 'Suzuki', capacity: 200},
                                 { name: 'Yamata', capacity: 100},
                                 { name: 'Katana', capacity: 50},
                                 { name: 'Chiisai', capacity: 20}])

seats = CinemaHalls::GenerateSeats.new.generate_seats(cinema_hall.capacity)
seats.each do |seat|
    cinema_hall.seats.create(code: seat)
end
