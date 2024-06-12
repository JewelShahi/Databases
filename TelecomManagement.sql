.header on
.mode box

CREATE TABLE Employees (
  employeeID CHAR(10) NOT NULL PRIMARY KEY,
  firstName VARCHAR(25) NOT NULL,
  lastName VARCHAR(25) NOT NULL,
  address VARCHAR(250) NOT NULL,
  email VARCHAR(40),
  phoneNumber CHAR(10) NOT NULL,
  department VARCHAR(45) NOT NULL,
  jobTitle VARCHAR(25) NOT NULL,
  hireDate DATE NOT NULL,
  salary DECIMAL(10, 2) NOT NULL
);
  
CREATE TABLE Customers (
  customerID CHAR(10) NOT NULL PRIMARY KEY,
  firstName VARCHAR(25) NOT NULL,
  lastName VARCHAR(25) NOT NULL,
  phoneNumber CHAR(10) NOT NULL,
  email VARCHAR(40),
  address VARCHAR(250) NOT NULL,
  planID INTEGER NOT NULL,
  FOREIGN KEY (planID) REFERENCES plans(planID)
);

--IMPORTANT WITH DATES
CREATE TABLE Plans (
  planID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  planName VARCHAR(20) NOT NULL,
  monthlyFee DECIMAL(10,2) NOT NULL,
  dataLimit INTEGER NOT NULL,
  callLimit INTEGER NOT NULL,
  startDate DATE NOT NULL,
  endDate DATE NOT NULL,
  smsLimit INTEGER NOT NULL
);

CREATE TABLE Services(
  serviceID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  serviceName VARCHAR(100) NOT NULL,
  customerID CHAR(10) NOT NULL,
  employeeID CHAR(10) NOT NULL,
  servicePrice DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (customerID) REFERENCES Customers(customerID),
  FOREIGN KEY (employeeID) REFERENCES Employees(employeeID)
);

CREATE TABLE Discounts (
  discountID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  discountName VARCHAR(50) NOT NULL,
  planID INTEGER NOT NULL,
  discountAmount DECIMAL(3,2) NOT NULL,
  -- startDate DATE,
  -- endDate DATE,
  FOREIGN KEY (planID) REFERENCES Plans(planID)
);

CREATE TABLE Calls (
  callID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  customerID CHAR(10) NOT NULL,
  callStart DATETIME NOT NULL,
  callEnd DATETIME NOT NULL,
  callDuration VARCHAR(10) Not null,
  sourceNumber CHAR(10) NOT NULL,
  destinationNumber CHAR(10) NOT NULL,
  FOREIGN KEY (customerID) REFERENCES Customers(customerID)
);

CREATE TABLE Payment (
  paymentID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  customerID CHAR(10) NOT NULL,
  employeeID CHAR(10),
  phoneNumber CHAR(10) NOT NULL,
  paymentDate DATE NOT NULL,
  paymentAmount DECIMAL(10,2) NOT NULL,
  paymentStatus VARCHAR(10) NOT NULL,
  paidFromID INTEGER DEFAULT 0,
  FOREIGN KEY(paidFromID)  REFERENCES BillPaymentType(paidFromID),
  FOREIGN KEY(customerID) REFERENCES Customers(customerID),
  FOREIGN KEY(phoneNumber) REFERENCES Customers(phoneNumber),
  FOREIGN KEY(employeeID) REFERENCES Employees(employeeID)
);

CREATE TABLE BillInvoice (
  invoiceID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  paymentID INTEGER NOT NULL,
  customerID CHAR(10) NOT NULL,
  employeeID CHAR(10) NOT NULL,
  phoneNumber CHAR(10) NOT NULL,
  billPeriodStart DATE NOT NULL,
  billPeriodEnd DATE NOT NULL,
  billAmount DECIMAL(10, 2) NOT NULL,
  invoiceDate DATE NOT NULL,
  paidFromID INTEGER NOT NULL,
  FOREIGN KEY(paymentID) REFERENCES Payment(paymentID),
  FOREIGN KEY(customerID) REFERENCES Customers(customerID),
  FOREIGN KEY(phoneNumber) REFERENCES Customers(phoneNumber),
  FOREIGN KEY(paidFromID)  REFERENCES BillPaymentType(paidFromID),
  FOREIGN KEY(employeeID) REFERENCES Employees(employeeID)
);

CREATE TABLE BillPaymentType(
  paidFromID INTEGER PRIMARY KEY AUTOINCREMENT,
  paymentType VARCHAR(30) NOT NULL
);

---------------------Inserting values in Employees table---------------
-------------------Продажби-------------------
INSERT INTO Employees (employeeID, firstName, lastName, address, email, phoneNumber, department, jobTitle, hireDate, salary) VALUES ('4575155585', 'Иван', 'Петров', 'бл.112 вх."А", ул."Орион", ж.к."Люлин 10", София 1346', 'ivanpetrov@telecom.bg', '0878576530', 'Продажби', 'Представител по продажби', '2014-03-18', 2100.00);

