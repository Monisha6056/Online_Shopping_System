create database Onlineshoppingsystem;
use Onlineshoppingsystem;
CREATE TABLE Products (
    Product_ID INT PRIMARY KEY auto_increment,
    Product_Name VARCHAR(255) NOT NULL,
    Category VARCHAR(100),
    Price DECIMAL(10, 2),
    Stock INT
);
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY auto_increment,
    First_Name VARCHAR(100) NOT NULL,
    Last_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    Phone_Number int(10),
    Address varchar(200)
);
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Order_Date DATE NOT NULL,
    Customer_ID INT,
    Total_Amount DECIMAL(10, 2),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);
CREATE TABLE Order_Details (
    OrderDetail_ID INT PRIMARY KEY,
    Order_ID INT,
    Product_ID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);
CREATE TABLE Payments (
    Payment_ID INT PRIMARY KEY,
    Order_ID INT,
    Payment_Date DATE NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    Payment_Method VARCHAR(50),
	Customer_ID INT,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);
INSERT INTO Products (Product_Name, Category, Price, Stock)
VALUES ('Laptop', 'Electronics', 1200.00, 100),('Mobile','Electronics',1100.00,200),('Fridge','Electronics',1500.00,200),('Bluetooth Speaker', 'Electronics', 45.99, 75),('Running Shoes', 'Footwear', 89.00, 120);
select * from Products;

INSERT INTO Customers (First_Name, Last_Name, Email, Phone_Number, Address)
VALUES ('John', 'Doe', 'john.doe@example.com', 1234056789, '123 Main St,banglore'),('Shiyam', 'Ganesh', 'shiyam07@example.com', 2034569871, '456 Oak Avenue, Riverside'),('Raghul', 'saravanan', 'raghulsa@example.com', 1298745630, '789 Pine Road, Hilltown'),('Alice', 'Williams', 'alice.williams@example.com', 1231231234, '101 Elm Street,velacherry'),('Shri', 'eniyan', 'eniyan25@example.com',1324567809, '257 nehru Street, porur');
select * from Customers;

INSERT INTO Orders (Order_ID, Order_Date,Customer_id,Total_Amount)
VALUES (1, '2024-08-19',1,1200.00),(2, '2024-09-17',2,1900.00),(3, '2023-09-07',3,2000.00),(4, '2022-01-15',4,9278.00),(5, '2020-01-15',5,80000.00);
select * from orders;

INSERT INTO Order_Details (OrderDetail_ID, Order_ID, Product_ID, Quantity, Price)
VALUES (1, 1, 1, 1, 1200.00),(2, 2, 2,2,1300.00),(3, 3, 3,3,1400.00),(4, 4, 4,4,1500.00),(5, 5, 5,5,1600.00);
select * from Order_Details;

INSERT INTO Payments (Payment_ID, Order_ID, Payment_Date, Amount, Payment_Method,Customer_ID)
VALUES (1, 1, '2024-08-19', 1200.00, 'Credit Card',1),(2, 2, '2024-07-18', 1400.00, 'Cash',2),(3, 3, '2023-08-19', 1600.00, 'Credit Card',3),(4, 4, '2024-08-19', 1900.00, 'Cash',4),(5, 5, '2024-02-23', 2450.00, 'Credit Card',5);
select * from payments;

update Products set Price = 1099.99 WHERE Product_ID = 1;

delete FROM Payments WHERE Payment_ID=1;

select Product_Name,Category from Products;

truncate table Products;

alter  table Products add column number_of_products int;
alter table Products drop column number_of_products;
alter table Products modify column Price int;
alter table Customers modify column Phone_Number int unique;

drop database onlineshoppingsystem;
drop table Products;

select distinct Category from Products;

select count(*) from Products group by Category having count(*)>1;

select Product_Name from Products order by Product_Name;

select Product_Name from Products where Product_ID=2;

SELECT concat (First_Name,' ',Last_Name)as full_name from Customers;

select * from Customers where First_Name like '%_e%';

select * from Payments where Payment_Date between '2024-08-19' and '2024-09-19';

select sum(Total_Amount) from Orders;
select min(Total_Amount) from Orders;;
select avg(Total_Amount) from Orders;

select * from Products where Category in("Electronics","footwear") limit 5;
select * from Products where Category  not in("Electronics");

select * from Orders where Customer_ID = (select Customer_ID from Customers where Email = 'john.doe@example.com');

select concat(upper(substring(First_Name,1,1)),lower(substring(First_Name,2,length(First_Name))))as Name from Customers;

select concat (upper(substring(First_Name, 1, 1)), lower(substring(Last_Name, 2, length(Last_Name)))) AS Name
FROM Customers;

create view online as select * from Orders where Customer_ID = (select Customer_ID from Customers where Email = 'john.doe@example.com');
select * from online ;

drop view online;

select c.First_Name,c.Last_Name,c.Phone_Number,case when length(c.Phone_Number) = 10 then 'Valid' else then 'Invalid'
end as Phone_Number_Status from Customers c;

select o.Order_ID,o.Order_Date,c.First_Name,c.Last_Name,c.Email,o.Total_Amount
from Orders as o inner join Customers as c ON o.Customer_ID = c.Customer_ID;

select o.Order_ID,o.Order_Date,c.First_Name,c.Last_Name,c.Email,o.Total_Amount
from Orders as o left join Customers as c ON o.Customer_ID = c.Customer_ID;

select o.Order_ID,o.Order_Date,c.First_Name,c.Last_Name,c.Email,o.Total_Amount
from Orders as o right join Customers as c ON o.Customer_ID = c.Customer_ID;

select o.Order_ID,o.Order_Date,c.First_Name,c.Last_Name,c.Email,o.Total_Amount
from Orders as o left join Customers as c ON o.Customer_ID = c.Customer_ID 
union 
select o.Order_ID,o.Order_Date,c.First_Name,c.Last_Name,c.Email,o.Total_Amount
from Orders as o right join Customers as c ON o.Customer_ID = c.Customer_ID;

show index from products;
create index moni_index on products(Product_ID);

create index moni_index on orders(order_ID);
show index from orders;











