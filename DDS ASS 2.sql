CREATE DATABASE FlightBookingSystem;
USE FlightBookingSystem;
-- BASIC TABLES

-- Airline Table
CREATE TABLE Airline (
    AirlineID INT AUTO_INCREMENT PRIMARY KEY,
    AirlineCode VARCHAR(5) NOT NULL UNIQUE,
    AirlineName VARCHAR(100) NOT NULL,
    Headquarters VARCHAR(100),
    Website VARCHAR(100),
    ContactNumber VARCHAR(20),
    CONSTRAINT CHK_AirlineCode CHECK (LENGTH(AirlineCode) IN (2, 3))
);

-- Insert Airlines
INSERT INTO Airline (AirlineCode, AirlineName, Headquarters, Website, ContactNumber)
VALUES 
('AA', 'American Airlines', 'Fort Worth, Texas', 'www.aa.com', '+18004337300'),
('DL', 'Delta Airlines', 'Atlanta, Georgia', 'www.delta.com', '+1800221212'),
('UA', 'United Airlines', 'Chicago, Illinois', 'www.united.com', '+18008648331'),
('EK', 'Emirates', 'Dubai, UAE', 'www.emirates.com', '+971600555555'),
('SQ', 'Singapore Airlines', 'Singapore', 'www.singaporeair.com', '+6562238888'),
('LH', 'Lufthansa', 'Cologne, Germany', 'www.lufthansa.com', '+498606799799'),
('BA', 'British Airways', 'London, UK', 'www.britishairways.com', '+443448007890'),
('QF', 'Qantas', 'Sydney, Australia', 'www.qantas.com', '+61296919691'),
('JL', 'Japan Airlines', 'Tokyo, Japan', 'www.jal.co.jp', '+81354601011'),
('KE', 'Korean Air', 'Seoul, South Korea', 'www.koreanair.com', '+82226564114'),
('AK', 'AirAsia', 'Kuala Lumpur, Malaysia', 'www.airasia.com', '+60386604333'),
('CX', 'Cathay Pacific', 'Hong Kong, China', 'www.cathaypacific.com', '+85227473333'),
('AF', 'Air France', 'Paris, France', 'www.airfrance.com', '+33141421414'),
('ET', 'Ethiopian Airlines', 'Addis Ababa, Ethiopia', 'www.ethiopianairlines.com', '+251116656666');


-- Airport Table
CREATE TABLE Airport (
    AirportID INT AUTO_INCREMENT PRIMARY KEY,
    AirportCode VARCHAR(5) NOT NULL UNIQUE,
    AirportName VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    TimeZone VARCHAR(50)
);

-- Insert Airports
INSERT INTO Airport (AirportCode, AirportName, City, Country, TimeZone)
VALUES
('JFK', 'John F. Kennedy International Airport', 'New York', 'USA', 'EST'),
('LAX', 'Los Angeles International Airport', 'Los Angeles', 'USA', 'PST'),
('ORD', 'O''Hare International Airport', 'Chicago', 'USA', 'CST'),
('DXB', 'Dubai International Airport', 'Dubai', 'UAE', 'GST'),
('SIN', 'Changi Airport', 'Singapore', 'Singapore', 'SGT'),
('FRA', 'Frankfurt Airport', 'Frankfurt', 'Germany', 'CET'),
('LHR', 'Heathrow Airport', 'London', 'UK', 'GMT'),
('SYD', 'Sydney Airport', 'Sydney', 'Australia', 'AEST'),
('HND', 'Haneda Airport', 'Tokyo', 'Japan', 'JST'),
('ICN', 'Incheon International Airport', 'Seoul', 'South Korea', 'KST'),
('PEN', 'Penang International Airport', 'Penang', 'Malaysia', 'MYT'),
('HKG', 'Hong Kong International Airport', 'Hong Kong', 'China', 'HKT'),
('CDG', 'Charles de Gaulle Airport', 'Paris', 'France', 'CET'),
('AMS', 'Amsterdam Airport Schiphol', 'Amsterdam', 'Netherlands', 'CET'),
('ADD', 'Bole International Airport', 'Addis Ababa', 'Ethiopia', 'EAT');