INSERT INTO Employees (employeeID, firstName, lastName, address, email, phoneNumber, department, jobTitle, hireDate, salary) VALUES ('3570719527', 'Калоян', 'Димитров', '45 ул."Йоан Екзарх", ж.к."Лозенец", София 1164', 'kdimitriv19@telecom.bg', '0881309418', 'Продажби', 'Представител по продажби', '2014-03-18', 2100.00);

INSERT INTO Employees (employeeID, firstName, lastName, address, email, phoneNumber, department, jobTitle, hireDate, salary) VALUES ('8266923718', 'Христо', 'Валериев', 'бл.280, ж.к."Люлин 2", София 1343', 'hrisVleriew20@telecom.bg', '0983637462', 'Продажби', 'Представител по продажби', '2016-05-25', 2100.00);

-------------------Маркетинг-------------------
INSERT INTO Employees (employeeID, firstName, lastName, address, email, phoneNumber, department, jobTitle, hireDate, salary) VALUES ('1892504144', 'Мария', 'Иванова', 'бл.20, ж.к."Бъкстоун", София 1618', 'maria.ivanova12@telecom.bg', '0873022792', 'Маркетинг', 'Мениджър по маркетинг', '2014-03-18', 2200.00);


INSERT INTO Employees (employeeID, firstName, lastName, address, email,
phoneNumber, department, jobTitle, hireDate, salary) VALUES ('7445160958', 'Нина', 'Челекелезова', 'бл.73, ж.к."Илинден", София 1373', 'ninacheklelezowa465@telecom.bg', '0888303120', 'Маркетинг', 'Мениджър по маркетинг', '2016-07-20', 2200.00);

-------------------Инженеринг-------------------
INSERT INTO Employees (employeeID, firstName, lastName, address, email, phoneNumber, department, jobTitle, hireDate, salary) VALUES ('3793950713', 'Димитър', 'Ангелов', 'бл.211, ж.к."Красна поляна", София 1330', 'dimoangelov72@telecom.bg', '0874432966', 'Инженеринг', 'Софтуерен инженер', '2014-03-18', 3000.00);

INSERT INTO Employees (employeeID, firstName, lastName, address, email, phoneNumber, department, jobTitle, hireDate, salary) VALUES ('2490381684', 'Георги', 'Георгиев', '14 ул."Хималайски проход", ж.к."Гоце Делчев", София 1404', 'geogeorgiev503@telecom.bg', '0870275646', 'Инженеринг', 'Софтуерен инженер', '2015-06-29', 3000.00);

-------------------Техник-------------------
INSERT INTO Employees (employeeID, firstName, lastName, address, email, phoneNumber, department, jobTitle, hireDate, salary) VALUES ('3794050713', 'Ангел', 'Валдиков', 'бл.242, ж.к."Обеля 2", София 1326', 'angelvladiokow468@telecom.bg', '0886474112', 'Техник', 'Техник', '2014-03-18', 3000.00);

INSERT INTO Employees (employeeID, firstName, lastName, address, email, phoneNumber, department, jobTitle, hireDate, salary) VALUES ('2690380674', 'Георги', 'Делиев', '33 бул."Христо Ботев", София 1000', 'georgideliw132503@telecom.bg', '0896332348', 'Техник', 'Техник', '2014-04-20', 2800.00);

INSERT INTO Employees (employeeID, firstName, lastName, address, email, phoneNumber, department, jobTitle, hireDate, salary) VALUES ('4694055713', 'Калоян', 'Башков', 'ул."Сокол 50", София 1137', 'kalatabashkow541@telecom.bg', '0940177667', 'Техник', 'Техник', '2015-01-25', 2800.00);

INSERT INTO Employees (employeeID, firstName, lastName, address, email, phoneNumber, department, jobTitle, hireDate, salary) VALUES ('3210481794', 'Християн', 'Лавров', 'бл. 206, ж.к."Дръжба", София 1584', 'hrislawrow120@telecom.bg', '0892099655', 'Техник', 'Техник', '2015-03-24', 2800.00);

-------------------Маркетинг-------------------
INSERT INTO Employees (employeeID, firstName, lastName, address, email,
phoneNumber, department, jobTitle, hireDate, salary) VALUES ('6695455527', 'Мина', 'Дикова', 'бл.603, ж.к."Младост 4", София 1715', 'mdikowa364@telecom.bg', '0899269545', 'Поддръжка', 'Технически специалист по поддръжка', '2014-04-12', 2000.00);

INSERT INTO Employees (employeeID, firstName, lastName, address, email, phoneNumber, department, jobTitle, hireDate, salary) VALUES ('4462446132', 'Лазар', 'Андонов', '425 бул."Европа булевард", кв."Република", София 1331', 'lazarandonow30@telecom.bg', '0876955760', 'Поддръжка', 'Технически специалист по поддръжка', '2017-9-29', 2000.00);

