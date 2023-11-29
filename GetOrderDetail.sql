use LittleLemonDB;
prepare GetOrderDetail from 'select OrderID, Quantity, TotalCost from Orders where OrderID=?';

SET @order_id = 1;
EXECUTE GetOrderDetail USING @order_id;