-- Flight Table
CREATE TABLE Flight (
    FlightID INT AUTO_INCREMENT PRIMARY KEY,
    FlightNumber VARCHAR(10) NOT NULL,
    AirlineID INT NOT NULL,
    DepartureAirportID INT NOT NULL,
    ArrivalAirportID INT NOT NULL,
    DepartureTime TIME NOT NULL,
    ArrivalTime TIME NOT NULL,
    Duration INT, -- In minutes
    CONSTRAINT FK_Flight_Airline FOREIGN KEY (AirlineID) REFERENCES Airline(AirlineID),
    CONSTRAINT FK_Flight_Departure FOREIGN KEY (DepartureAirportID) REFERENCES Airport(AirportID),
    CONSTRAINT FK_Flight_Arrival FOREIGN KEY (ArrivalAirportID) REFERENCES Airport(AirportID)
);

-- Insert Flights
INSERT INTO Flight (FlightNumber, AirlineID, DepartureAirportID, ArrivalAirportID, DepartureTime, ArrivalTime, Duration)
VALUES
('AA100', 1, 1, 2, '08:00:00', '11:30:00', 210),
('DL200', 2, 2, 3, '09:15:00', '15:45:00', 390),
('UA300', 3, 3, 1, '10:30:00', '13:45:00', 195),
('EK400', 4, 4, 5, '22:00:00', '06:00:00', 480),
('SQ500', 5, 5, 6, '01:00:00', '08:30:00', 450),
('LH600', 6, 6, 7, '07:30:00', '08:15:00', 45),
('BA700', 7, 7, 8, '12:00:00', '14:00:00', 120),
('QF800', 8, 8, 9, '15:30:00', '22:45:00', 435),
('JL900', 9, 9, 10, '18:00:00', '20:30:00', 150),
('KE1000', 10, 10, 1, '21:00:00', '23:30:00', 150),
('AK138', 11, 11, 12, '10:20:00', '14:05:00', 225),
('CX888', 12, 12, 13, '23:55:00', '06:30:00', 395),  
('AF456', 13, 13, 14, '10:20:00', '18:45:00', 505),  
('ET909', 14, 14, 4, '08:00:00', '14:20:00', 380); 


-- Passenger Table
CREATE TABLE Passenger (
    PassengerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20),
    PassportNumber VARCHAR(20) UNIQUE,
    DateOfBirth DATE,
    Nationality VARCHAR(50),
    CONSTRAINT CHK_Email CHECK (Email LIKE '%@%.%')
);

-- Insert Passengers
INSERT INTO Passenger (FirstName, LastName, Email, Phone, PassportNumber, DateOfBirth, Nationality)
VALUES
('John', 'Smith', 'john.smith@email.com', '+12025551234', 'P12345678', '1980-05-15', 'American'),
('Sarah', 'Johnson', 'sarah.j@email.com', '+13105559876', 'P23456789', '1985-08-22', 'Canadian'),
('Michael', 'Brown', 'michael.b@email.com', '+442071234567', 'P34567890', '1975-11-30', 'British'),
('Emma', 'Davis', 'emma.d@email.com', '+61234567890', 'P45678901', '1990-03-10', 'Australian'),
('David', 'Wilson', 'david.w@email.com', '+81312345678', 'P56789012', '1988-07-25', 'Japanese'),
('Sophia', 'Lee', 'sophia.l@email.com', '+82298765432', 'P67890123', '1992-09-18', 'Korean'),
('James', 'Miller', 'james.m@email.com', '+971501234567', 'P78901234', '1983-12-05', 'Emirati'),
('Olivia', 'Taylor', 'olivia.t@email.com', '+6567890123', 'P89012345', '1995-04-20', 'Singaporean'),
('Robert', 'Anderson', 'robert.a@email.com', '+493012345678', 'P90123456', '1978-10-15', 'German'),
('Emily', 'Thomas', 'emily.t@email.com', '+447912345678', 'P01234567', '1987-01-30', 'British'),
('Ann', 'Evelyn', 'ann.e@email.com', '+60123456789', 'A12345678', '1990-03-15', 'Malaysian'),
('Lucas', 'Martin', 'lucas.martin@email.com', '+33123456789', 'P11223344', '1982-02-14', 'French'),
('Amira', 'Hassan', 'amira.hassan@email.com', '+201234567890', 'P22334455', '1993-06-28', 'Egyptian'),
('Wei', 'Zhang', 'wei.zhang@email.com', '+8613812345678', 'P33445566', '1987-09-12', 'Chinese');

