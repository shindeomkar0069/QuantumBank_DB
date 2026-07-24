-- ===========================================
-- QuantumBank DB
-- Banking Management System using MySQL
-- ===========================================

-- STEP 1: Create Database
CREATE DATABASE BankingDB;
USE BankingDB;

-- ===========================================
-- STEP 2: Create Tables
-- ===========================================

CREATE TABLE Customers (
    CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    date_of_birth DATE,
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE,
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    created_at DATE
);
CREATE TABLE Branches (
    branch_id INT PRIMARY KEY AUTO_INCREMENT,
    branch_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    state VARCHAR(50),
    manager_name VARCHAR(100)
);
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    branch_id INT,
    account_number VARCHAR(20) UNIQUE,
    account_type VARCHAR(20),
    balance DECIMAL(12,2),
    opened_date DATE,
    status VARCHAR(20),

    FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id),

    FOREIGN KEY (branch_id)
        REFERENCES Branches(branch_id)
);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT,
    transaction_type VARCHAR(20),
    amount DECIMAL(12,2),
    transaction_date DATETIME,
    description VARCHAR(255),

    FOREIGN KEY (account_id)
        REFERENCES Accounts(account_id)
);
CREATE TABLE Loans (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    branch_id INT,
    loan_type VARCHAR(30),
    loan_amount DECIMAL(12,2),
    interest_rate DECIMAL(5,2),
    start_date DATE,
    end_date DATE,
    loan_status VARCHAR(20),

    FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id),

    FOREIGN KEY (branch_id)
        REFERENCES Branches(branch_id)
);
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    branch_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    designation VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE,

    FOREIGN KEY (branch_id)
        REFERENCES Branches(branch_id)
);

-- ===========================================
-- STEP 3: Insert Sample Data
-- ===========================================

INSERT INTO Branches (branch_name, city, state, manager_name)
VALUES
('Main Branch', 'Mumbai', 'Maharashtra', 'Rajesh Sharma'),
('City Branch', 'Pune', 'Maharashtra', 'Anita Patil'),
('North Branch', 'Delhi', 'Delhi', 'Amit Kumar'),
('South Branch', 'Bengaluru', 'Karnataka', 'Priya Nair'),
('East Branch', 'Kolkata', 'West Bengal', 'Sourav Das'),
('West Branch', 'Ahmedabad', 'Gujarat', 'Neha Shah'),
('Central Branch', 'Hyderabad', 'Telangana', 'Vikram Reddy'),
('Lake Branch', 'Bhopal', 'Madhya Pradesh', 'Meera Singh'),
('Capital Branch', 'Jaipur', 'Rajasthan', 'Arjun Verma'),
('Metro Branch', 'Chennai', 'Tamil Nadu', 'Kavita Iyer');

INSERT INTO Customers
(first_name, last_name, gender, date_of_birth, phone, email, address, city, state, created_at)
VALUES
('Rahul', 'Patel', 'Male', '1995-06-15', '9876543210', 'rahul.patel@gmail.com', 'MG Road', 'Pune', 'Maharashtra', '2024-01-10'),

('Priya', 'Sharma', 'Female', '1998-03-20', '9876543211', 'priya.sharma@gmail.com', 'FC Road', 'Pune', 'Maharashtra', '2024-02-15'),

('Amit', 'Kumar', 'Male', '1992-09-12', '9876543212', 'amit.kumar@gmail.com', 'Connaught Place', 'Delhi', 'Delhi', '2024-01-18'),

('Sneha', 'Joshi', 'Female', '1996-11-08', '9876543213', 'sneha.joshi@gmail.com', 'Baner Road', 'Pune', 'Maharashtra', '2024-03-02'),

('Rohan', 'Mehta', 'Male', '1994-07-25', '9876543214', 'rohan.mehta@gmail.com', 'Satellite', 'Ahmedabad', 'Gujarat', '2024-02-20'),

('Anjali', 'Verma', 'Female', '1997-05-30', '9876543215', 'anjali.verma@gmail.com', 'Civil Lines', 'Jaipur', 'Rajasthan', '2024-03-05'),

('Vikram', 'Reddy', 'Male', '1991-12-10', '9876543216', 'vikram.reddy@gmail.com', 'Banjara Hills', 'Hyderabad', 'Telangana', '2024-01-25'),

('Kavita', 'Iyer', 'Female', '1993-08-18', '9876543217', 'kavita.iyer@gmail.com', 'T Nagar', 'Chennai', 'Tamil Nadu', '2024-02-12'),

('Arjun', 'Singh', 'Male', '1990-10-22', '9876543218', 'arjun.singh@gmail.com', 'Indiranagar', 'Bengaluru', 'Karnataka', '2024-03-10'),

('Meera', 'Das', 'Female', '1999-04-05', '9876543219', 'meera.das@gmail.com', 'Salt Lake', 'Kolkata', 'West Bengal', '2024-03-15');

