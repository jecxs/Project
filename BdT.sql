CREATE TABLE Drivers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    license VARCHAR(50),
    phone VARCHAR(20)
);

CREATE TABLE Buses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    plate VARCHAR(20),
    model VARCHAR(50),
    capacity INT,
    driver_id INT UNIQUE,  -- Un conductor solo puede estar asignado a un bus
    FOREIGN KEY (driver_id) REFERENCES Drivers(id)
);

CREATE TABLE Routes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),         
    origin VARCHAR(100),       
    destination VARCHAR(100)   
);

CREATE TABLE Trips (
    id INT PRIMARY KEY AUTO_INCREMENT,
    bus_id INT,                -- Bus asignado al viaje
    driver_id INT,             
    route_id INT,              
    date_time DATETIME,        
    FOREIGN KEY (bus_id) REFERENCES Buses(id),
    FOREIGN KEY (driver_id) REFERENCES Drivers(id),
    FOREIGN KEY (route_id) REFERENCES Routes(id)
);

CREATE TABLE Passengers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE Trip_Passenger (
    trip_id INT,
    passenger_id INT,
    PRIMARY KEY (trip_id, passenger_id),  
    FOREIGN KEY (trip_id) REFERENCES Trips(id),
    FOREIGN KEY (passenger_id) REFERENCES Passengers(id)
);