-- Booking Table
CREATE TABLE Booking (
    TicketID INT AUTO_INCREMENT PRIMARY KEY,
    BookingReference VARCHAR(10) UNIQUE NOT NULL,
    PassengerID INT NOT NULL,
    FlightID INT NOT NULL,
    TravelDate DATE NOT NULL,
    SeatNumber VARCHAR(5),
    TicketPrice DECIMAL(10,2) NOT NULL,
    BookingDate DATETIME DEFAULT CURRENT_TIMESTAMP
  
);


-- Bookings 
INSERT INTO Booking (BookingReference, PassengerID, FlightID, TravelDate, SeatNumber, TicketPrice) VALUES
('AA100JSM', 1, 1, '2025-11-01', '12A', 350.00),
('AA100SAR', 2, 1, '2025-11-02', '14B', 355.00),
('AA100MIC', 3, 1, '2025-11-03', '16C', 340.00),
('AA100EMM', 4, 1, '2025-11-04', '17D', 345.00),
('DL200DAV', 5, 2, '2025-11-05', '11B', 430.00),
('DL200SOP', 6, 2, '2025-11-06', '12C', 415.00),
('DL200JAM', 7, 2, '2025-11-07', '13D', 425.00),
('UA300OLI', 8, 3, '2025-11-08', '07H', 285.00),
('UA300ROB', 9, 3, '2025-11-09', '14K', 265.00),
('EK400EMI', 10, 4, '2025-11-10', '09L', 850.00),
('EK400ANN', 11, 4, '2025-11-11', '15A', 840.00),
('SQ500LUC', 12, 5, '2025-08-20', '14A', 780.00),
('LH600AMI', 13, 6, '2025-08-22', '22B', 320.00),
('BA700WEI', 14, 7, '2025-08-25', '03C', 540.00),
('QF800JSM', 1, 8, '2025-09-01', '05D', 920.00),
('JL900SAR', 2, 9, '2025-09-02', '06E', 670.00),
('KE1000MIC', 3, 10, '2025-09-03', '08F', 590.00),
('AK138EMM', 4, 11, '2025-09-04', '12A', 420.00),
('CX888DAV', 5, 12, '2025-09-05', '13B', 850.00),
('AF456SOP', 6, 13, '2025-09-06', '09A', 720.00),
('ET909JAM', 7, 14, '2025-09-07', '10C', 960.00);

-- Payment Table 
CREATE TABLE Payment (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    TicketID INT NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    PaymentMethod VARCHAR(20) NOT NULL,
    PaymentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Status VARCHAR(20) DEFAULT 'Completed',
    TransactionID VARCHAR(50),
    CONSTRAINT CHK_PaymentMethod CHECK (
        PaymentMethod IN ('Credit Card', 'Debit Card', 'PayPal', 'Bank Transfer', 'Cash')
    ),
    CONSTRAINT FK_Payment_Ticket FOREIGN KEY (TicketID) REFERENCES Booking(TicketID)
);

-- Payments
INSERT INTO Payment (TicketID, Amount, PaymentMethod, Status, TransactionID) VALUES
(1, 350.00, 'Credit Card', 'Completed', 'TXN12345678'),
(2, 420.00, 'Debit Card', 'Completed', 'TXN23456789'),
(3, 275.00, 'PayPal', 'Completed', 'TXN34567890'),
(4, 850.00, 'Credit Card', 'Completed', 'TXN45678901'),
(5, 780.00, 'Bank Transfer', 'Completed', 'TXN56789012'),
(6, 320.00, 'Credit Card', 'Completed', 'TXN67890123'),
(7, 540.00, 'Debit Card', 'Completed', 'TXN78901234'),
(8, 920.00, 'Credit Card', 'Completed', 'TXN89012345'),
(9, 670.00, 'PayPal', 'Completed', 'TXN90123456'),
(10, 590.00, 'Credit Card', 'Completed', 'TXN01234567'),
(11, 420.00, 'Credit Card', 'Completed', 'TXN11223344'),
(12, 850.00, 'Credit Card', 'Completed', 'TXN9001'),
(13, 720.00, 'PayPal', 'Completed', 'TXN9002'),
(14, 960.00, 'Debit Card', 'Completed', 'TXN9003');

