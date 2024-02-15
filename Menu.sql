CREATE DATABASE Menu

USE Menu

CREATE TABLE Meals
(
	ID INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(30) NOT NULL,
	PRICE MONEY NOT NULL
)

CREATE TABLE Categories
(
	ID INT PRIMARY KEY IDENTITY,
	CtgName NVARCHAR(50) UNIQUE
)

ALTER TABLE Meals
ADD CategoryID INT FOREIGN KEY REFERENCES Categories(ID)

CREATE TABLE Ingredients
(
	ID INT PRIMARY KEY IDENTITY,
	IngrdName NVARCHAR(50) UNIQUE
)

CREATE TABLE Mealingred
(
	MealID INT FOREIGN KEY REFERENCES Meals(Id),
	IngredID INT FOREIGN KEY REFERENCES Ingredients(Id),
)



INSERT INTO Categories
VALUES
('Breakfast'),
('Dinner'),
('Lunch'),
('Dessert'),
('Main'),
('Snack'),
('Brunch')


INSERT INTO Meals
VALUES
('Cheesecake',7.5,1),
('Pizza',13.57,5),
('Cookies',5,6),
('Chips',3.4,6),
('Shrimp noddles',6.8,2),
('Peanut butter',8.9,1),
('Spaghetti',10,3),
('Fried rice',45.7,4)


INSERT INTO Ingredients
VALUES
('Rice'),
('Eggs'),
('Shrimp'),
('Peanut'),
('Cheese'),
('Potato'),
('Flour'),
('Tomato'),
('Milk'),
('Oil')


INSERT INTO Mealingred
VALUES
(1,5),
(1,9),
(1,2),
(2,5),
(2,8),
(3,9),
(3,7),
(4,6),
(5,3),
(5,7),
(6,4),
(6,10),
(7,8),
(7,2),
(8,1),
(8,6)

--Bütün yeməkləri yanında ingredient sayı ilə birlikdə select edən query
SELECT *, (SELECT COUNT(*) FROM Mealingred AS MI WHERE MI.MealID = M.ID) AS IngredCount 
FROM Meals AS M

--Bütün category-ləri yanında o 
--kateqoriyadaki ən bahalı və ən ucuz yemək qiyməti ilə select edən query
SELECT *,MAX(M.[Name]) AS MostExpensiveMeal, MIN(M.[Name]) AS LeastExpensiveMeal
FROM Categories AS C JOIN Meals AS M ON C.ID = M.CategoryID
GROUP BY C.CtgName


--Bütün yemekləri select edib yanında category adını da göstərən query
SELECT * FROM Meals AS M
JOIN Categories AS C ON M.CategoryID=C.ID

--Hec bir yeməyi olmayan katqoriyaları select edən query
SELECT * FROM Meals AS M
RIGHT JOIN Categories AS C ON M.CategoryID=C.ID

