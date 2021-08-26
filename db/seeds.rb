# frozen_string_literal: true

cinema_halls_list = [
  { name: 'Tokyo', capacity: 200 },
  { name: 'Yokohama', capacity: 100 },
  { name: 'Osaka', capacity: 100 },
  { name: 'Nagoya', capacity: 100 },
  { name: 'Sapporo', capacity: 100 },
  { name: 'Kobe', capacity: 50 },
  { name: 'Kyoto', capacity: 50 },
  { name: 'Fukuoka', capacity: 50 },
  { name: 'Kawasaki', capacity: 50 },
  { name: 'Hiroshima', capacity: 20 }
]

cinema_halls_list.each do |cinema_hall_parameters|
  cinema_hall = CinemaHall.create(cinema_hall_parameters)
  seats = CinemaHalls::GenerateSeats.new.generate_seats(cinema_hall.capacity)

  seats.each do |seat|
    cinema_hall.seats.create(code: seat)
  end
end

cinema

movie1 = Movie.create(title: 'Harry Potter', duration: 180)
movie2 = Movie.create(title: '~Dzien Swira', duration: 200)
movie3 = Movie.create(title: 'James Bond', duration: 120)
movie4 = Movie.create(title: 'Formula 1 Drive to Survive', duration: 120)
movie5 = Movie.create(title: 'Koe no katachi', duration: 160)

first_screening = Screening.create(movie: movie4, cinema_hall: CinemaHall.find(1), date: Time.new(2021, 9, 18, 10, 0o0))
second_screening = Screening.create(movie: movie2, cinema_hall: CinemaHall.find(2),
                                    date: Time.new(2021, 9, 16, 22, 0o0))
third_screening = Screening.create(movie: movie3, cinema_hall: CinemaHall.find(3), date: Time.new(2021, 9, 20, 18, 30))
fourth_screening = Screening.create(movie: movie2, cinema_hall: CinemaHall.find(4),
                                    date: Time.new(2021, 9, 18, 23, 0o0))
fifth_screening = Screening.create(movie: movie5, cinema_hall: CinemaHall.find(5), date: Time.new(2021, 9, 12, 20, 0o0))

client1 = User.create(email: 'test@asd.pl', role: 'client')
client2 = User.create(email: 'rafaeru@wp.pl', role: 'client')
client3 = User.create(email: 'test@test.pl', role: 'client')

admin1 = User.create(email: 'minpeople@gmail.com', role: 'admin')
admin2 = User.create(email: 'rubycamper@monterail.pl', role: 'admin')

ticket_desk1 = TicketDesk.create
ticket_desk2 = TicketDesk.create
ticket_desk3 = TicketDesk.create
ticket_desk4 = TicketDesk.create
ticket_desk5 = TicketDesk.create

ticket1 = Ticket.create(price: 12, type: 'student', client: admin2, screening: first_screening,
                        ticket_desk: ticket_desk1)
ticket2 = Ticket.create(price: 5, type: 'child', client: client1, screening: fifth_screening, ticket_desk: ticket_desk3)
ticket3 = Ticket.create(price: 30, type: 'adult', client: client2, screening: second_screening,
                        ticket_desk: ticket_desk4)
ticket4 = Ticket.create(price: 20, type: 'senior', client: client3, screening: fourth_screening,
                        ticket_desk: ticket_desk2)
ticket5 = Ticket.create(price: 12, type: 'student', client: admin1, screening: fourth_screening,
                        ticket_desk: ticket_desk1)