-- ADDITIONAL TABLES

-- EmergencyContact Table
CREATE TABLE EmergencyContact (
    ContactID INT AUTO_INCREMENT PRIMARY KEY,
    PassengerID INT NOT NULL,
    FullName VARCHAR(100) NOT NULL,
    Relationship VARCHAR(50) NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    Email VARCHAR(100),
    CONSTRAINT FK_EmergencyContact_Passenger FOREIGN KEY (PassengerID) 
        REFERENCES Passenger(PassengerID) ON DELETE CASCADE
);

INSERT INTO EmergencyContact (PassengerID, FullName, Relationship, Phone, Email)
VALUES
(1, 'Mary Smith', 'Spouse', '+12025554321', 'mary.smith@email.com'),
(2, 'Tom Johnson', 'Parent', '+13105551111', 'tom.j@email.com'),
(3, 'Lisa Brown', 'Sibling', '+442078765432', 'lisa.b@email.com'),
(4, 'Peter Davis', 'Friend', '+61298765432', 'peter.d@email.com'),
(5, 'Naoko Wilson', 'Spouse', '+81398765432', 'naoko.w@email.com'),
(6, 'Minho Lee', 'Parent', '+82212345678', 'minho.l@email.com'),
(7, 'Fatima Miller', 'Sibling', '+971501111111', 'fatima.m@email.com'),
(8, 'Wei Ling Tan', 'Friend', '+6561234567', 'wei.t@email.com'),
(9, 'Hans Anderson', 'Spouse', '+493098765432', 'hans.a@email.com'),
(10, 'Paul Thomas', 'Parent', '+447976543210', 'paul.t@email.com'),
(11, 'Robert Evelyn', 'Spouse', '+60198765432', 'robert.e@email.com'),
(12, 'Emma Martin', 'Spouse', '+33123456780', 'emma.martin@email.com'),
(13, 'Omar Hassan', 'Brother', '+201234567891', 'omar.hassan@email.com'),
(14, 'Li Wei', 'Father', '+8613812345679', 'li.wei@email.com');

-- FlightInstance Table
CREATE TABLE FlightInstance (
    FlightInstanceID INT AUTO_INCREMENT PRIMARY KEY,
    FlightID INT NOT NULL,
    DepartureDateTime DATETIME NOT NULL,
    ArrivalDateTime DATETIME NOT NULL,
    FlightStatus VARCHAR(20) DEFAULT 'Scheduled',
    CONSTRAINT FK_FlightInstance_Flight FOREIGN KEY (FlightID) 
        REFERENCES Flight(FlightID),
    CONSTRAINT CHK_FlightInstance_Dates CHECK (DepartureDateTime < ArrivalDateTime),
    CONSTRAINT CHK_FlightInstance_Status CHECK (FlightStatus IN ('Scheduled', 'Delayed', 'Cancelled', 'Completed'))
);

INSERT INTO FlightInstance (FlightID, DepartureDateTime, ArrivalDateTime, FlightStatus)
VALUES
(1, '2025-11-01 08:00:00', '2025-11-01 11:30:00', 'Completed'),
(2, '2025-11-02 09:15:00', '2025-11-02 15:45:00', 'Completed'),
(3, '2025-11-03 10:30:00', '2025-11-03 13:45:00', 'Completed'),
(4, '2025-11-04 22:00:00', '2025-11-05 06:00:00', 'Completed'),
(5, '2025-11-05 01:00:00', '2025-11-05 08:30:00', 'Completed'),
(6, '2025-11-06 07:30:00', '2025-11-06 08:15:00', 'Completed'),
(7, '2025-11-07 12:00:00', '2025-11-07 14:00:00', 'Completed'),
(8, '2025-11-08 15:30:00', '2025-11-08 22:45:00', 'Completed'),
(9, '2025-11-09 18:00:00', '2025-11-09 20:30:00', 'Completed'),
(10, '2025-11-10 21:00:00', '2025-11-10 23:30:00', 'Completed'),
(11, '2025-11-11 10:20:00', '2025-11-11 14:05:00', 'Scheduled'),
(12, '2025-08-20 08:00:00', '2025-08-20 12:30:00', 'Scheduled'),
(13, '2025-08-22 14:15:00', '2025-08-22 18:45:00', 'Scheduled'),
(14, '2025-08-25 21:00:00', '2025-08-26 04:30:00', 'Scheduled');

