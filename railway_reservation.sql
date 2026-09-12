-- RAILWAY RESERVATION SYSTEM
-- MySQL DBMS Project - Complete SQL Script

-- 1. DATABASE
CREATE DATABASE railway_reservation;
USE railway_reservation;

-- 2. TABLES
CREATE TABLE PASSENGER (
    passenger_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(15),
    age INT,
    gender VARCHAR(10)
);

CREATE TABLE TRAIN (
    train_id INT PRIMARY KEY,
    train_number VARCHAR(20) NOT NULL,
    train_name VARCHAR(100) NOT NULL,
    total_seats INT NOT NULL,
    train_type VARCHAR(50)
);

CREATE TABLE STATION (
    station_id INT PRIMARY KEY,
    station_name VARCHAR(100) NOT NULL,
    station_code VARCHAR(10) NOT NULL,
    city VARCHAR(100),
    state VARCHAR(100)
);

CREATE TABLE ROUTE (
    route_id INT PRIMARY KEY,
    train_id INT NOT NULL,
    station_id INT NOT NULL,
    stop_number INT,
    arrival_time TIME,
    departure_time TIME,
    FOREIGN KEY (train_id) REFERENCES TRAIN(train_id),
    FOREIGN KEY (station_id) REFERENCES STATION(station_id)
);

CREATE TABLE RESERVATION (
    reservation_id INT PRIMARY KEY AUTO_INCREMENT,
    passenger_id INT NOT NULL,
    train_id INT NOT NULL,
    journey_date DATE NOT NULL,
    seat_number VARCHAR(10),
    travel_class VARCHAR(30),
    status VARCHAR(20),
    FOREIGN KEY (passenger_id) REFERENCES PASSENGER(passenger_id),
    FOREIGN KEY (train_id) REFERENCES TRAIN(train_id)
);

CREATE TABLE TICKET (
    ticket_id INT PRIMARY KEY AUTO_INCREMENT,
    reservation_id INT NOT NULL,
    ticket_number VARCHAR(30) NOT NULL,
    fare DECIMAL(10,2),
    booking_date DATE NOT NULL,
    FOREIGN KEY (reservation_id) REFERENCES RESERVATION(reservation_id),
    UNIQUE (reservation_id)
);

-- 3. DATA
INSERT INTO PASSENGER VALUES
(1,'Rahul Sharma','rahul@gmail.com','9876543210',25,'Male'),
(2,'Priya Reddy','priya@gmail.com','9876543211',22,'Female'),
(3,'Arjun Kumar','arjun@gmail.com','9876543212',30,'Male'),
(4,'Sneha Rao','sneha@gmail.com','9876543213',27,'Female'),
(5,'Karthik Singh','karthik@gmail.com','9876543214',24,'Male'),
(6,'Ananya Patel','ananya@gmail.com','9876543215',21,'Female'),
(7,'Vikram Reddy','vikram@gmail.com','9876543216',35,'Male'),
(8,'Meghana Das','meghana@gmail.com','9876543217',28,'Female'),
(9,'Rohit Verma','rohit@gmail.com','9876543218',32,'Male'),
(10,'Divya Sharma','divya@gmail.com','9876543219',26,'Female');

INSERT INTO TRAIN VALUES
(1,'12701','Hussain Sagar Express',1200,'Express'),
(2,'12702','Godavari Express',1200,'Superfast'),
(3,'12603','Charminar Express',1000,'Express'),
(4,'12723','Telangana Express',1500,'Superfast'),
(5,'17015','Visakha Express',1200,'Express'),
(6,'12759','Charminar SF Express',1400,'Superfast'),
(7,'12861','Visakhapatnam Express',1300,'Express'),
(8,'12727','Godavari SF Express',1400,'Superfast'),
(9,'17011','Hyderabad Intercity',1000,'Intercity'),
(10,'12785','Kacheguda Express',1200,'Express');

INSERT INTO STATION VALUES
(1,'Secunderabad Junction','SC','Hyderabad','Telangana'),
(2,'Hyderabad Deccan','HYB','Hyderabad','Telangana'),
(3,'Kacheguda','KCG','Hyderabad','Telangana'),
(4,'Vijayawada Junction','BZA','Vijayawada','Andhra Pradesh'),
(5,'Warangal','WL','Warangal','Telangana'),
(6,'Kazipet Junction','KZJ','Kazipet','Telangana'),
(7,'Guntur Junction','GNT','Guntur','Andhra Pradesh'),
(8,'Visakhapatnam Junction','VSKP','Visakhapatnam','Andhra Pradesh'),
(9,'Tirupati','TPTY','Tirupati','Andhra Pradesh'),
(10,'Nalgonda','NLDA','Nalgonda','Telangana');

INSERT INTO ROUTE VALUES
(1,1,1,1,'06:00:00','06:10:00'),
(2,1,4,2,'10:30:00','10:40:00'),
(3,2,1,1,'07:00:00','07:10:00'),
(4,2,5,2,'09:30:00','09:40:00'),
(5,3,2,1,'08:00:00','08:10:00'),
(6,3,7,2,'12:00:00','12:10:00'),
(7,4,1,1,'09:00:00','09:10:00'),
(8,4,8,2,'15:30:00','15:40:00'),
(9,5,3,1,'11:00:00','11:10:00'),
(10,5,9,2,'17:00:00','17:10:00');

