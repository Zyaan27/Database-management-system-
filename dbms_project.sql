Database Management system 
By- Mohammed Zyaan C 

Table crea on with inser on of values- 
create table branch(branch_name varchar2(30),branch_city 
varchar2(10),assets varchar2(30),constraint pk1_value primary 
key(branch_name)); 

create table customer(customer_id varchar2(10),customer_name 
varchar2(10),customer_street varchar2(10),customer_city 
varchar2(10),constraint pk2_value primary key(customer_id)); 

create table employee(employee_id varchar2(10),dependent_name 
varchar2(10),employment_length number(5),employee_name varchar2(10) 
NOT NULL ,telephone_number number(10) unique,start_date 
date,branch_name varchar2(30),constraint pk3_value primary 
key(employee_id),constraint 1_value foreign key(branch_name) references 
branch(branch_name));
 
create table loan( loan_number number(10),amount 
number(10),branch_name varchar2(30),constraint pk4_value primary 
key(loan_number),constraint 2_value foreign key(branch_name) references 
branch(branch_name));
 
create table account(account_number number(10),balance 
number(10),customer_id varchar2(10),constraint pk5_value primary 
key(account_number),constraint 4_value foreign key(customer_id) 
references customer(customer_id));
 
create table payment(payment_number number(10),loan_number 
number(10),payment_date date,payment_amount number(10),constraint 
6_value foreign key(loan_number) references loan(loan_number),constraint 
pk7_value primary key(payment_number,loan_number)); 

create table account_branch(branch_name varchar2(30),account_number 
number(10),constraint 12_value foreign key(branch_name) references 
branch(branch_name), constraint 13_value foreign key(account_number) 
references account(account_number),constraint pk8_value primary 
key(branch_name,account_number)); 

create table borrower(customer_id varchar2(10),loan_number 
number(10),constraint 14_value foreign key(customer_id) references 
customer(customer_id),constraint 15_value foreign key(loan_number) 
references loan(loan_number),constraint pk15_value primary 
key(customer_id,loan_number)); 

create table cust_banker(customer_id varchar2(10),employee_id 
varchar2(10),type varchar2(30),constraint 18_value foreign key(customer_id) 
references customer(customer_id),constraint 19_value foreign 
key(employee_id) references employee(employee_id),constraint pk20_value 
primary key(customer_id,employee_id));
 
Alter table branch add constraint check1_value check (branch_city in 
('Mumbai','Chennai','Vellore')); 



insert into branch values('Indian Bank','Mumbai','Machine'); 

insert into branch values('Bank of Baroda','Chennai','Furniture'); 

insert into branch values('State Bank of India','Vellore','Furniture');
 
insert into branch values('Punjab Na onal Bank','Vellore','Machine'); 

insert into branch values('Allhabad Bank','Mumbai','Machine'); 

insert into branch values('J&K Bank','Chennai','Furniture'); 

insert into branch values('Axis Bank','Mumbai','Machine');
 
insert into customer values('C1','Ram','MK road','Mumbai');
 
insert into customer values('C2','Adi','GT Road','Mumbai'); 

insert into customer values('C3','Karan','Gum ','Chennai'); 

insert into customer values('C4','Om','Parade','Chennai');
 
insert into customer values('C5','Kar k','Devki','Vellore');
 
insert into customer values('C6','Shiv','Bithoor','Mumbai');
 
insert into loan values(1,150000,'Indian Bank'); 

insert into loan values(2,160890,'State Bank of India');
 
insert into loan values(3,156000,'Allhabad Bank'); 

insert into loan values(4,70000,'Punjab Na onal Bank'); 

insert into loan values(5,15000,'State Bank of India'); 

insert into loan values(6,200000,'Axis Bank');
 
insert into account values(101,15000,'C1'); 

insert into account values(102,180000,'C2'); 

insert into account values(103,158000,'C3'); 

insert into account values(104,30000,'C4'); 

insert into account values(105,280000,'C5');
 
insert into account values(106,200000,'C1'); 

insert into payment values(1001,1,'17-jan-2022',30000); 

insert into payment values(1002,2,'25-mar-2022',5000);
 
insert into payment values(1003,4,'08-may-2022',75000); 

insert into payment values(1004,2,'30-jun-2022',23000); 

insert into payment values(1005,3,'05-jul-2022',100000); 

insert into payment values(1006,4,'19-oct-2022',9000);
 
insert into payment values(1007,6,'31-Dec-2022',37000); 

insert into account_branch values('Allhabad Bank',101);
 
insert into account_branch values('Indian Bank',102);
 
insert into account_branch values('Punjab Na onal Bank',103);
 
insert into account_branch values('J&K Bank',104); 

insert into account_branch values('Allhabad Bank',105);
 
insert into account_branch values('Indian Bank',106); 
insert into borrower values('C1',1);
 
insert into borrower values('C2',2); 

insert into borrower values('C3',3);
 
insert into borrower values('C4',4);
 
insert into borrower values('C5',4); 

insert into borrower values('C1',2);
 
insert into borrower values('C2',6);
 