-- PassengerBooking Table
CREATE TABLE PassengerBooking (
    PassengerBookingID INT AUTO_INCREMENT PRIMARY KEY,
    PassengerID INT NOT NULL,
    FlightInstanceID INT NOT NULL,
    TicketID INT NOT NULL,
    SeatNumber VARCHAR(5) NOT NULL,
    MealPreference VARCHAR(50),
    CONSTRAINT FK_PassengerBooking_Passenger FOREIGN KEY (PassengerID) 
        REFERENCES Passenger(PassengerID),
    CONSTRAINT FK_PassengerBooking_FlightInstance FOREIGN KEY (FlightInstanceID) 
        REFERENCES FlightInstance(FlightInstanceID),
    CONSTRAINT FK_PassengerBooking_Ticket FOREIGN KEY (TicketID) 
        REFERENCES Booking(TicketID),
    CONSTRAINT UC_SeatAssignment UNIQUE (FlightInstanceID, SeatNumber)
);

INSERT INTO PassengerBooking (PassengerID, FlightInstanceID, TicketID, SeatNumber, MealPreference)
VALUES
(1, 1, 1, '12A', 'Vegetarian'),
(2, 2, 2, '15B', 'Halal'),
(3, 3, 3, '08C', 'Kosher'),
(4, 4, 4, '22D', 'Vegetarian'),
(5, 5, 5, '10E', 'Non-vegetarian'),
(6, 6, 6, '05F', 'Vegetarian'),
(7, 7, 7, '18G', 'Halal'),
(8, 8, 8, '07H', 'Kosher'),
(9, 9, 9, '14K', 'Vegetarian'),
(10, 10, 10, '09L', 'Non-vegetarian'),
(11, 11, 11, '15A', 'Vegetarian'),
(12, 12, 12, '14A', 'Vegetarian'),
(13, 13, 13, '22B', 'Halal'),
(14, 14, 14, '03C', 'Kosher');

-- InflightWiFi Table
CREATE TABLE InflightWiFi (
    WiFiOrderID INT AUTO_INCREMENT PRIMARY KEY,
    PassengerBookingID INT NOT NULL,
    WiFiPlan VARCHAR(50) NOT NULL, -- 1-hour, Full-flight, Premium
    Price DECIMAL(10,2) NOT NULL,
    PurchaseStatus VARCHAR(20) DEFAULT 'Confirmed',
    CONSTRAINT FK_InflightWiFi_PassengerBooking FOREIGN KEY (PassengerBookingID)
        REFERENCES PassengerBooking(PassengerBookingID) ON DELETE CASCADE,
    CONSTRAINT CHK_InflightWiFi_Status 
        CHECK (PurchaseStatus IN ('Confirmed', 'Refunded'))
);

INSERT INTO InflightWiFi (PassengerBookingID, WiFiPlan, Price, PurchaseStatus)
VALUES
(1, 'Full-flight', 50.00, 'Confirmed'),
(2, '1-hour', 15.00, 'Confirmed'),
(3, 'Premium', 75.00, 'Confirmed'),
(4, 'Full-flight', 50.00, 'Confirmed'),
(5, '1-hour', 15.00, 'Confirmed'),
(6, 'Premium', 75.00, 'Confirmed'),
(7, 'Full-flight', 50.00, 'Confirmed'),
(8, '1-hour', 15.00, 'Confirmed'),
(9, 'Premium', 75.00, 'Confirmed'),
(10, 'Full-flight', 50.00, 'Confirmed'),
(11, 'Premium', 75.00, 'Confirmed'),
(12, 'Premium', 75.00, 'Confirmed'),
(13, 'Premium', 75.00, 'Confirmed'),
(14, 'Premium', 75.00, 'Confirmed');