INSERT INTO RESERVATION
(reservation_id,passenger_id,train_id,journey_date,seat_number,travel_class,status)
VALUES
(1,1,1,'2026-09-10','A1-01','AC First Class','Confirmed'),
(2,2,2,'2026-09-11','B2-15','AC 2 Tier','Confirmed'),
(3,3,3,'2026-09-12','C1-20','AC 3 Tier','Confirmed'),
(4,4,4,'2026-09-13','S1-10','Sleeper','Confirmed'),
(5,5,5,'2026-09-14','A2-05','AC 2 Tier','Pending'),
(6,6,6,'2026-09-15','S2-25','Sleeper','Confirmed'),
(7,7,7,'2026-09-16','B1-12','AC 2 Tier','Cancelled'),
(8,8,8,'2026-09-17','C2-18','AC 3 Tier','Confirmed'),
(9,9,9,'2026-09-18','S3-30','Sleeper','Confirmed'),
(10,10,10,'2026-09-19','A1-08','AC First Class','Pending');

INSERT INTO TICKET
(reservation_id,ticket_number,fare,booking_date)
VALUES
(1,'TKT10001',850.00,'2026-09-04'),
(2,'TKT10002',1250.00,'2026-09-04'),
(3,'TKT10003',950.00,'2026-09-04'),
(4,'TKT10004',650.00,'2026-09-04'),
(5,'TKT10005',1400.00,'2026-09-04'),
(6,'TKT10006',720.00,'2026-09-04'),
(7,'TKT10007',1100.00,'2026-09-04'),
(8,'TKT10008',980.00,'2026-09-04'),
(9,'TKT10009',600.00,'2026-09-04'),
(10,'TKT10010',1500.00,'2026-09-04');

-- 4. BASIC AND JOIN QUERIES
SELECT * FROM PASSENGER;
SELECT * FROM TRAIN;
SELECT * FROM STATION;
SELECT * FROM ROUTE;
SELECT * FROM RESERVATION;
SELECT * FROM TICKET;

SELECT t.train_number,t.train_name,s.station_name,r.stop_number,
       r.arrival_time,r.departure_time
FROM TRAIN t
JOIN ROUTE r ON t.train_id=r.train_id
JOIN STATION s ON r.station_id=s.station_id
ORDER BY t.train_id,r.stop_number;

SELECT DISTINCT t.train_number,t.train_name
FROM TRAIN t
JOIN ROUTE r1 ON t.train_id=r1.train_id
JOIN ROUTE r2 ON t.train_id=r2.train_id
JOIN STATION s1 ON r1.station_id=s1.station_id
JOIN STATION s2 ON r2.station_id=s2.station_id
WHERE s1.station_name='Secunderabad Junction'
AND s2.station_name='Vijayawada Junction'
AND r1.stop_number<r2.stop_number;

SELECT p.name AS passenger_name,t.train_number,t.train_name,
       r.journey_date,r.seat_number,r.travel_class,r.status,
       tk.ticket_number,tk.fare,tk.booking_date
FROM PASSENGER p
JOIN RESERVATION r ON p.passenger_id=r.passenger_id
JOIN TRAIN t ON r.train_id=t.train_id
JOIN TICKET tk ON r.reservation_id=tk.reservation_id;

-- 5. AGGREGATES AND REPORTS
SELECT status,COUNT(*) AS total_reservations
FROM RESERVATION GROUP BY status;

SELECT gender,COUNT(*) AS total_passengers
FROM PASSENGER GROUP BY gender;

SELECT t.train_id,t.train_number,t.train_name,t.total_seats,
       COUNT(CASE WHEN r.status='Confirmed' THEN 1 END) AS confirmed_bookings,
       t.total_seats-COUNT(CASE WHEN r.status='Confirmed' THEN 1 END) AS available_seats
FROM TRAIN t
LEFT JOIN RESERVATION r ON t.train_id=r.train_id
GROUP BY t.train_id,t.train_number,t.train_name,t.total_seats;

SELECT SUM(tk.fare) AS total_revenue
FROM TICKET tk JOIN RESERVATION r
ON tk.reservation_id=r.reservation_id
WHERE r.status='Confirmed';

SELECT t.train_name,SUM(tk.fare) AS revenue
FROM TRAIN t
JOIN RESERVATION r ON t.train_id=r.train_id
JOIN TICKET tk ON r.reservation_id=tk.reservation_id
WHERE r.status='Confirmed'
GROUP BY t.train_id,t.train_name;

SELECT * FROM PASSENGER WHERE age>25;
SELECT * FROM PASSENGER WHERE age BETWEEN 20 AND 30;
SELECT * FROM RESERVATION WHERE status='Cancelled';
SELECT * FROM TICKET ORDER BY fare DESC LIMIT 1;