insert into employee values('E1','Yash',5,'Gautam',9874563210,'12-jan
2014','Allhabad Bank'); 

insert into employee values('E2','Atharav',7,'Shreyansh',6587563210,'05-Mar
2013','Punjab Na onal Bank');
 
insert into employee values('E3','Sahil',9,'Shreyash',7854563210,'10-Jul
2011','Indian Bank'); 

insert into employee values('E4','Suyash',2,'Sanjay',6984563210,'16-Feb
2018','Allhabad Bank'); 

insert into employee values('E5','Samar',3,'Vijay',8574563210,'31-May
2017','Axis Bank'); 

insert into employee values('E6','Mohan',15,'Ravi',7595563210,'15-Jun
2008','Allhabad Bank'); 

insert into Cust_banker values('C1','E1','Bank teller'); 

insert into Cust_banker values('C2','E4','Loan processor');
 
insert into Cust_banker values('C3','E3','Credit Analyst');
 
insert into Cust_banker values('C4','E2','Banker'); 

insert into Cust_banker values('C5','E6','Financial Advisor');
 
insert into Cust_banker values('C6','E5','Financial Analyst'); 

Queries with outputs- 

Select * from branch; 
select * from customer; 
/*update date*/ 
update employee set start_date='30-jan-2014' where start_date='12-jan-2014'; 
/*update type*/ 
update cust_banker set type='Asset Manager' where type='Banker'; 
/*Delete where type=Financial analyst*/ 
Delete from cust_banker where type='Financial Analyst'; 
/*Fetching details*/ 
Select customer_id,employee_id,type from cust_banker; 
select employee_id,branch_name,start_date from employee; 
/*fetch all the customer id from customer and borrower*/  
SELECT customer_id FROM Customer UNION SELECT customer_id FROM 
Borrower;     
/*  Find the account numbers that exist both in the "account" table and the " 
account_branch" table. */ 
SELECT account_number FROM account INTERSECT SELECT account_number 
FROM account_branch; 
/* Get the customer IDs from the "Customer" table that do not have any 
corresponding entries in the "Borrower" table.*/ 
SELECT customer_id FROM Customer minus SELECT customer_id FROM 
Borrower; 
/* Get the account numbers from the "account" table that do not have any 
corresponding entries in the "account_branch" table.*/ 
SELECT account_number FROM account minus SELECT account_number FROM 
account_branch; 
/* Get the branch name which are there in loan table and in account_branch 
table*/ 
select branch_name from loan intersect select branch_name from 
account_branch; 
/* Retrieve the customer name, account number, and branch name for all 
customers who have an account and are associated with a branch.*/ 
SELECT c.customer_name, a.account_number, b.branch_name  
FROM Customer c  
JOIN account a ON c.customer_id = a.customer_id 
JOIN account_branch b ON a.account_number = b.account_number; 
/* Retrieve the customer name, account number, and branch name for all 
customers, including those who do not have an account. */ 
SELECT c.customer_name, a.account_number, b.branch_name 
FROM Customer c 
FULL OUTER JOIN account a ON c.customer_id = a.customer_id 
FULL OUTER JOIN account_branch b ON a.account_number = 
b.account_number; 
/* Retrieve the account number, customer name, and branch name for all 
accounts, including those that are not associated with a customer*/ 
SELECT a.account_number, c.customer_name, b.branch_name 
FROM account a 
RIGHT OUTER JOIN Customer c ON c.customer_id = a.customer_id 
RIGHT OUTER JOIN account_branch b ON a.account_number = 
b.account_number; 
/* Retrieve the customer ID, customer name, and loan number for customers 
who have taken out a loan.*/ 
SELECT c.customer_id, c.customer_name, l.loan_number 
FROM Customer c 
JOIN Borrower b on c.customer_id=b.customer_id 
JOIN loan l on l.loan_number=b.loan_number; 
/* Retrieve the count of loans for each branch.*/ 
select branch_name,count(*) from loan group by branch_name order by 
count(*) asc; 
/* Retrieve the total balance of accounts for each customer.*/ 
select customer_id,sum(balance) as TOTAL_BALANCE from account group by 
customer_id; 
/* Retrieve the minimum balance of accounts for each customer.*/ 
SELECT customer_id, MIN(balance) AS min_balance FROM account GROUP BY 
customer_id; 
/* Retrieve the customers who have taken more than one loan.*/ 
SELECT customer_id,count(loan_number) as loan_count from borrower group 
by customer_id having count(loan_number)>1; 
/*Retrieve the amount taken from each branch.*/ 
select branch_name,sum(amount) from loan group by branch_name; 
/* Retrieve the customer names who have taken out a loan.*/ 
select customer_name from customer where customer_id in(select 
customer_id from borrower); 
/* Retrieve the branch_city which have an account*/ 
select dis nct branch_city from branch where branch_name in(select 
branch_name from account_branch); 
/* Retrieve the branch names where at least one loan exists.*/ 
select branch_name from branch where branch_name in(select branch_name 
from loan); 
/* Retrieve the balance which is greater than average of balance*/ 
select balance from account where balance >(select avg(balance) from 
account); 
/*Retrieve the customer names who have not taken out any loans.*/ 
select customer_name from Customer c where not exists (select * from 
Borrower b WHERE c.customer_id = b.customer_id ); 
/*Retrieve the customer names who have taken out a loan.*/ 
select customer_name from Customer c where exists ( select * from Borrower 
b  WHERE b.customer_id = c.customer_id ); 
/* Retrieve the branch names where at least one loan exists.*/ 
select branch_name from account_branch b where exists ( select * from loan l  
WHERE l.branch_name = b.branch_name ); 