-------------------Касиер-------------------
INSERT INTO Employees (employeeID, firstName, lastName, address, email, phoneNumber, department, jobTitle, hireDate, salary) VALUES ('4489710568', 'Красимир', 'Цеков', '49 ул."Кюстендил", ж.к."Белите брези", София 1621', 'krasigekov@telecom.bg', '0884634857', 'Каса', 'Касиер', '2014-03-18', 2000.00);

INSERT INTO Employees (employeeID, firstName, lastName, address, email, phoneNumber, department, jobTitle, hireDate, salary) VALUES ('5593698257', 'Елена', 'Иванова', 'бл.467, ж.к."Младост 4", София 1715', 'elenaivanow465@telecom.bg', '0881360888', 'Каса', 'Касиерка', '2014-03-18', 2000.00);

INSERT INTO Employees (employeeID, firstName, lastName, address, email,
phoneNumber, department, jobTitle, hireDate, salary) VALUES ('9418399445', 'Борис', 'Славчев', 'бл.42, ж.к."Яворов", София 1124', 'b.slavchew@telecom.bg', '0889147195', 'Каса', 'Касиер', '2014-03-18', 2000.00);

INSERT INTO Employees (employeeID, firstName, lastName, address, email,
phoneNumber, department, jobTitle, hireDate, salary) VALUES ('5364970281', 'Мариана', 'Маркова', '15 "Живата вода", кв."Бояна", София 1616', 'm.markowa45@telecom.bg', '0842789163', 'Каса', 'Касиерка', '2014-05-23', 2000.00);

INSERT INTO Employees (employeeID, firstName, lastName, address, email,
phoneNumber, department, jobTitle, hireDate, salary) VALUES ('8942150376', 'Надя', 'Плочева', '2 "Стоян Попов", кв."Васил Левски", София 1517', 'nadqplochewa45@telecom.bg', '0960531824', 'Каса', 'Касиерка', '2014-05-30', 2000.00);

INSERT INTO Employees (employeeID, firstName, lastName, address, email,
phoneNumber, department, jobTitle, hireDate, salary) VALUES ('7596048321', 'Пламен', 'Божинов', '9 "Ръжда", София 1737', 'pl.bzhinow78@telecom.bg', '0898214730', 'Каса', 'Касиер', '2014-06-17', 2000.00);

-------------------Счетоводител-------------------
INSERT INTO Employees (employeeID, firstName, lastName, address, email, phoneNumber, department, jobTitle, hireDate, salary) VALUES ('3630176747', 'Тихомир', 'Костовски', '11 ул."Кипарис", София 1191', 'tishoKostowski69@telecom.bg', '0873001908', 'Финанси', 'Счетоводител', '2022-05-01', 2500.00);

INSERT INTO Employees (employeeID, firstName, lastName, address, email, phoneNumber, department, jobTitle, hireDate, salary) VALUES ('1325098396', 'Димитър', 'Делянов', '3 ул."Иван Радоев", кв."Витоша", София 1734', 'dimitardelqnow23@telecom.bg', '0879229453', 'Финанси', 'Счетоводител', '2018-05-11', 2500.00);

INSERT INTO Employees (employeeID, firstName, lastName, address, email, phoneNumber, department, jobTitle, hireDate, salary) VALUES ('2683293984', 'Петър', 'Плочев', '28 "Обелско шосе", кв."Модерно предградие", София 1360', 'petarplochew784@telecom.bg', '0897938452', 'Финанси', 'Счетоводител', '2019-03-05', 2500.00);

-------------------Хигиенист-------------------
INSERT INTO Employees (employeeID, firstName, lastName, address, email, phoneNumber, department, jobTitle, hireDate, salary) VALUES ('8556674974', 'Лора', 'Колева', '2А ул."Джерман", ж.к."Илиенци", София 1271', 'kolewalora456@telecom.bg', '0870433501', 'Хигиенист', 'Поддържа чистотата на офиса', '2014-04-25', 1900.00);

INSERT INTO Employees (employeeID, firstName, lastName, address, email, phoneNumber, department, jobTitle, hireDate, salary) VALUES ('8580488895', 'Стоян', 'Николов', '5 "Кумата", кв."Бояна", София 1616', 'stoyanNikolow345@telecom.bg', '0875333507', 'Хигиенист', 'Поддържа чистотата на офиса', '2015-10-16', 800.00);

INSERT INTO Employees (employeeID, firstName, lastName, address, email, phoneNumber, department, jobTitle, hireDate, salary) VALUES ('2774736499', 'Стефка', 'Бочева', '42 "Червена роза", ж.к. "Стрелбище", София 1408', 'ste.fkaBchewa@telecom.bg', '0886998454', 'Хигиенист', 'Поддържа чистотата на офиса', '2016-11-21', 1800.00);

---------------------Insert values in Customers table------------------
-------Ready-------
INSERT INTO Customers (customerID, firstName, lastName, phoneNumber, email, address, planID) VALUES ('5529227066', 'Иван', 'Илиев', '0888249163', 'ivanIliev235@gmail.com', 'бул."Васил Левски 1", София 1331', 1);

