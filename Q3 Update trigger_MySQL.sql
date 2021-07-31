#Q3 Create an update trigger in MySQL/Oracle which will store the details from the parent table 

create database employee;

create table employee (
    empNum int not null,
    lastname varchar(25) not null,
    firstname varchar(25) not null,
    extension int not null,
    email varchar(25) not null,
    officeCode int not null,
    reportsTo varchar(25) not null,
    jobTitle varchar(25)
);

insert into employee values
(101, 'Jadhav', 'Ravi', 28684595, 'ravijadhav@gmail.com', 1225, 'Manager', 'Accountant'),
(102, 'Jadhav', 'Bharat', 28697532, 'bharatjadhav@gmail.com', 1227, 'Manager', 'Cashier'),
(103, 'Chaudhari', 'Ankush', 28679543, 'ankushchaudhari@gmail.com', 1577, 'Manager', 'Analyst'),
(104, 'Shinde', 'Sneha', 2648563, 'snehashinde@gmail.com', 1576, 'Manager', 'Developer');

select * from employee;

create table emp_audit (
    id int auto_increment primary key,
    empNum int not null,
    lastname varchar(25) not null,
    changedate datetime default null,
    action varchar(25) default null
);

create trigger before_employee_update 
	before update on employee
	for each row
insert into emp_audit
set action = 'update',
     empNum = old.empNum,
     lastname = old.lastname,
     changedate = now();
     
show triggers;
#drop trigger before_employee_update;

set sql_safe_updates = 0; #to remove the safe mode from mysql
update employee set firstname = 'Pushkar' where empNum = 102;
set sql_safe_updates = 1;

select * from emp_audit;
select * from employee;