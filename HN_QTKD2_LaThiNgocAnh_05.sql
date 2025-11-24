CREATE DATABASE AirlineManagement;
USE AirlineManagement;
CREATE TABLE Passengers (
    PassengerId VARCHAR(10) PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    PassportNumber VARCHAR(20) UNIQUE,
    Nationality VARCHAR(50) DEFAULT 'Viet Nam'
);

CREATE TABLE Flights (
    FlightId VARCHAR(10) PRIMARY KEY,
	DepartureCity VARCHAR(50) NOT NULL,
    ArrivalCity VARCHAR(50) NOT NULL,
    FlightDate DATE,
    FlightTime TIME
);

CREATE TABLE Tickets (
    PassengerId VARCHAR(10),
    FlightId VARCHAR(10),
    Class ENUM('PhoThong', 'ThuongGia') DEFAULT 'PhoThong',
    Price DECIMAL(15, 2),
    PRIMARY KEY (PassengerId, FlightId),
    FOREIGN KEY (PassengerId) REFERENCES Passengers(PassengerId),
    FOREIGN KEY (FlightId) REFERENCES Flights(FlightId)
);
-- Câu 2: Thêm dữ liệu
INSERT INTO Passengers VALUES
('HK01', 'Nguyen Van Hung', 'B1234567', 'Viet Nam'),
('HK02', 'John Smith', 'C9876543', 'USA'),
('HK03', 'Tran Thi Mai', 'B2345678', 'Viet Nam'),
('HK04', 'Lee Min Ho', 'K1122334', 'Korea'),
('HK05', 'Pham Van Tuan', 'B3456789', 'Viet Nam');

INSERT INTO Flights VALUES
('VN100', 'Ha Noi', 'Da Nang', '2023-10-20', '08:00:00'),
('VN200', 'Ho Chi Minh', 'Ha Noi', '2023-10-21', '14:30:00'),
('VJ300', 'Ha Noi', 'Tokyo', '2023-10-22', '23:00:00');

INSERT INTO Tickets VALUES
('HK01', 'VN100', 'PhoThong', 1500000),
('HK01', 'VN200', 'ThuongGia', 3000000),
('HK02', 'VN100', 'PhoThong', 1500000),
('HK03', 'VN200', 'PhoThong', 1200000),
('HK03', 'VJ300', 'PhoThong', 5000000),
('HK04', 'VJ300', 'ThuongGia', 10000000),
('HK05', 'VN100', 'PhoThong', 1400000);

-- Câu 3: Cập nhật dữ liệu
-- Cập nhật giờ bay (FlightTime) của chuyến bay 'VN100' thành '09:00:00'.
UPDATE Flights
SET FlightTime = '09:00:00'
WHERE FlightId = 'VN100';

-- Tăng giá vé (Price) thêm 500000 cho khách hàng 'HK04' trên chuyến bay 'VJ300
UPDATE Tickets
SET Price = Price + 500000
WHERE PassengerId = 'HK04' AND FlightId = 'VJ300';

-- Hủy vé máy bay của hành khách 'HK02' trên chuyến bay 'VN100'.
DELETE FROM Tickets
WHERE PassengerId = 'HK02' AND FlightId = 'VN100';

-- Câu 4: Truy vấn cơ bản
-- 1.Lấy danh sách hành khách (PassengerId, FullName) có quốc tịch là 'Viet Nam'.
SELECT PassengerId, FullName
FROM Passengers
WHERE Nationality = 'Viet Nam';

-- 2.Lấy danh sách các chuyến bay (FlightId, ArrivalCity) bay đến 'Ha Noi'.
SELECT FlightId, ArrivalCity
FROM Fights
WHERE  = 'Ha Noi'

-- 3.Lấy danh sách vé máy bay (PassengerId, FlightId, Price) có hạng vé là 'ThuongGia'.
SELECT PassengerId, FlightId, Price
FROM Tickets
WHERE Class = 'ThuongGia';

-- 4.Tìm các chuyến bay có ngày bay (FlightDate) trước ngày '2023-10-22'.
SELECT *
FROM Flights
WHERE FlightDate < '22'



-- 5.Lấy ra danh sách vé máy bay, sắp xếp theo giá giảm dần.



-- 6.Lấy ra thông tin của 2 hành khách đầu tiên trong bảng Passengers.


