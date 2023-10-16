show databases;
create database LibraryManagementSystem;
use LibraryManagementSystem;

create table section(
section_id int PRIMARY KEY AUTO_INCREMENT,
section_name varchar(50) NOT NULL, 
opening_time time default '090000',
closing_time time
);

desc section;

insert into section(section_name,closing_time)
values('Department of Mathematics','150000');

insert into section(section_name,closing_time)
values('Applied Science','140000'),
('Literature','200000'),
('Kids Section','180000'),
('Encyclopedia','190000'),
('Psychology','140000');

select * from section;

create table staff(
staff_id int PRIMARY KEY AUTO_INCREMENT,
section_id int,
staff_firstname varchar(20) NOT NULL,
staff_lastname varchar(20),
Role varchar(20),
Age int check(age>=18),
salary float
);

desc staff;

alter table staff
add FOREIGN KEY(section_id) REFERENCES section(section_id);

show create table staff;

alter table staff
drop constraint staff_ibfk_1;

insert into staff(section_id,staff_firstname,staff_lastname,Role,Age,Salary)
values(1,'Harry','Dawson','HOD',54,60000),
(1,'Mac','Jenkins','Technical Head',46,52654),
(2,'Arun','Nandan','HOD',59,60000),
(1,'Jaideep','Singh','Librarian',42,48000),
(3,'Manish','Kumar','Technical Head',35,28000),
(2,'Kuldeep','Kale','Assistent Librarian',28,13000),
(1,'Manish','Kadam','Assistent Librarian',36,35000),
(3,'Jacob','John','HOD',58,51000),
(2,'Ravi','Subramaniam','Technical Head',24,15000),
(2,'Salim','Abbas','Librarian',47,56000),
(3,'Vishal','Dave','Assistent Librarian',28,45000),
(3,'Punit','Singh','Librarian',31,33000),
(4,'Vivek','Kubal','HOD',25,56121),
(4,'Pranit','Sonawane','Technical Head',56,75000),
(4,'Pranjal','Kadam','Assistent Librarian',35,65000),
(4,'Prachi','Pednekar','Librarian',28,37000),
(5,'Mukta','Birari','HOD',44,35000),
(5,'Sai','Kumar','Technical Head',24,65000),
(5,'Raj','Rajput','Assistent Librarian',35,72000),
(5,'Harmeet','Sharma','Librarian',55,64000),
(6,'Kavita','Pote','HOD',44,35000),
(6,'Parth','Kumar','Technical Head',25,65000),
(6,'Twisha','Rajput','Assistent Librarian',35,72000),
(6,'Yuvansh','Sharma','Librarian',54,64000);

select * from staff;

select distinct Role, count(Role)
from staff
group by Role;

select * from staff
where salary in(48000,28000,75000,35000);

select distinct salary from staff order by salary desc limit 5;

select distinct Role from staff;

select * from section s
right join staff sf ON (s.section_id = sf.section_id);

create table staff_mobile(
mob_id int PRIMARY KEY AUTO_INCREMENT,
staff_id int,
mobile_no varchar(20),
FOREIGN KEY(staff_id) REFERENCES staff(staff_id)
);

desc staff_mobile;

insert into staff_mobile(staff_id,mobile_no)
values(1,"9875469315"),
(2,"9878525846"),
(3,"9535658547"),
(1,"9535251545"),
(4,"9575963215"),
(3,"9346858525"),
(3,"2457183649"),
(5,"3657495214"),
(6,"9123568452"),
(7,"9878785462"),
(8,"9999358427"),
(9,"9137842658"),
(9,"9632587412"),
(10,"9512357486"),
(10,"9874123652"),
(11,"9632147852"),
(12,"2315478954"),
(13,"3594585554"),
(14,"4218754585"),
(15,"9668686868"),
(16,"9775849545"),
(17,"9331212545"),
(18,"9935699352"),
(19,"9354218754"),
(20,"9765428431"),
(21,"3365224155"),
(22,"3468751248"),
(23,"3654851265"),
(24,"5684972131"),
(23,"1212121221");

select * from staff_mobile;

select sc.section_id,sc.section_name,s.staff_id,s.staff_firstname,s.staff_lastname,s.Role,sm.mobile_no,s.salary from section sc
right join staff s ON (sc.section_id = s.section_id)
right join staff_mobile sm ON(s.staff_id = sm.staff_id)
order by staff_id;

select * from section sc
right join staff s ON (sc.section_id = s.section_id)
right join staff_mobile sm ON(s.staff_id = sm.staff_id);


create table books(
book_id int PRIMARY KEY AUTO_INCREMENT,
section_id int,
book_name varchar(100) NOT NULL,
author varchar(30),
Publisher varchar(50),
copies int,
FOREIGN KEY (section_id) REFERENCES section(section_id)
);

desc books;