INSERT INTO Customers (customerID, firstName, lastName, phoneNumber, address, planID) VALUES ('4566413484', 'Петър', 'Кирилов', '0885789642', 'бл.13, ж.к."Изток", София 1113', 2);

INSERT INTO Customers (customerID, firstName, lastName, phoneNumber, email, address, planID) VALUES ('9653465484', 'Симеон', 'Иванов', '0887901234', 'simoIvanow455@gmail.com', '251 бул."Европа", ж.к."Дианабад", София 1331', 4);

INSERT INTO Customers (customerID, firstName, lastName, phoneNumber, email, address, planID) VALUES ('1550934795', 'Боян', 'Цветанов', '0894670328', 'boyocwetanow795@gmail.com', 'бл.914-Б, ж.к."Люлин 9", София 1324', 3);

INSERT INTO Customers (customerID, firstName, lastName, phoneNumber, email, address, planID) VALUES ('6049365445', 'Кристиян', 'Иванов', '0989876540', 'krisIvanov4575@gmail.com', '3667, 112, Монтана', 7);

INSERT INTO Customers (customerID, firstName, lastName, phoneNumber, email, address, planID) VALUES ('4891062565', 'Спас', 'Мирославов', '0987481293', 'spas.miroslawov974@gmail.com', 'бл.907, ж.к."Люлин 9", София 1324', 8);

INSERT INTO Customers (customerID, firstName, lastName, phoneNumber, address, planID) VALUES ('3274185107', 'Николай', 'Виденов', '0883758961', '112 ул."Гео Милев", ж.к."Христо Смирненски", София 1574', 4);

INSERT INTO Customers (customerID, firstName, lastName, phoneNumber, email, address, planID) VALUES ('8403472297', 'Любенa', 'Петровa', '0982503791', 'lybena.petrova325@abv.bg', 'бл.283Б, ж.к."Младост 2", София 1799', 3);

INSERT INTO Customers (customerID, firstName, lastName, phoneNumber, email, address, planID) VALUES ('7366225932', 'Симона', 'Кръстева', '0891807623', 'simona.Krusteva346@abv.bg', 'бл.28, ж.к."Левски Зона-Г", София 1836', 1);

INSERT INTO Customers (customerID, firstName, lastName, phoneNumber, email, address, planID) VALUES ('4350610263', 'Дамян', 'Калиманов', '0887654321', 'dm.kalimanov7964@yahoo.com', 'бл.432, ж.к."Люлин 4", София 1359', 2);

INSERT INTO Customers (customerID, firstName, lastName, phoneNumber, email, address, planID) VALUES ('3890195154', 'Владимир', 'Наков', '0889471208', 'taratorcho69@gmail.com', '17 "Света градина", ж.к."Лозенец", София 1421', 1);

INSERT INTO Customers (customerID, firstName, lastName, phoneNumber, email, address, planID) VALUES ('5654504133', 'Валентин', 'Дупинов', '0875190483', 'valkata.dupinov583@yahoo.com', 'бл.31, ж.к."Студенски град", София 1700', 5);

INSERT INTO Customers (customerID, firstName, lastName, phoneNumber, address, planID) VALUES ('9423038161', 'Асен', 'Симеонов', '0884512879', 'бл.1,  ж.к."Белите брези", София 1620', 8);

INSERT INTO Customers (customerID, firstName, lastName, phoneNumber, email, address, planID) VALUES ('4001892573', 'Кольо', 'Алабанов', '0878249310', 'kolyoAlabanow@yahoo.com', 'бл.107, ж.к."Суха река", София 1517', 2);

INSERT INTO Customers (customerID, firstName, lastName, phoneNumber, email, address, planID) VALUES ('7826763334', 'Андрей', 'Татев', '0882659718', 'andr.tatew765@abv.bg', '66 бул."П. Владигеров",  ж.к."Люлин", София 1620', 1);

INSERT INTO Customers (customerID, firstName, lastName, phoneNumber, email, address, planID) VALUES ('8262102956', 'Славко', 'Живков', '0897610582', 'slawko.Zivkov65@abv.bg', 'бл.7, ж.к."Лагера", София 1612', 5);

INSERT INTO Customers (customerID, firstName, lastName, phoneNumber, address, planID) VALUES ('8780357110','Краско', 'Красимиров', '0878309147', '81 бул."Партиарх Евтимий", ж.к."Иван Вазов", София 1463', 1);

INSERT INTO Customers (customerID, firstName, lastName, phoneNumber, email, address, planID) VALUES ('4900119545', 'Румен', 'Радев', '0887621859', 'prezidentanabg10@gmail.com', '28 "Алабин", София 1000', 6);

INSERT INTO Customers (customerID, firstName, lastName, phoneNumber, email, address, planID) VALUES ('5879906353', 'Стилян', 'Ясенов', '0874502789', 'stili.qsenow7326@gmail.com', '115 ул."Одрин", ж.к."Зона Б-5", София 1312', 7);

