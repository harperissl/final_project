use LittleLemonDB;
DROP PROCEDURE IF EXISTS CheckBooking;
delimiter //
CREATE PROCEDURE CheckBooking(check_data DATE,table_Number INT)
begin
   select 
		case
			when exists (select * from Bookings where BookingDate = check_data and TableNumber = table_Number)  then CONCAT("Table ", table_number, " is already booked")
			else CONCAT("Table ", table_number, " now available")
        end as 'Booking status';
end //
delimiter ;
CALL CheckBooking("2022-11-12", 3);