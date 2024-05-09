### EventbriteTest

EventbriteTest is a Rails application for managing events and user registrations for those events.

## Requirements

- Ruby version 3.2.2
- Rails version 7.1.3.2
- PostgreSQL database

## Installation

1. Clone the repository:

   bash:  
   git clone https://github.com/your_username/EventbriteTest.git

2. Install Ruby dependencies:

   bash:  
   bundle install

3. Create the database and run migrations:

   bash:  
   rails db:create  
   rails db:migrate

4. (Optional) Run seeds to create demo data:

   bash:  
   rails db:seed

5. Start the Rails server:

   bash:  
   rails server

## Usage

Once the server is running, you can access the application in your browser by visiting http://localhost:3000.

## Key Features

Event Creation: Users can create new events by providing a title, description, start date, duration, price, and location.  
Event Registration: Users can register for existing events.  
Participant Listing: Organizers can view the list of participants for their events.  
Online Payment (with Stripe): Users can make online payments to reserve their spot at an event.

## Navigation

Home: /  
Event List: /events  
Event Details: /events/:id  
Event Registration: /events/:id/attendances  
Edit Event (for organizers): /events/:id/edit

## Contributors

The one & only: Sabrina AEH 👩🏻‍💻  
Thanks for reading until here you're a champion! 🏆