INSERT INTO Customers (customerID, firstName, lastName, phoneNumber, email, address, planID) VALUES ('7632103385', 'Жасмин', 'Димитрова', '0892561470', 'zasi.dimitrowa346@yahoo.com', 'бл.234, ж.к."Обеля 2", София 1326', 2);

INSERT INTO Customers (customerID, firstName, lastName, phoneNumber, email, address, planID) VALUES ('8090977198', 'Явор', 'Яворов', '0849357218', 'qvor.qvorow785@gmail.com', '8 ул."Хайдут Сидер", ж.к."Света Троица", София 1309', 4);

INSERT INTO Customers (customerID, firstName, lastName, phoneNumber, address, planID) VALUES ('6250159276', 'Лубомира', 'Маринова', '0872503619', 'бл.114, ж.к."Илинден", София 1309', 5);

INSERT INTO Customers (customerID, firstName, lastName, phoneNumber, address, planID) VALUES ('9038283433', 'Радослав', 'Радостинов', '0836981427', '1 ул."Гусла", ж.к."Овча купел", София 1618', 8);

INSERT INTO Customers (customerID, firstName, lastName, phoneNumber, email, address, planID) VALUES ('5282261171', 'Кристина', 'Кирилова', '0884173510', 'kirstikirilowa06@gmail.com', '7 бул."Овча купел", ж.к."Овча купел", София 1309', 7);

---------------------Insert values in Plans table-----------------------
--1
INSERT INTO Plans (planName, monthlyFee, dataLimit, callLimit, smsLimit, startDate, endDate)
VALUES ('Начален', 19.99, 100, 100, 100, '2022-01-01', '2023-12-01');

--2
INSERT INTO Plans (planName, monthlyFee, dataLimit, callLimit, smsLimit, startDate, endDate)
VALUES ('Продължителен', 29.99, 200, 200, 250, '2021-01-01', '2022-01-01');

--3
INSERT INTO Plans (planName, monthlyFee, dataLimit, callLimit, smsLimit, startDate, endDate)
VALUES ('Неограничен Интернет', 24.99, 5000, 200, 0, '2020-05-11', '2023-05-11');

--4
INSERT INTO Plans (planName, monthlyFee, dataLimit, callLimit, smsLimit, startDate, endDate)
VALUES ('Всичко включено', 109.99, 5000, 250, 200, '2020-12-05', '2025-12-06');

--5
INSERT INTO Plans (planName, monthlyFee, dataLimit, callLimit, smsLimit, startDate, endDate)
VALUES ('Безлимитно обаждане', 35.99, 300, 5000, 200, '2023-02-01', '2024-02-03');

--6
INSERT INTO Plans (planName, monthlyFee, dataLimit, callLimit, smsLimit, startDate, endDate)
VALUES ('Неограничен пакет', 69.99, 3000, 300, 200, '2021-05-14', '2022-05-14');

--7
INSERT INTO Plans (planName, monthlyFee, dataLimit, callLimit, smsLimit, startDate, endDate)
VALUES ('Неограничен Интернет + Обаждане', 129.99, 4500, 900, 900, '2027-01-01', '2028-01-01');

--8
INSERT INTO Plans (planName, monthlyFee, dataLimit, callLimit, smsLimit, startDate, endDate)
VALUES ('Пълен пакет', 199.99, 5000, 1000, 1000, '2021-10-10', '2022-10-10');

---------------------Insert values in Discount-----------------------
INSERT INTO Discounts (discountID, discountName, planID, discountAmount)
VALUES (0, 'No Discount', 5, 0.00);

INSERT INTO Discounts (discountName, planID, discountAmount)
VALUES ('10% OFF Early Bird Discount', 1, 0.10);

INSERT INTO Discounts (discountName, planID, discountAmount)
VALUES ('5% OFF Annual Plan Discount', 3, 0.05);

INSERT INTO Discounts (discountName, planID, discountAmount)
VALUES ('15% OFF Spring Sale Discount', 4, 0.15);

INSERT INTO Discounts (discountName, planID, discountAmount)
VALUES ('20% OFF Summer Promo Discount', 2, 0.20);

INSERT INTO Discounts (discountName, planID, discountAmount)
VALUES ('25% OFF Independence Day Discount', 7, 0.25);

INSERT INTO Discounts (discountName, planID, discountAmount)
VALUES ('5% OFF End of Year Discount', 6, 0.05);

INSERT INTO Discounts (discountName, planID, discountAmount)
VALUES ('10% OFF New Year Discount', 8, 0.1);

INSERT INTO Discounts (discountName, planID, discountAmount)
VALUES ('15% OFF Spring Promo Discount', 1, 0.15);

INSERT INTO Discounts (discountName, planID, discountAmount)
VALUES ('10% OFF Back to School Discount', 2, 0.10);

INSERT INTO Discounts (discountName, planID, discountAmount)
VALUES ('20% OFF Christmast Discount', 3, 0.20);

INSERT INTO Discounts (discountName, planID, discountAmount)
VALUES ('25% OFF Easter Discount', 4, 0.25);