-- 6. SUBQUERIES
SELECT * FROM PASSENGER
WHERE age>(SELECT AVG(age) FROM PASSENGER);

SELECT * FROM TICKET
WHERE fare=(SELECT MAX(fare) FROM TICKET);

SELECT t.train_number,t.train_name,COUNT(r.reservation_id) AS confirmed_bookings
FROM TRAIN t JOIN RESERVATION r ON t.train_id=r.train_id
WHERE r.status='Confirmed'
GROUP BY t.train_id,t.train_number,t.train_name
HAVING COUNT(r.reservation_id)>1;

-- 7. VIEWS
CREATE VIEW confirmed_bookings AS
SELECT r.reservation_id,p.name AS passenger_name,
       t.train_number,t.train_name,r.journey_date,
       r.seat_number,r.travel_class,r.status
FROM RESERVATION r
JOIN PASSENGER p ON r.passenger_id=p.passenger_id
JOIN TRAIN t ON r.train_id=t.train_id
WHERE r.status='Confirmed';

CREATE VIEW passenger_ticket_details AS
SELECT p.passenger_id,p.name AS passenger_name,
       t.train_number,t.train_name,r.journey_date,
       r.seat_number,r.travel_class,r.status,
       tk.ticket_number,tk.fare,tk.booking_date
FROM PASSENGER p
JOIN RESERVATION r ON p.passenger_id=r.passenger_id
JOIN TRAIN t ON r.train_id=t.train_id
JOIN TICKET tk ON r.reservation_id=tk.reservation_id;

SELECT * FROM confirmed_bookings;
SELECT * FROM passenger_ticket_details;

-- 8. STORED PROCEDURE: FIND TRAINS
DELIMITER //
CREATE PROCEDURE find_trains(
    IN source_station VARCHAR(100),
    IN destination_station VARCHAR(100)
)
BEGIN
    SELECT DISTINCT t.train_number,t.train_name
    FROM TRAIN t
    JOIN ROUTE r1 ON t.train_id=r1.train_id
    JOIN ROUTE r2 ON t.train_id=r2.train_id
    JOIN STATION s1 ON r1.station_id=s1.station_id
    JOIN STATION s2 ON r2.station_id=s2.station_id
    WHERE s1.station_name=source_station
      AND s2.station_name=destination_station
      AND r1.stop_number<r2.stop_number;
END //
DELIMITER ;

-- 9. STORED PROCEDURE: BOOK TICKET
DELIMITER //
CREATE PROCEDURE book_ticket(
    IN p_passenger_id INT,
    IN p_train_id INT,
    IN p_journey_date DATE,
    IN p_seat_number VARCHAR(10),
    IN p_travel_class VARCHAR(30)
)
BEGIN
    DECLARE seat_count INT;
    SELECT COUNT(*) INTO seat_count
    FROM RESERVATION
    WHERE train_id=p_train_id
      AND journey_date=p_journey_date
      AND seat_number=p_seat_number
      AND status='Confirmed';

    IF seat_count>0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Seat is already booked';
    ELSE
        INSERT INTO RESERVATION
        (passenger_id,train_id,journey_date,seat_number,travel_class,status)
        VALUES
        (p_passenger_id,p_train_id,p_journey_date,p_seat_number,p_travel_class,'Confirmed');
    END IF;
END //
DELIMITER ;

-- 10. STORED PROCEDURE: GENERATE TICKET
DELIMITER //
CREATE PROCEDURE generate_ticket(
    IN p_reservation_id INT,
    IN p_ticket_number VARCHAR(30),
    IN p_fare DECIMAL(10,2)
)
BEGIN
    INSERT INTO TICKET
    (reservation_id,ticket_number,fare,booking_date)
    VALUES
    (p_reservation_id,p_ticket_number,p_fare,CURDATE());
END //
DELIMITER ;

-- 11. STORED PROCEDURE: CANCEL RESERVATION
DELIMITER //
CREATE PROCEDURE cancel_reservation(IN p_reservation_id INT)
BEGIN
    UPDATE RESERVATION
    SET status='Cancelled'
    WHERE reservation_id=p_reservation_id;
END //
DELIMITER ;

-- 12. TRIGGER
DELIMITER //
CREATE TRIGGER after_reservation_cancel
AFTER UPDATE ON RESERVATION
FOR EACH ROW
BEGIN
    IF NEW.status='Cancelled' AND OLD.status<>'Cancelled' THEN
        DELETE FROM TICKET
        WHERE reservation_id=NEW.reservation_id;
    END IF;
END //
DELIMITER ;

-- 13. PROCEDURE EXAMPLES
CALL find_trains('Secunderabad Junction','Warangal');

-- 14. VERIFICATION
SHOW TABLES;
SHOW FULL TABLES WHERE Table_type='BASE TABLE';
SHOW FULL TABLES WHERE Table_type='VIEW';
SHOW PROCEDURE STATUS WHERE Db='railway_reservation';
SHOW TRIGGERS;

-- END OF PROJECT