-- SpecialRequest Table
CREATE TABLE SpecialRequest (
    RequestID INT AUTO_INCREMENT PRIMARY KEY,
    PassengerBookingID INT NOT NULL,
    RequestType VARCHAR(50) NOT NULL, -- 'Wheelchair, Meal Allergy, Pet, etc.'
    RequestDetails TEXT,      
    Status VARCHAR(20) DEFAULT 'Pending',
    CONSTRAINT FK_SpecialRequest_PassengerBooking 
        FOREIGN KEY (PassengerBookingID) 
        REFERENCES PassengerBooking(PassengerBookingID) ON DELETE CASCADE,
    CONSTRAINT CHK_SpecialRequest_Status 
        CHECK (Status IN ('Pending', 'Approved', 'Rejected'))
);

INSERT INTO SpecialRequest (PassengerBookingID, RequestType, RequestDetails, Status)
VALUES
(1, 'Wheelchair', 'Needs assistance at boarding gate', 'Approved'),
(2, 'Meal Allergy', 'No peanuts', 'Approved'),
(3, 'Pet', 'Traveling with a service dog', 'Approved'),
(4, 'Wheelchair', 'Needs assistance at arrival', 'Approved'),
(5, 'Meal Allergy', 'No shellfish', 'Approved'),
(6, 'Pet', 'Traveling with emotional support cat', 'Approved'),
(7, 'Wheelchair', 'Needs assistance at transfer', 'Approved'),
(8, 'Meal Allergy', 'No dairy', 'Approved'),
(9, 'Pet', 'Traveling with small dog in cabin', 'Approved'),
(10, 'Wheelchair', 'Needs assistance throughout journey', 'Approved'),
(11, 'Meal Allergy', 'Gluten-free meal required', 'Approved'),
(12, 'Extra Pillow', 'Requesting two extra pillows', 'Approved'),
(13, 'Wheelchair Assistance', 'Assistance needed at arrival', 'Pending'),
(14, 'Child Meal', 'Meal suitable for 5-year-old child', 'Approved');

-- CabinClass Table
CREATE TABLE CabinClass (
    CabinClassID INT AUTO_INCREMENT PRIMARY KEY,
    AirlineID INT NOT NULL,
    ClassName VARCHAR(20) NOT NULL,
    CabinBaggageAllowance DECIMAL(5,2) NOT NULL, -- In kg
    CheckInBaggageAllowance DECIMAL(5,2) NOT NULL, -- In kg
    CONSTRAINT FK_CabinClass_Airline FOREIGN KEY (AirlineID) 
        REFERENCES Airline(AirlineID),
    CONSTRAINT UC_CabinClass UNIQUE (AirlineID, ClassName),
    CONSTRAINT CHK_CabinClass_Name CHECK (ClassName IN ('Economy', 'Premium Economy', 'Business', 'First Class'))
);

INSERT INTO CabinClass (AirlineID, ClassName, CabinBaggageAllowance, CheckInBaggageAllowance)
VALUES
(1, 'Economy', 7.0, 23.0),
(1, 'Premium Economy', 9.0, 28.0),
(1, 'Business', 14.0, 32.0),
(2, 'Economy', 7.0, 23.0),
(2, 'Premium Economy', 9.0, 28.0),
(2, 'Business', 14.0, 32.0),
(3, 'Economy', 7.0, 23.0),
(3, 'Premium Economy', 9.0, 28.0),
(3, 'Business', 14.0, 32.0),
(4, 'Economy', 7.0, 30.0),
(4, 'Business', 14.0, 40.0),
(4, 'First Class', 16.0, 50.0),
(5, 'Economy', 7.0, 30.0),
(5, 'Premium Economy', 9.0, 35.0),
(5, 'Business', 14.0, 40.0),
(6, 'Economy', 7.0, 23.0),
(6, 'Business', 14.0, 32.0),
(7, 'Economy', 7.0, 23.0),
(7, 'Premium Economy', 9.0, 28.0),
(7, 'Business', 14.0, 32.0),
(8, 'Economy', 7.0, 23.0),
(8, 'Premium Economy', 9.0, 28.0),
(8, 'Business', 14.0, 32.0),
(9, 'Economy', 7.0, 23.0),
(9, 'Premium Economy', 9.0, 28.0),
(9, 'Business', 14.0, 32.0),
(10, 'Economy', 7.0, 23.0),
(10, 'Premium Economy', 9.0, 28.0),
(10, 'Business', 14.0, 32.0),
(11, 'Economy', 7.0, 20.0),
(11, 'Premium Economy', 9.0, 25.0),
(12, 'Premium Economy', 9.0, 28.0),
(12, 'Business', 14.0, 32.0),
(13, 'Economy', 7.0, 23.0),
(13, 'Premium Economy', 9.0, 28.0),
(13, 'Business', 14.0, 32.0),
(14, 'Economy', 7.0, 20.0),
(14, 'Premium Economy', 9.0, 25.0);