INSERT INTO Discounts (discountName, planID, discountAmount)
VALUES ('40% OFF Senior Citizen Discount', 5, 0.40);

INSERT INTO Discounts (discountName, planID, discountAmount)
VALUES ('35% OFF Children Discount', 6, 0.35);

---------------------Insert values in Calls table-----------------------
INSERT INTO Calls (customerID, callStart, callEnd, callDuration, sourceNumber, destinationNumber)
VALUES ('7632103385', '2022-01-01 08:00:00', '2022-01-01 10:05:00', '5:00', '0892561470', '0849357218');

INSERT INTO Calls (customerID, callStart, callEnd, callDuration, sourceNumber, destinationNumber)
VALUES ('8090977198', '2022-01-01 09:00:00', '2022-01-01 11:06:00', '6:00', '0887654321', '0881234567');

INSERT INTO Calls (customerID, callStart, callEnd, callDuration, sourceNumber, destinationNumber)
VALUES ('5654504133', '2022-01-01 10:00:00', '2022-01-01 10:05:00', '5:00', '0875190483', '0884512879');

INSERT INTO Calls (customerID, callStart, callEnd, callDuration, sourceNumber, destinationNumber)
VALUES ('4001892573', '2022-01-01 11:00:00', '2022-01-01 11:06:00', '6:00', '0878249310', '0882659718');

INSERT INTO Calls (customerID, callStart, callEnd, callDuration, sourceNumber, destinationNumber)
VALUES ('8262102956', '2022-01-02 12:00:00', '2022-01-02 10:05:00', '5:00', '0897610582', '0882659718');

INSERT INTO Calls (customerID, callStart, callEnd, callDuration, sourceNumber, destinationNumber)
VALUES ('9038283433', '2022-01-02 01:00:00', '2022-01-02 11:06:00', '6:00', '0836981427', '0884173510');

INSERT INTO Calls (customerID, callStart, callEnd, callDuration, sourceNumber, destinationNumber)
VALUES ('4900119545', '2022-01-02 02:00:00', '2022-01-02 10:05:00', '5:00', '0887621859', '0874502789');

INSERT INTO Calls (customerID, callStart, callEnd, callDuration, sourceNumber, destinationNumber)
VALUES ('8780357110', '2022-01-02 03:00:00', '2022-02-02 11:06:00', '6:00', '0878309147', '0887621859');

INSERT INTO Calls (customerID, callStart, callEnd, callDuration, sourceNumber, destinationNumber)
VALUES ('7826763334', '2022-01-02 04:00:00', '2022-01-02 10:05:00', '5:00', '0882659718', '0875190483');

INSERT INTO Calls (customerID, callStart, callEnd, callDuration, sourceNumber, destinationNumber)
VALUES ('4001892573', '2022-01-02 05:00:00', '2022-02-02 11:06:00', '6:00', '0878249310', '0882659718');

---------------------Insert values in Payment table---------------------
INSERT INTO Payment (customerID, employeeID, phoneNumber, paymentDate, paymentAmount, paymentStatus, paidFromID) VALUES ('6049365445', null, '0989876540', '2022-01-15', 19.99, 'Неплатен', 0);

INSERT INTO Payment (customerID, employeeID, phoneNumber, paymentDate, paymentAmount, paymentStatus, paidFromID) VALUES ('4350610263', '5593698257', '0887654321', '2022-02-15', 24.99, 'Платен', 1);

INSERT INTO Payment (customerID, employeeID, phoneNumber, paymentDate, paymentAmount, paymentStatus, paidFromID) VALUES ('7826763334', '9418399445', '0882659718', '2022-03-13', 19.99, 'Платен', 1);

INSERT INTO Payment (customerID, employeeID, phoneNumber, paymentDate, paymentAmount, paymentStatus, paidFromID) VALUES ('9038283433', '7596048321', '0836981427', '2022-03-15', 199.99, 'Платен', 3);

INSERT INTO Payment (customerID, employeeID, phoneNumber, paymentDate, paymentAmount, paymentStatus, paidFromID) VALUES ('5282261171', null, '0884173510', '2022-03-17', 129.99, 'Неплатен', 0);

INSERT INTO Payment (customerID, employeeID, phoneNumber, paymentDate, paymentAmount, paymentStatus, paidFromID) VALUES ('5879906353', '8942150376', '0874502789', '2022-03-17', 129.99, 'Платен', 3);

INSERT INTO Payment (customerID, employeeID, phoneNumber, paymentDate, paymentAmount, paymentStatus, paidFromID) VALUES ('8090977198', '5364970281', '0849357218', '2022-03-18', 109.99, 'Платен', 3);
--8
INSERT INTO Payment (customerID, employeeID, phoneNumber, paymentDate, paymentAmount, paymentStatus, paidFromID) VALUES ('7826763334', '5593698257', '0882659718', '2022-03-18', 19.99, 'Платен', 1);--1

INSERT INTO Payment (customerID, employeeID, phoneNumber, paymentDate, paymentAmount, paymentStatus, paidFromID) VALUES ('8780357110', '0878309147', '8942150376', '2022-03-18', 19.99, 'Платен', 1);--1