INSERT INTO Accounts
(customer_id, branch_id, account_number, account_type, balance, opened_date, status)
VALUES
(1, 2, 'SB100001', 'Savings', 50000.00, '2024-01-15', 'Active'),
(2, 2, 'SB100002', 'Savings', 75000.00, '2024-02-10', 'Active'),
(3, 3, 'CU100003', 'Current', 120000.00, '2024-01-20', 'Active'),
(4, 2, 'SB100004', 'Savings', 35000.00, '2024-03-05', 'Active'),
(5, 6, 'CU100005', 'Current', 95000.00, '2024-02-18', 'Active'),
(6, 9, 'SB100006', 'Savings', 45000.00, '2024-03-12', 'Active'),
(7, 7, 'SB100007', 'Savings', 68000.00, '2024-01-25', 'Active'),
(8, 10, 'CU100008', 'Current', 150000.00, '2024-02-28', 'Active'),
(9, 4, 'SB100009', 'Savings', 89000.00, '2024-03-18', 'Active'),
(10, 5, 'SB100010', 'Savings', 41000.00, '2024-03-20', 'Active');

INSERT INTO Transactions
(account_id, transaction_type, amount, transaction_date, description)
VALUES
(1, 'Deposit', 10000.00, '2024-04-01 10:15:00', 'Salary Credit'),
(1, 'Withdrawal', 2000.00, '2024-04-02 11:30:00', 'ATM Withdrawal'),
(2, 'Deposit', 15000.00, '2024-04-03 09:45:00', 'Cash Deposit'),
(3, 'Transfer', 5000.00, '2024-04-04 14:20:00', 'Online Transfer'),
(4, 'Deposit', 8000.00, '2024-04-05 16:00:00', 'Cheque Deposit'),
(5, 'Withdrawal', 3000.00, '2024-04-06 13:10:00', 'ATM Withdrawal'),
(6, 'Deposit', 12000.00, '2024-04-07 10:40:00', 'Salary Credit'),
(7, 'Transfer', 7000.00, '2024-04-08 15:25:00', 'UPI Transfer'),
(8, 'Deposit', 25000.00, '2024-04-09 12:00:00', 'Business Income'),
(9, 'Withdrawal', 5000.00, '2024-04-10 17:30:00', 'Cash Withdrawal'),
(10, 'Deposit', 9000.00, '2024-04-11 11:00:00', 'Salary Credit'),
(2, 'Withdrawal', 4000.00, '2024-04-12 18:15:00', 'Online Shopping');

INSERT INTO Loans
(customer_id, branch_id, loan_type, loan_amount, interest_rate, start_date, end_date, loan_status)
VALUES
(1, 2, 'Home Loan', 2500000.00, 8.50, '2024-01-01', '2044-01-01', 'Active'),
(3, 3, 'Car Loan', 800000.00, 9.20, '2024-02-15', '2029-02-15', 'Active'),
(5, 6, 'Personal Loan', 300000.00, 11.50, '2024-03-10', '2027-03-10', 'Active'),
(7, 7, 'Education Loan', 600000.00, 8.90, '2024-01-20', '2032-01-20', 'Active'),
(9, 4, 'Business Loan', 1500000.00, 10.25, '2024-02-28', '2034-02-28', 'Active');

INSERT INTO Employees
(branch_id, first_name, last_name, designation, salary, hire_date)
VALUES
(1, 'Rakesh', 'Gupta', 'Manager', 85000.00, '2020-01-15'),
(2, 'Neha', 'Patil', 'Cashier', 40000.00, '2022-06-20'),
(3, 'Aman', 'Verma', 'Officer', 55000.00, '2021-09-10'),
(4, 'Pooja', 'Sharma', 'Manager', 82000.00, '2019-11-18'),
(5, 'Sanjay', 'Das', 'Cashier', 42000.00, '2023-02-01'),
(6, 'Kiran', 'Shah', 'Officer', 50000.00, '2022-08-25'),
(7, 'Deepak', 'Reddy', 'Manager', 88000.00, '2018-05-12'),
(8, 'Anita', 'Singh', 'Officer', 53000.00, '2021-04-16'),
(9, 'Ritu', 'Joshi', 'Cashier', 41000.00, '2023-01-05'),
(10, 'Harish', 'Iyer', 'Manager', 90000.00, '2019-07-30');

-- ===========================================
-- STEP 4: Basic Queries
-- ===========================================

SELECT * FROM Customers;

SELECT * FROM Branches;

SELECT * FROM Accounts;

SELECT * FROM Transactions;

SELECT * FROM Loans;

SELECT * FROM Employees;



-- ===========================================
-- STEP 5: JOIN Queries
-- ===========================================

SELECT ...
FROM Customers
JOIN Accounts
ON Customers.customer_id = Accounts.customer_id;


SELECT
    c.first_name,
    c.last_name,
    a.account_number,
    b.branch_name,
    b.city
FROM Customers c
JOIN Accounts a
ON c.customer_id = a.customer_id
JOIN Branches b
ON a.branch_id = b.branch_id;


SELECT
    c.first_name,
    c.last_name,
    t.transaction_type,
    t.amount,
    t.transaction_date
FROM Customers c
JOIN Accounts a
ON c.customer_id = a.customer_id
JOIN Transactions t
ON a.account_id = t.account_id;



-- ===========================================
-- STEP 6: Aggregate Function Queries
-- ===========================================

SELECT COUNT(*) FROM Customers;

SELECT SUM(balance) FROM Accounts;

SELECT AVG(balance) FROM Accounts;

SELECT MAX(balance) FROM Accounts;

SELECT MIN(balance) FROM Accounts;