-- VIEWS
-- Top 5 Airline By Passengers --
CREATE OR REPLACE VIEW TopFiveAirlinesByPassengers AS
SELECT 
    a.AirlineID,
    a.AirlineName,
    COUNT(DISTINCT b.PassengerID) AS PassengerCount
FROM Booking b
JOIN Flight f 
    ON b.FlightID = f.FlightID
JOIN Airline a 
    ON f.AirlineID = a.AirlineID
GROUP BY a.AirlineID, a.AirlineName
ORDER BY PassengerCount DESC
LIMIT 5;

-- Top 5 Routes By revenue --
CREATE OR REPLACE VIEW TopFiveRoutesByRevenue AS
SELECT 
    a.AirlineName,
    da.AirportName AS DepartureAirport,
    da.AirportCode AS DepartureCode,
    aa.AirportName AS ArrivalAirport,
    aa.AirportCode AS ArrivalCode,
    COUNT(DISTINCT b.PassengerID) AS PassengerCount,
    SUM(b.TicketPrice) AS TotalRevenue
FROM Booking b
JOIN Flight f 
    ON b.FlightID = f.FlightID
JOIN Airline a
    ON f.AirlineID = a.AirlineID
JOIN Airport da
    ON f.DepartureAirportID = da.AirportID
JOIN Airport aa
    ON f.ArrivalAirportID = aa.AirportID
WHERE b.TravelDate >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY 
    a.AirlineName,
    da.AirportName, da.AirportCode,
    aa.AirportName, aa.AirportCode
ORDER BY TotalRevenue DESC
LIMIT 5;

-- Passenge By Flight And Loyalty --
CREATE VIEW PassengersByFlightAndLoyalty AS
SELECT 
    p.PassengerID, 
    p.FirstName, 
    p.LastName,
    CASE 
        WHEN YEAR(p.DateOfBirth) <= 1980 THEN 'Gold'
        WHEN YEAR(p.DateOfBirth) <= 1990 THEN 'Silver'
        ELSE 'Bronze'
    END AS LoyaltyStatus,
    b.FlightID
FROM Passenger p
JOIN Booking b 
    ON p.PassengerID = b.PassengerID
WHERE b.FlightID = 1;

-- First, drop the existing check constraint
-- ALTER TABLE Booking DROP CHECK CHK_TravelDate;

-- Then, add the new check constraint
ALTER TABLE Booking 
ADD CONSTRAINT CHK_TravelDate 
CHECK (TravelDate BETWEEN '2020-01-01' AND '2025-12-31');-- USE GET DATE TO AUTO UPDATE



-- Add recent flights (past 12 months from today)
INSERT INTO Booking (BookingReference, PassengerID, FlightID, TravelDate, SeatNumber, TicketPrice) VALUES
('AA101NEW', 1, 1, '2025-07-15', '15F', 360.00),
('DL201NEW', 2, 2, '2025-06-10', '18B', 410.00),
('UA301NEW', 3, 3, '2025-05-22', '20C', 295.00),
('SQ501NEW', 4, 5, '2025-04-05', '09A', 800.00),
('KE1001NEW', 5, 10, '2025-03-15', '11D', 600.00);

-- 
CREATE VIEW PassengersPastYear AS
SELECT DISTINCT 
    p.PassengerID, 
    p.FirstName, 
    p.LastName, 
    b.TravelDate
FROM Passenger p
JOIN Booking b 
    ON p.PassengerID = b.PassengerID