INSERT INTO Payment (customerID, employeeID, phoneNumber, paymentDate, paymentAmount, paymentStatus, paidFromID) VALUES ('7632103385', '0892561470', '7596048321', '2022-03-18', 29.99, 'Платен', 1);--2

---
INSERT INTO Payment (customerID, employeeID, phoneNumber, paymentDate, paymentAmount, paymentStatus, paidFromID) VALUES ('4001892573', '0878249310', '8942150376', '2022-03-18', 29.99, 'Платен', 1);--1
--12
INSERT INTO Payment (customerID, employeeID, phoneNumber, paymentDate, paymentAmount, paymentStatus, paidFromID) VALUES ('3890195154', '0892561470', '9418399445', '2022-03-18', 19.99, 'Платен', 1);--2
---------------------Insert values in BillInvoice table-----------------
INSERT INTO BillInvoice (paymentID, customerID, employeeID, phoneNumber, billPeriodStart, billPeriodEnd, billAmount, invoiceDate, paidFromID)
VALUES (2, '4350610263', '5593698257', '0887654321', '2022-01-13', '2022-02-13', 24.99, '2022-02-15', 1);

INSERT INTO BillInvoice (paymentID, customerID, employeeID, phoneNumber, billPeriodStart, billPeriodEnd, billAmount, invoiceDate, paidFromID)
VALUES (3, '7826763334', '9418399445', '0882659718', '2022-02-15', '2022-03-15', 19.99, '2022-03-13', 1);

INSERT INTO BillInvoice (paymentID, customerID, employeeID, phoneNumber, billPeriodStart, billPeriodEnd, billAmount, invoiceDate, paidFromID)
VALUES (4, '9038283433', '7596048321', '0836981427', '2022-02-10', '2022-03-09', 199.99, '2022-03-15', 3);

INSERT INTO BillInvoice (paymentID, customerID, employeeID, phoneNumber, billPeriodStart, billPeriodEnd, billAmount, invoiceDate, paidFromID)
VALUES (6, '5879906353', '8942150376', '0874502789', '2022-02-15', '2022-03-16', 129.99, '2022-03-17', 3);

INSERT INTO BillInvoice (paymentID, customerID, employeeID, phoneNumber, billPeriodStart, billPeriodEnd, billAmount, invoiceDate, paidFromID)
VALUES (7, '8090977198', '5364970281', '0849357218', '2022-02-16', '2022-03-15', 109.99, '2022-03-18', 3);

INSERT INTO BillInvoice (paymentID, customerID, employeeID, phoneNumber, billPeriodStart, billPeriodEnd, billAmount, invoiceDate, paidFromID)
VALUES (8, '7826763334', '5593698257', '0882659718', '2022-02-16', '2022-03-15', 19.99, '2022-03-18', 1);

INSERT INTO BillInvoice (paymentID, customerID, employeeID, phoneNumber, billPeriodStart, billPeriodEnd, billAmount, invoiceDate, paidFromID)
VALUES (9, '8780357110', '8942150376', '0878309147', '2022-02-16', '2022-03-15', 19.99, '2022-03-18', 1);

INSERT INTO BillInvoice (paymentID, customerID, employeeID, phoneNumber, billPeriodStart, billPeriodEnd, billAmount, invoiceDate, paidFromID)
VALUES (10, '7632103385', '5593698257', '0882659718', '2022-02-16', '2022-03-15', 19.99, '2022-03-18', 1);

INSERT INTO BillInvoice (paymentID, customerID, employeeID, phoneNumber, billPeriodStart, billPeriodEnd, billAmount, invoiceDate, paidFromID)
VALUES (11, '7826763334', '7596048321', '0892561470', '2022-02-16', '2022-03-15', 29.99, '2022-03-18', 1);

INSERT INTO BillInvoice (paymentID, customerID, employeeID, phoneNumber, billPeriodStart, billPeriodEnd, billAmount, invoiceDate, paidFromID)
VALUES (12, '4001892573', '8942150376', '0878249310', '2022-02-16', '2022-03-15', 29.99, '2022-03-18', 1);

--------------------------------------------------------------------------

---------------------Insert values in BillPaymentType table-----------------
INSERT INTO BillPaymentType(paidFromID, paymentType) VALUES (0, 'Не е платено');
INSERT INTO BillPaymentType(paymentType) VALUES ('На касата, в кеш');
INSERT INTO BillPaymentType(paymentType) VALUES ('Онлайн, с карта');
INSERT INTO BillPaymentType(paymentType) VALUES ('На каса, с карта');
INSERT INTO BillPaymentType(paymentType) VALUES ('В EasyPay');
--------------------------------------------------------------------------

---------------------Insert values in Services table-----------------
INSERT INTO Services (serviceName, customerID, employeeID, servicePrice) VALUES ('Широколентов интернет', '4900119545', '2690380674', 59.99);

INSERT INTO Services (serviceName, customerID, employeeID, servicePrice) VALUES ('Домашни телефонни услуги', '7632103385', '3794050713', 19.99);