insert into books(section_id,book_name,author,Publisher,copies)
values(1,'Mathematics for Game Programming and Computer Graphics','Penny De Byl','Packt Publishing',50),
(1,'Metamathematics: Foundations & Physicalization','Stephen Wolfram','Wolfram Media, Inc.',28),
(1,'Foundations of Applied Mathematics Illustrated Edition','Michael D. Greenburg','Dover Publications',120),
(1,'Principles and Techniques of Applied Mathematics','Bernard Friedman','Dover Publications',12),
(1,'Machine Learning: An Applied Mathematics Introduction','Paul Wilmott','Packt Publishing',42),
(2,'Everything You Need to Ace Science in One Big Fat Notebook','Michael Geisen','Workman Publishing',56),
(2,'Concepts of Physics (Part 1)','H.C. Verma','S. Chand & Company Ltd.',192),
(2,'Concepts of Physics (Part 2)','H.C. Verma','Bharti Bhavan',232),
(2,'Super Simple Biology: The Ultimate Bitesize Study Guide (DK Super Simple)','DK','DK Children',51),
(2,'The Biology Book: From the Origin of Life to Epigenetics, 250 Milestones in the History of Biology','Michael C. Gerald','Union Square & Co',19),
(3,'The Iliad & the Odyssey (Deluxe Hardbound Edition)','Homer','Fingerprint! Publishing',75),
(3,'To Kill a Mockingbird','Harper Lee','Harper Perennial',28),
(3,'The Greatest Short Stories of Leo Tolstoy','Leo Tolstoy','Fingerprint! Publishing',74),
(3,'A Death in East Berlin: A Cold War crime thriller ','Richard Wake','Kindle',99),
(3,'A Death in East Berlin: A Cold War crime thriller ','Anthony Doerr','Scribner',55),
(3,'Then She Was Gone','Lisa Jewell','Dreamscape Media LLC',134),
(3,'The Accidental President: Harry S. Truman and the Four Months That Changed the World','A. J. Baime','Mariner Books',232),
(3,'The Happiest Man on Earth: The Beautiful Life of an Auschwitz Survivor','Eddie Jaku','HarperAudio',174),
(4,'Would You Rather Book For Kids - 300+ Hilarious, Silly, and Challenging Questions','Stephen J. Ellis','HarperAudio',450),
(4,'The Spooky Wheels on the Bus: (A Holiday Wheels on the Bus Book)','J. Elizabeth Mills','Cartwheel Books',324),
(4,'Pete the Cat: Trick or Pete','James Dean','HarperFestival',250),
(4,'Teach Your Dragon Gratitude: A Story About Being Grateful (My Dragon Books)','Steve Herman','Scribner',124),
(4,'Teach Your Dragon To Follow Instructions: Help Your Dragon Follow Directions.','Steve Herman','Scribner',124),
(4,'What Should Danny Do? School Day','Adir Levy','Elon Books',74),
(5,'Knowledge Encyclopedia Human Body!','DK','DK Children',500),
(5,"Britannica's Encyclopedia Infographica: 1000 Facts & Figures",'Penny De Byl','Britannica Books',200),
(5,'Ciencia!','DK','DK Children',200),
(6,"The Body Keeps the Score: Brain","Bessel van der Kolk M.D. ","Scribner",170),
(6,"Read People Like a Book: How to Analyze, Understand","Penny De Byl","Packt Publishing",444),
(6,"Psychology: A Complete Introduction","Sandy Mann","Teach Yourself",6);


select * from books;



create table customer(
cust_id int PRIMARY KEY AUTO_INCREMENT,
staff_id int,
cust_name varchar(30),
book_id int check(book_id>30 and book_id<=60),
date_of_issue date,
address varchar(20),
FOREIGN KEY(staff_id) REFERENCES staff(staff_id),
FOREIGN KEY(book_id) REFERENCES books(book_id)
);

desc customer;

insert into customer(staff_id,cust_name,book_id,date_of_issue,address)
values(4,"Anshul Kumbhare",31,20231001,"Belapur"),
(7,"Kunal Pradhan",33,20231004,"Panvel"),
(5,"Manish Gupta",47,20231007,"Vashi"),
(6,"Dipanshu Verma",39,20230925,"Kurla"),
(10,"Christina Pareira",40,20231014,"Panvel"),
(5,"Satish Dhavan",47,20231007,"Vashi"),
(5,"Satish Dhavan",46,20230805,"Vashi"),
(7,"Karim Bhatt",33,20231004,"Andheri"),
(19,"Kunal Gaur",57,20231012,"Panvel"),
(22,"Punit Kale",60,20231006,"Kharghar"),
(7,"Abbas Shaikh",34,20230429,"Kharghar");

select * from customer;
select upper(concat(staff_firstname," ",staff_lastname)) from staff;

select length(concat(staff_firstname," ",staff_lastname)) from staff;


select * from customer 
where date_of_issue between 20230925 and 20231004;

select date_format(date_of_issue,"%W") from customer;

select datediff(curdate(),date_of_issue) from customer;

select * from staff
order by section_id;

select * from section;

select * from books;

select * from section 
cross join staff;

select b.book_id, b.book_name,b.author,c.cust_id,c.cust_name,c.date_of_issue, s.staff_id, concat(s.staff_firstname," ",staff_lastname) as fullname, s.Role from books b
right join customer c ON(b.book_id = c.book_id) 
left join staff s ON(c.staff_id = s.staff_id);

select * from staff
where salary = (select distinct salary from staff order by salary desc limit 2,1);