WHERE b.TravelDate >= CURDATE() - INTERVAL 1 YEAR;


SELECT *
FROM PassengersPastYear
ORDER BY TravelDate ASC;

CREATE VIEW HighSpendingPassengers AS
SELECT 
    p.PassengerID,
    p.FirstName,
    p.LastName,
    SUM(pay.Amount + IFNULL(w.Price, 0)) AS TotalSpent
FROM Passenger p
JOIN PassengerBooking pb 
    ON p.PassengerID = pb.PassengerID
JOIN Payment pay 
    ON pb.TicketID = pay.TicketID
LEFT JOIN InflightWiFi w 
    ON pb.PassengerBookingID = w.PassengerBookingID
GROUP BY p.PassengerID, p.FirstName, p.LastName
HAVING SUM(pay.Amount + IFNULL(w.Price, 0)) > (
    SELECT AVG(Total)
    FROM (
        SELECT SUM(pay2.Amount + IFNULL(w2.Price, 0)) AS Total
        FROM Passenger p2
        JOIN PassengerBooking pb2 
            ON p2.PassengerID = pb2.PassengerID
        JOIN Payment pay2 
            ON pb2.TicketID = pay2.TicketID
        LEFT JOIN InflightWiFi w2 
            ON pb2.PassengerBookingID = w2.PassengerBookingID
        GROUP BY p2.PassengerID
    ) AS PassengerTotals
);


CREATE VIEW ConfirmedButNotBoardedBookings AS
SELECT 
    p.PassengerID,
    p.FirstName,
    p.LastName,
    f.FlightNumber,
    fi.DepartureDateTime,
    fi.ArrivalDateTime,
    fi.FlightStatus,
    pb.SeatNumber,
    pay.Status AS PaymentStatus
FROM Passenger p
JOIN PassengerBooking pb 
    ON p.PassengerID = pb.PassengerID
JOIN Payment pay 
    ON pb.TicketID = pay.TicketID
JOIN FlightInstance fi 
    ON pb.FlightInstanceID = fi.FlightInstanceID
JOIN Flight f 
    ON fi.FlightID = f.FlightID
WHERE pay.Status = 'Completed'   -- Payment confirmed
  AND fi.FlightStatus = 'Scheduled';  -- Flight is scheduled



CREATE VIEW FlightDeliveryDetails AS
SELECT 
    f.FlightNumber,
    a_arrival.City AS DestinationCity,
    fi.DepartureDateTime AS DeliveryDate,
    a_departure.City AS DepartureCity,
    fi.ArrivalDateTime,
    fi.FlightStatus
FROM FlightInstance fi
JOIN Flight f ON fi.FlightID = f.FlightID
JOIN Airport a_departure ON f.DepartureAirportID = a_departure.AirportID
JOIN Airport a_arrival ON f.ArrivalAirportID = a_arrival.AirportID;


SELECT * 
FROM FlightDeliveryDetails
ORDER BY DestinationCity, DeliveryDate;

-- update --
--- Turn off safe updates for this session
SET SQL_SAFE_UPDATES = 0;

-- View current times
SELECT DepartureDateTime, ArrivalDateTime
FROM FlightInstance
WHERE FlightInstanceID = 1;

-- Update specific flight instance
UPDATE FlightInstance
SET DepartureDateTime = '2025-11-01 08:30:00'
WHERE FlightInstanceID = 1;

-- Verify update
SELECT DepartureDateTime, ArrivalDateTime
FROM FlightInstance
WHERE FlightInstanceID = 1;

-- View baggage allowances
SELECT AirlineID, ClassName, CabinBaggageAllowance, CheckInBaggageAllowance
FROM CabinClass
ORDER BY AirlineID, ClassName;

-- Increase baggage allowances for all classes by 10%
UPDATE CabinClass
SET 
    CabinBaggageAllowance = CabinBaggageAllowance * 1.10,
    CheckInBaggageAllowance = CheckInBaggageAllowance * 1.10;

-- Verify changes
SELECT AirlineID, ClassName, CabinBaggageAllowance, CheckInBaggageAllowance
FROM CabinClass
ORDER BY AirlineID, ClassName;

-- (Optional) Turn safe updates back on
SET SQL_SAFE_UPDATES = 1;