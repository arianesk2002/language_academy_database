CREATE SCHEMA IF NOT EXISTS `academy` ;

USE academy;

CREATE TABLE IF NOT EXISTS student(
	sno INT NOT NULL,
    s_name VARCHAR (100) NOT NULL, 
    s_level CHAR (2),
    phone VARCHAR (11),
    address VARCHAR (1000),
    brth_date DATE,
    PRIMARY KEY (sno)
    );

CREATE TABLE IF NOT EXISTS teacher(
	tno INT NOT NULL,
    t_name VARCHAR (100) NOT NULL, 
    salary INT,
    phone VARCHAR (11),
    address VARCHAR (1000),
    insurance INT,
    PRIMARY KEY (tno)
    );

CREATE TABLE IF NOT EXISTS term(
	term_id INT NOT NULL,
    year_t INT,
    season VARCHAR(15),
    PRIMARY KEY (term_id)
    );
CREATE TABLE IF NOT EXISTS course_name (
    cno INT NOT NULL,
    c_name VARCHAR(30),
    PRIMARY KEY (cno)
);
CREATE TABLE IF NOT EXISTS course (
    cno INT NOT NULL,
    tno INT NOT NULL,
    term_id INT NOT NULL,
    c_level VARCHAR(2),
    age_category VARCHAR(25),
    PRIMARY KEY (cno ,tno , term_id),
    FOREIGN KEY (cno)
        REFERENCES course_name (cno)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (tno)
        REFERENCES teacher (tno)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (term_id)
        REFERENCES term (term_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS products(
	pno INT NOT NULL,
    title VARCHAR (100) NOT NULL, 
    price INT,
    inventory_status INT,
    PRIMARY KEY (pno)
    );
    
CREATE TABLE IF NOT EXISTS employees(
	eno INT NOT NULL,
    e_name VARCHAR (100) NOT NULL, 
    e_role VARCHAR (100) NOT NULL,
    salary INT,
    phone VARCHAR (11),
    address VARCHAR (1000),
    insurance INT,
    PRIMARY KEY (eno)
    );
    
CREATE TABLE IF NOT EXISTS records (
    sno INT NOT NULL,
    tno INT NOT NULL,
    cno INT NOT NULL,
    term_id INT NOT NULL,
    score INT,
    PRIMARY KEY (sno ,tno , cno , term_id),
    FOREIGN KEY (sno)
        REFERENCES student (sno)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	FOREIGN KEY (cno)
        REFERENCES course_name (cno)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (tno)
        REFERENCES teacher (tno)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (term_id)
        REFERENCES term (term_id)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS finacial_department (
    sno INT NOT NULL,
    tno INT NOT NULL,
    cno INT NOT NULL,
    term_id INT NOT NULL,
    debt INT,
    PRIMARY KEY (sno ,tno , cno , term_id),
    FOREIGN KEY (sno)
        REFERENCES student (sno)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	FOREIGN KEY (cno)
        REFERENCES course_name (cno)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (tno)
        REFERENCES teacher (tno)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (term_id)
        REFERENCES term (term_id)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS course_dec (
    tno INT NOT NULL,
    cno INT NOT NULL,
    term_id INT NOT NULL,
    location VARCHAR(100),
    c_price INT,
    exam_time TIME,
    exame_date DATE,
    c_time TIME,
    capacity INT,
    holding_days VARCHAR(100),
    PRIMARY KEY (tno , cno , term_id),
	FOREIGN KEY (cno)
        REFERENCES course_name (cno)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (tno)
        REFERENCES teacher (tno)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (term_id)
        REFERENCES term (term_id)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

INSERT INTO student(sno, s_name, s_level, phone, address, brth_date) VALUES
(2147483647, 'Burton92', 'A1', '917-7778', '3476 Old Front Lane, Penobscot Bldg, Annapolis, Maryland, 76341', '1986-11-20'),
(1043616991, 'Andrade718', 'B2', '344-0103', '624 Rose Hill Ct, Standard Bldg, Charleston, WV, 64580', '2007-09-03'),
(1492208290, 'Stacy1964', 'C1', '955-9925', '66 West Town Blvd, Victor Executive Building, Denver, Colorado, 74757', '1970-04-04'),
(1258365357, 'Ziegler1974', 'B1', '266-1209', '1091 Chapel Hill Lane, Penobscot Bldg, Montgomery, Alabama, 46515', '1987-09-25'),
(1043616992, 'Abbie966', 'A2', '708-0459', '3367 Deepwood Court, 8th Floor, Charleston, West Virginia, 25267', '1973-02-19'),
(2023285533, 'Ardis759', 'A2', '626-0992', '1996 SE Cedar Tree Blvd, Little Rock, Arkansas, 24716', '2023-04-27'),
(1808537172, 'Alita8', 'A1', '441-2548', '2017 Rock Hill Drive, Victor Executive Building, Harrisburg, Pennsylvania, 80288', '2011-05-23'),
(24643226, 'Dung261', 'A1', '164-3865', '3156 Bayview Street, 257 Towers Building, Nashville, Tennessee, 30561', '1970-01-08'),
(2023285534, 'Aleta1974', 'C2', '091-5671', '3140 Cedar Tree Highway, Providence, Rhode Island, 12060', '1970-01-09'),
(857111673, 'Adan1', 'B2', '881-2251', '274 New Rushwood Hwy, Suite 24, Jefferson City, MO, 11599', '1995-04-28');

INSERT INTO teacher(tno, t_name, salary, phone, address, insurance) VALUES
(102016135, 'Abreu2022', 40687, '868-9304', '237 Edgewood Court, Madison, Wisconsin, 54493', 3),
(1142753913, 'Cathey1980', 100578, '126-2653', '2352 Sharp Hill Ct, Judge Building, Augusta, Maine, 78895', -2090539160),
(928005548, 'Aleta1980', 67411, '171-4493', '608 Town Ave, Calyon Bldg, Salem, Oregon, 09662', -1298511159),
(2147483647, 'Melba2', 72782, '874-7011', '1941 East Riverview Ln, Nashville, Tennessee, 07929', -730023638),
(1740134269, 'Vanessa1985', 74945, '241-1969', '3084 Bayview Street, 3rd Floor, Sacramento, California, 49564', -598152306),
(1679646004, 'Wolf35', 76757, '480-1469', '567 E Woodcock Avenue, Sacramento, California, 90452', -497829609),
(316764501, 'Gala2015', 72557, '636-8895', '31 W Town St, Victor Executive Bldg, Providence, Rhode Island, 30494', -1272245938),
(1954882631, 'Buster45', 110713, '645-2382', '3457 North Beachwood Ave, Suite 6481, Harrisburg, Pennsylvania, 97502', 56),
(102016136, 'Aiko86', 80405, '511-2464', '1102 Riverview Highway, Boston, MA, 41081', 84),
(1464897639, 'Abel614', 76079, '916-2883', '867 SW Beachwood Ln, Comcast Bldg, Concord, NH, 69430', -1979878984),
(316764502, 'Alayna2019', 26150, '115-0071', '406 Woodfort Blvd, Lincoln, NE, 92904', NULL),
(1679646005, 'Kidd798', 70788, '678-2803', '1159 Burwood Cir, STE 99, Madison, Wisconsin, 72167', 627),
(102016137, 'Gilliam1978', 96643, '072-1576', '132 Prospect Hill Hwy, Salem, OR, 69173', -353753083),
(1142753914, 'Adam2004', 72384, '228-2262', '3831 New Meadowview Avenue, Richmond, VA, 03111', NULL),
(928005549, 'Allan7', 103599, '546-8436', '1712 East Sharp Hill Way, 3rd Floor, Santa Fe, New Mexico, 06403', -1171149210),
(1464897640, 'Chadwick1985', 40974, '117-0463', '3949 Chapel Hill Parkway, MidAmerican Building, Atlanta, GA, 60847', -281018203),
(1679646006, 'Ronna2017', 119090, '827-0635', '216 West Mountain Road, Suite 5, Juneau, AK, 61262', -1162466197),
(1142753915, 'Abernathy67', 40528, '549-6191', '816 Ironwood Way, Enquirer Bldg, Lansing, Michigan, 89684', 1055),
(928005550, 'Delma524', NULL, NULL, NULL, -1120074977),
(1142753916, 'Abbott438', NULL, NULL, NULL, -410296410);

INSERT INTO term(term_id, year_t, season) VALUES
(1, 2008, 'Fall'),
(2, 2020, 'Summer'),
(3, 2027, 'Spring'),
(4, 2012, 'Spring'),
(5, 2026, 'Fall'),
(6, 2017, 'Summer'),
(7, 2011, 'Fall');


INSERT INTO course_name(cno, c_name) VALUES
(21483647, 'Norris377'),
(48985187, 'Roxane2028'),
(70443553, 'Sauls1979'),
(186551764, 'Craig2020'),
(48968518, 'Racheal2025'),
(208061126, 'Abraham123'),
(142307456, 'Abraham1995');

INSERT INTO course(tno, cno, term_id, c_level, age_category) VALUES
(928005550, 21483647, 1, 'A1', 'bozorgsal'),
(1679646005, 48985187, 2, 'A1', 'koodak'),
(316764501, 70443553, 3, 'A2', 'nojavan'),
(928005549, 186551764, 1,'C1', 'bozorgsal'),
(1464897639, 48968518, 2, 'B1', 'bozorgsal'),
(1954882631, 208061126,2, 'A1', 'nojavan'),
(928005548, 142307456, 3, 'A1', 'koodak');


INSERT INTO course_dec(tno, cno, term_id, location, c_price, exam_time, exame_date, c_time, capacity, holding_days) VALUES
(928005550, 21483647, 1, 'Class B', 147, '02:38:30', '2011-01-25', '07:39:01', 50, 'Sat'),
(1679646005, 48985187, 2, 'Class C', 158, '02:38:30', NULL, '11:03:13', 45, 'Fri'),
(316764501, 70443553, 3, 'Class B', 608, '20:17:57', '1992-08-20', '10:11:58', 50, 'Fri'),
(928005549, 186551764, 1, 'Class A', 402, '01:19:23', '1983-01-15', '11:41:35', 60, 'Sun'),
(1464897639, 48968518, 2, 'Class F', 1873, '03:08:04', '1991-07-31', '10:18:31', 0, 'Thu'),
(1954882631, 208061126, 2, 'Class D', 158, NULL, NULL, '04:08:13', 2, 'Sat'),
(928005548, 142307456, 3, 'Class B', 1295, '15:26:32', '1981-01-26', '05:47:19', 80, 'Sun');


INSERT INTO employees(eno, e_name, e_role, salary, phone, address, insurance) VALUES
(81735176, 'Ligon568', 'a', 32051, '968-7333', '221 Market Ct, Appartment 819, Atlanta, GA, 04518', -391015816),
(124600218, 'Goetz1965', 'a', NULL, NULL, NULL, -616262821),
(157875955, 'Lonna33', 'b', 57922, '131-5771', '2049 Beachwood Pkwy, Diamond Building, Dover, Delaware, 68284', -4122),
(247483647, 'Florentina2022', 'b', 92448, '458-1159', '3083 North Bayview Court, Plaza Bldg, Phoenix, AZ, 54013', NULL),
(213492498, 'Overton2023', 'b', 81831, '381-1336', '1802 Mount St, Austin, TX, 63029', 6717),
(60646811, 'Alonso823', 'b', 43290, '518-5038', '1740 Hunting Hill Way, MidAmerican Building, Springfield, Illinois, 98434', -1845662322),
(87395177, 'Blake1987', 'c', 27349, '589-8954', '3313 White Cedar Tree Drive, Equitable Building, Tallahassee, FL, 62620', -358640399),
(102851853, 'Eugenie1979', 'c', 95657, '094-6232', '2081 Pine Tree Highway, Madison, Wisconsin, 46172', -1879078749);


INSERT INTO finacial_department(sno, tno, cno, term_id, debt) VALUES
(2147483647, 928005550, 21483647, 1, -1568941220),
(1043616991, 1679646005, 48985187, 2, 8197),
(1492208290, 316764501, 70443553, 3, NULL),
(1258365357, 928005549, 186551764, 1, -911948206),
(1043616992, 1464897639, 48968518, 2, -897662328),
(2023285533, 1954882631, 208061126, 2, -377981638),
(1808537172, 928005548, 142307456, 3, -248229729);


INSERT INTO products(pno, title, price, inventory_status) VALUES
(2147483647, 'Accusamus amet sint molestias non.', 1963, 29),
(565742035, 'Ad ut necessitatibus eaque unde dolor.', 569, 28),
(1414011830, 'Ut perspiciatis voluptatem laboriosam.', 1007, 30),
(780490401, 'Rerum rem quas.', 108, 20),
(67280100, 'Molestiae qui et laudantium laborum.', 1721, 1),
(282028466, 'Laborum eos itaque atque.', 1113, 2),
(565742036, 'Ea vitae beatae qui.', 416, 2),
(1720634702, 'Est commodi quis dolores error.', 894, 3),
(1935383064, 'Voluptatem eos et quas dolor iusto.', 246, 5);

INSERT INTO records(cno, tno, term_id, sno, score) VALUES
(21483647, 928005550, 1, 2147483647, 20),
(48985187, 1679646005, 2, 1043616991, 9),
(70443553, 316764501, 3, 1492208290, 19),
(186551764, 928005549, 1, 1258365357, 5),
(48968518, 1464897639, 2, 2023285534, 15),
(208061126, 1954882631, 2, 1808537172, 6),
(142307456, 928005548, 3, 1492208290, 17);
