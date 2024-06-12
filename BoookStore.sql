.mode box
.header on


-- Create the Authors table
CREATE TABLE Authors (
		author_id INTEGER PRIMARY KEY,
		author_name TEXT NOT NULL,
		nationality TEXT,
		birth_year INTEGER
);

-- Create the Books table
CREATE TABLE Books (
		book_id INTEGER PRIMARY KEY,
		title TEXT NOT NULL,
		author_id INTEGER,
		genre TEXT,
		publication_date DATE,
		price REAL,
		stock_quantity INTEGER,
		FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Create the Customers table
CREATE TABLE Customers (
		customer_id INTEGER PRIMARY KEY,
		name TEXT NOT NULL,
		email TEXT,
		address TEXT,
		phone_number TEXT
);

-- Create the Orders table
CREATE TABLE Orders (
		order_id INTEGER PRIMARY KEY,
		customer_id INTEGER,
		order_date DATE,
		total_price REAL,
		FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create the Order_Details table
CREATE TABLE Order_Details (
		order_detail_id INTEGER PRIMARY KEY,
		order_id INTEGER,
		book_id INTEGER,
		quantity INTEGER,
		price REAL,
		FOREIGN KEY (order_id) REFERENCES Orders(order_id),
		FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Insert data into Authors table
INSERT INTO Authors (author_name, nationality, birth_year) VALUES 
('J.K. Rowling', 'British', 1965),
('George Orwell', 'British', 1903),
('Harper Lee', 'American', 1926),
('J.R.R. Tolkien', 'British', 1892),
('Agatha Christie', 'British', 1890);

-- Insert data into Books table
INSERT INTO Books (title, author_id, genre, publication_date, price, stock_quantity) VALUES 
('Harry Potter and the Philosopher''s Stone', 1, 'Fantasy', '1997-06-26', 20.99, 100),
('1984', 2, 'Dystopian', '1949-06-08', 15.99, 50),
('To Kill a Mockingbird', 3, 'Fiction', '1960-07-11', 18.50, 75),
('The Hobbit', 4, 'Fantasy', '1937-09-21', 22.50, 80),
('Murder on the Orient Express', 5, 'Mystery', '1934-01-01', 12.99, 60),
('The Great Gatsby', 3, 'Fiction', '1925-04-10', 14.99, 45),
('Pride and Prejudice', 5, 'Romance', '1813-01-28', 16.99, 55),
('Lord of the Flies', 2, 'Adventure', '1954-09-17', 13.50, 65),
('The Catcher in the Rye', 3, 'Coming-of-age', '1951-07-16', 17.50, 70),
('The Da Vinci Code', 1, 'Thriller', '2003-03-18', 19.99, 90),
('The Alchemist', 4, 'Adventure', '1988-09-01', 12.49, 85),
('The Chronicles of Narnia', 4, 'Fantasy', '1950-10-16', 23.99, 95),
('Gone with the Wind', 3, 'Historical Fiction', '1936-06-30', 21.50, 100),
('Brave New World', 2, 'Science Fiction', '1932-10-14', 20.50, 80),
('Wuthering Heights', 5, 'Gothic Fiction', '1847-12-13', 15.99, 60),
('The Picture of Dorian Gray', 3, 'Gothic Horror', '1890-07-20', 18.99, 65),
('Dracula', 5, 'Gothic Horror', '1897-05-26', 11.99, 75),
('Frankenstein', 3, 'Gothic Science Fiction', '1818-01-01', 12.99, 70),
('The Road', 2, 'Post-apocalyptic', '2006-09-26', 16.50, 85),
('Moby-Dick', 5, 'Adventure', '1851-10-18', 24.99, 90);

-- Insert data into Customers table
INSERT INTO Customers (name, email, address, phone_number) VALUES 
('Alice Johnson', 'alice@example.com', '123 Main St, Anytown', '555-1234'),
('Bob Smith', 'bob@example.com', '456 Elm St, Othertown', '555-5678'),
('Charlie Brown', 'charlie@example.com', '789 Oak St, Anothertown', '555-9012'),
('David Lee', 'david@example.com', '321 Pine St, Somewhere', '555-3456'),
('Emma Watson', 'emma@example.com', '654 Birch St, Nowhere', '555-7890'),
('Frank Wright', 'frank@example.com', '987 Maple St, Elsewhere', '555-2345'),
('Grace Miller', 'grace@example.com', '654 Oak St, Anytown', '555-6789'),
('Henry Taylor', 'henry@example.com', '123 Elm St, Othertown', '555-3456'),
('Isabella Clark', 'isabella@example.com', '321 Pine St, Somewhere', '555-8901'),
('Jack Baker', 'jack@example.com', '987 Maple St, Elsewhere', '555-4567');

-- Insert data into Orders table
INSERT INTO Orders (customer_id, order_date) VALUES 
(1, '2024-06-01'),
(2, '2024-06-02'),
(3, '2024-06-03'),
(4, '2024-06-04'),
(5, '2024-06-05'),
(6, '2024-06-06'),
(7, '2024-06-07'),
(8, '2024-06-08'),
(9, '2024-06-09'),
(10, '2024-06-10');

-- Insert data into Order_Details table
INSERT INTO Order_Details (order_id, book_id, quantity, price) VALUES 
(1, 1, 2, 41.98),
(2, 3, 1, 18.50),
(3, 4, 1, 22.50),
(4, 1, 3, 62.97),
(5, 5, 1, 12.99),
(6, 7, 2, 33.98),
(7, 10, 1, 17.50),
(8, 12, 1, 23.99),
(9, 15, 3, 56.97);

-- -- Retrieve books with their authors and order details
-- SELECT c.name AS Customers, sum(od.price * od.quantity) AS Total_Order_Price
-- FROM Order_Details od
-- JOIN Orders o ON od.order_id = o.order_id
-- JOIN Customers c ON o.customer_id = c.customer_id
-- GROUP BY c.name
-- ORDER BY Total_Order_Price DESC LIMIT 3;

-- -- Calculate total revenue per genre
-- SELECT genre, SUM(price * stock_quantity) AS Total_Revenue
-- FROM Books
-- GROUP BY genre
-- ORDER BY Total_Revenue DESC;

-- -- Find top customers by total spending
-- SELECT c.name AS Customers, sum(od.price * od.quantity) AS Total_Order_Price
-- FROM Order_Details od
-- JOIN Orders o ON od.order_id = o.order_id
-- JOIN Customers c ON o.customer_id = c.customer_id
-- GROUP BY c.name
-- ORDER BY Total_Order_Price DESC LIMIT 3;

-- -- Identify authors with the highest number of books sold
-- SELECT a.author_name as Author_Name, SUM(od.quantity) AS Total_Quantity_Sold
-- FROM Order_Details od
-- JOIN Books b ON od.book_id = b.book_id
-- JOIN Authors a ON b.author_id = a.author_id
-- GROUP BY a.author_name;

-- -- Find the most popular genre among top-spending customers
-- SELECT b.genre AS Genre, COUNT(b.genre) AS Amount_Sold
-- FROM Order_details od
-- JOIN Books b ON od.book_id = b.book_id
-- GROUP BY  b.genre
-- ORDER BY Amount_Sold DESC;

-- -- Retrieve the author's name, the average price of their books, and the total number of books sold by each author.
-- SELECT a.author_name AS Author_Name, AVG(b.price) AS Average_Book_Price,  SUM(od.quantity) AS Total_Book_Sold
-- FROM Order_Details od
-- JOIN Books b ON od.book_id = b.book_id
-- JOIN Authors a ON b.author_id = a.author_id
-- GROUP BY a.author_name
-- ORDER BY Average_Book_Price DESC LIMIT 3;

-- -- Write a SQL query to find the top 5 customers who have spent the most money on books, along with the total number of books they've purchased and the average price per book. 
-- SELECT c.name AS Customer_Name, SUM(od.quantity * od.price) AS Total_Amount_Spent, SUM(od.quantity) AS Total_Books_Purchased, AVG(od.price) AS Average_Price_Per_Book
-- FROM Order_Details od
-- JOIN Orders o ON od.order_id = o.order_id
-- JOIN Customers c ON o.customer_id = c.customer_id
-- GROUP BY c.name
-- ORDER BY Total_Amount_Spent DESC LIMIT 5;

WITH TopCustomers AS (
	SELECT c.name AS Customer_Name,
				 SUM(od.quantity * od.price) AS Total_Amount_Spent
	FROM Customers c
	JOIN Orders o ON c.customer_id = o.customer_id
	JOIN Order_Details od ON o.order_id = od.order_id
	GROUP BY c.name
	ORDER BY Total_Amount_Spent DESC
	LIMIT 5
)
SELECT tc.Customer_Name,
		 tc.Total_Amount_Spent,
		 (
				 SELECT b.title
				 FROM Orders o
				 JOIN Order_Details od ON o.order_id = od.order_id
				 JOIN Books b ON od.book_id = b.book_id
				 WHERE o.customer_id = tc.Customer_Name
				 ORDER BY b.price DESC
				 LIMIT 3
		 ) AS Expensive_Book_Title
FROM TopCustomers tc;

