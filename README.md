# ✈️ Flight Airline ER Database

A MySQL relational database project built as a coursework assignment for **Database Design & Systems (DDS)**. It models a full flight booking system using a normalised schema with an ERD-driven design, seeded with realistic sample data, and includes views and queries for operational reporting.

## Database Overview

The database (`FlightBookingSystem`) consists of **10 tables** covering the core entities of an airline booking system, from airlines and airports through to in-flight add-ons and special passenger requests.

## Schema

### Core Tables

| Table | Description |
|-------|-------------|
| `Airline` | 14 real-world airlines with IATA codes, HQ, website, and contact details |
| `Airport` | 15 international airports with IATA codes, city, country, and time zone |
| `Flight` | Route definitions linking airlines to departure/arrival airport pairs with scheduled times and duration |
| `Passenger` | Passenger profiles including passport number, DOB, nationality, and contact info |
| `Booking` | Ticket records linking passengers to flights, with seat number, travel date, and price |
| `Payment` | Payment records per ticket supporting Credit Card, Debit Card, PayPal, Bank Transfer, and Cash |

### Extended Tables

| Table | Description |
|-------|-------------|
| `EmergencyContact` | Emergency contacts linked per passenger with cascade delete |
| `FlightInstance` | Specific dated occurrences of a flight with status tracking (Scheduled, Delayed, Cancelled, Completed) |
| `PassengerBooking` | Junction table linking passengers to flight instances, enforcing unique seat assignments and recording meal preferences |
| `InflightWiFi` | Wi-Fi add-on orders (1-hour, Full-flight, Premium) per passenger booking |
| `SpecialRequest` | Accessibility and dietary requests per passenger booking (Wheelchair, Meal Allergy, Pet, etc.) |
| `CabinClass` | Cabin class definitions per airline (Economy, Premium Economy, Business, First Class) with baggage allowances |

## Key Relationships

```
Airline ──< Flight >── Airport (departure & arrival)
Flight ──< FlightInstance
Passenger ──< Booking >── Flight
Passenger ──< PassengerBooking >── FlightInstance
PassengerBooking ──< InflightWiFi
PassengerBooking ──< SpecialRequest
Booking ──< Payment
Passenger ──< EmergencyContact
Airline ──< CabinClass
```

## Views

| View | Purpose |
|------|---------|
| `TopFiveAirlinesByPassengers` | Ranks the 5 airlines with the highest distinct passenger count |
| `TopFiveRoutesByRevenue` | Ranks the top 5 routes by total ticket revenue over the past 3 months |
| `PassengersByFlightAndLoyalty` | Lists passengers on a given flight with a loyalty tier (Gold / Silver / Bronze) derived from birth year |
| `PassengersPastYear` | All passengers who have travelled in the last 12 months |
| `HighSpendingPassengers` | Passengers whose combined ticket + Wi-Fi spend exceeds the average |
| `ConfirmedButNotBoardedBookings` | Paid bookings where the flight is still Scheduled (not yet departed) |
| `FlightDeliveryDetails` | Full departure/arrival info per flight instance, ordered by destination city and date |

## Sample Data

- **14 airlines** — American, Delta, United, Emirates, Singapore Airlines, Lufthansa, British Airways, Qantas, JAL, Korean Air, AirAsia, Cathay Pacific, Air France, Ethiopian Airlines
- **15 airports** — JFK, LAX, ORD, DXB, SIN, FRA, LHR, SYD, HND, ICN, PEN, HKG, CDG, AMS, ADD
- **14 flights**, **14 passengers**, **21 bookings**, **14 payments**, **14 flight instances**, **14 passenger bookings**, **14 Wi-Fi orders**, **14 special requests**

## How to Run

### Prerequisites
- MySQL 8.0+ (or compatible MariaDB)
- A MySQL client (MySQL Workbench, DBeaver, CLI, etc.)

### Setup

```sql
-- In your MySQL client, run the full script:
SOURCE "DDS ASS 2.sql";

-- Or via CLI:
mysql -u root -p < "DDS ASS 2.sql"
```

The script will automatically create the database, all tables, insert sample data, and create all views.

### Quick Test Queries

```sql
-- Top 5 airlines by passenger count
SELECT * FROM TopFiveAirlinesByPassengers;

-- Top 5 revenue routes (last 3 months)
SELECT * FROM TopFiveRoutesByRevenue;

-- Passengers who have flown in the past year
SELECT * FROM PassengersPastYear ORDER BY TravelDate ASC;

-- High-spending passengers
SELECT * FROM HighSpendingPassengers;

-- Paid bookings with flights still scheduled
SELECT * FROM ConfirmedButNotBoardedBookings;
```

## Project Context

| | |
|---|---|
| **Course** | Database Design & Systems (DDS) |
| **Language** | SQL (MySQL) |
| **Concepts practiced** | ERD design, normalisation, foreign keys, constraints, views, aggregate queries, subqueries, UPDATE statements |

## Author

**Aminat Olaide** ([@minexart](https://github.com/minexart))