INSERT INTO Services (serviceName, customerID, employeeID, servicePrice) VALUES ('Кабелна телевизия', '7632103385', '3210481794', 69.99);

INSERT INTO Services (serviceName, customerID, employeeID, servicePrice) VALUES ('План за мобилни данни', '4900119545', '2690380674', 29.99);

INSERT INTO Services (serviceName, customerID, employeeID, servicePrice) VALUES ('Международно обаждане', '5879906353', '3794050713', 49.99);

INSERT INTO Services (serviceName, customerID, employeeID, servicePrice) VALUES ('VoIP Обслужване', '4900119545', '3210481794', 24.99);

INSERT INTO Services (serviceName, customerID, employeeID, servicePrice) VALUES ('Съхранение в облака', '4900119545', '2690380674', 9.99);

INSERT INTO Services (serviceName, customerID, employeeID, servicePrice) VALUES ('Интелигентна домашна автоматизация', '5879906353', '3794050713', 99.99);

-- INSERT INTO Services (serviceName, customerID, employeeID, servicePrice) VALUES ('Система за сигурност', '5282261171', '3210481794', 79.99);

INSERT INTO Services (serviceName, customerID, employeeID, servicePrice) VALUES ('Бизнес мрежови решения', '4900119545', '3210481794', 149.99);
--------------------------------------------------------------------------

-------------------------- SELECT ---------------------
-- select 'Employees';
-- select * from Employees;
-- select 'Customers';
-- select * from Customers;
-- select 'Plans';
-- select * from Plans;
-- select 'Discounts';
-- select * from Discounts;
-- select 'Calls';
-- select * from Calls;
-- select 'Payment';
-- select * from Payment;
-- select 'BillPaymentType';
-- select * from BillPaymentType;
-- select 'BillInvoice';
-- select * from BillInvoice;
-- select 'Services';
-- select * from Services;


------------------------------------------------------------------------
-- 1st SELECT REQUEST (Селективна заявка с условие)
SELECT 'Printing all emails with null value from table "Customers"' ;
SELECT * FROM customers 
WHERE email IS NULL;
------------------------------------------------------------------------

--------------------------------------------------------------------------
-- 2nd SELECT REQUEST (Селективна заявка от две таблици)
SELECT 'Printing customers information using phone number';
SELECT c.customerID, c.phoneNumber, p.planName, c.planID, pay.paymentStatus FROM Customers c
JOIN Plans p ON c.planID = p.planID
JOIN Payment pay ON c.customerID = pay.customerID
WHERE c.phoneNumber LIKE '0874502789';
---------------------------------------------------------------------

---------------------------------------------------------------------
-- 3rd SELECT REQUEST (Заявка с агретана функция COUNT)
SELECT 'Printing the count of customers from table "Services" using their ID';
SELECT (c.firstName||' '||c.lastName) AS fullName, c.customerID, c.phoneNumber, COUNT(s.customerID) AS customerServiceCount
FROM Services s
JOIN Customers c ON c.customerID = s.customerID
WHERE s.customerID LIKE '4900119545';
--------------------------------------------------------------------------

---------------------------------------------------------------------
-- 4th SELECT REQUEST (Заявка, изисляваща разлика между две дати)
SELECT planName, endDate, CAST(JULIANDAY(endDate) - JULIANDAY('now') AS INTEGER) AS daysLeft
FROM Plans
WHERE (DATE('now') BETWEEN DATE(startDate) AND DATE(endDate)) AND (endDate >= DATE('now'));
---------------------------------------------------------------------

------------------------------------------------------------------------
-- 5th SELECT REQUEST (Заявка за актуализация (промяна стойност на колона или добавяне на нова колона))
-- Before update
SELECT 'Printing and updating all plans for customers with -10% price for using some amount of time';
SELECT (c.firstName||' '||c.lastName) AS fullName, c.customerID, c.phoneNumber, c.address, c.email, p.planID, p.planName, p.monthlyFee FROM Customers c
JOIN Plans p ON c.planID = p.planID
WHERE julianday('now') - julianday(p.startDate) > 30 * 30.44;

-- Updating the database
UPDATE Plans SET monthlyFee = ROUND(monthlyFee * 0.9, 2)
WHERE planID IN (
  SELECT c.planID
  FROM Customers c
  JOIN Plans p ON c.planID = p.planID
  WHERE julianday('now') - julianday(p.startDate) > 30 * 30.44
);

-- After update
-- SELECT 'After Update Printing and updating all plans for customers with -10% price for using some amount of time';
SELECT (c.firstName||' '||c.lastName) AS fullName, c.customerID, c.phoneNumber, c.address, c.email, p.planID, p.planName, p.monthlyFee
FROM Customers c
JOIN Plans p ON c.planID = p.planID
WHERE julianday('now') - julianday(p.startDate) > 30 * 30.44; -- 30*30.44 - converts 30Months to days to compare in WHERE clause
---------------------------------------------------------------------
