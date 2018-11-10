
use HotelReservations;

select r.id, c.name, r.startdate, r.enddate 
from Reservation r
inner join Customer c on r.customerid = c.id
where r.enddate = '2018/10/10';

select reserve.id as ReservationID, c.name, r.ID as RoomID, r.Floor
from Room r
inner join ReservationRooms rr on r.id = rr.roomid
inner join Reservation reserve on rr.reservationid = reserve.id
inner join Customer c on reserve.CustomerId = c.id
where c.name = 'Mead';

select p.name, count(p.id) as TimesUsed
from Promotion p
inner join ReservationPromotions rp on p.id = rp.PromotionId
group by p.id
order by count(p.id)


