use LittleLemonDB;
CREATE VIEW `OrdersView` AS
select o.OrderId, o.Quantity, o.TotalCost from Orders o