-- CREATE TABLE departments (
--     Department_Number VARCHAR(255) PRIMARY KEY,
--     Department_Name VARCHAR(255) NOT NULL
-- );

-- CREATE TABLE employees (
--     Employee_Number INT PRIMARY KEY,
--     Employee_Title_ID VARCHAR(255) NOT NULL,
--     Birth_Date DATE NOT NULL,
--     First_Name VARCHAR(255) NOT NULL,
--     Last_Name VARCHAR(255) NOT NULL,
--     Sex CHAR(1) NOT NULL,
--     Hire_Date DATE NOT NULL,
--     FOREIGN KEY (Employee_Title_ID) REFERENCES titles(Title_ID)
-- );

-- CREATE TABLE titles (
--     Title_ID VARCHAR(255) PRIMARY KEY,
--     Title VARCHAR(255) NOT NULL
-- );

-- CREATE TABLE dept_employee (
--     Employee_Number INT,
--     Department_Number VARCHAR(255) NOT NULL,
--     PRIMARY KEY (Employee_Number, Department_Number),
--     FOREIGN KEY (Employee_Number) REFERENCES employees(Employee_Number),
--     FOREIGN KEY (Department_Number) REFERENCES departments(Department_Number)
-- );

-- CREATE TABLE dept_manager (
--     Department_Number VARCHAR(255) NOT NULL,
--     Employee_Number INT,
--     PRIMARY KEY (Department_Number, Employee_Number),
--     FOREIGN KEY (Department_Number) REFERENCES departments(Department_Number),
--     FOREIGN KEY (Employee_Number) REFERENCES employees(Employee_Number)
-- );

-- CREATE TABLE salaries (
--     Employee_Number INT PRIMARY KEY,
--     Salary DECIMAL(10, 2) NOT NULL,
--     FOREIGN KEY (Employee_Number) REFERENCES employees(Employee_Number)
-- );

select * from employees


SELECT e.Employee_Number, e.Last_Name, e.First_Name, e.Sex, s.Salary
FROM employees e
JOIN salaries s ON e.Employee_Number = s.Employee_Number;

SELECT First_Name, Last_Name, Hire_Date
FROM employees
WHERE EXTRACT(YEAR FROM Hire_Date) = 1986;

SELECT dm.Department_Number, d.Department_Name, dm.Employee_Number, e.Last_Name, e.First_Name
FROM dept_manager dm
JOIN departments d ON dm.Department_Number = d.Department_Number
JOIN employees e ON dm.Employee_Number = e.Employee_Number;

SELECT de.Employee_Number, e.Last_Name, e.First_Name, d.Department_Number, d.Department_Name
FROM dept_employee de
JOIN employees e ON de.Employee_Number = e.Employee_Number
JOIN departments d ON de.Department_Number = d.Department_Number;

SELECT First_Name, Last_Name, Sex
FROM employees
WHERE First_Name = 'Hercules' AND Last_Name LIKE 'B%';

SELECT e.Employee_Number, e.Last_Name, e.First_Name
FROM employees e
JOIN dept_employee de ON e.Employee_Number = de.Employee_Number
JOIN departments d ON de.Department_Number = d.Department_Number
WHERE d.Department_Name = 'Sales';

SELECT e.Employee_Number, e.Last_Name, e.First_Name, d.Department_Name
FROM employees e
JOIN dept_employee de ON e.Employee_Number = de.Employee_Number
JOIN departments d ON de.Department_Number = d.Department_Number
WHERE d.Department_Name IN ('Sales', 'Development');

SELECT Last_Name, COUNT(*) AS Frequency
FROM employees
GROUP BY Last_Name
ORDER BY Frequency DESC;
