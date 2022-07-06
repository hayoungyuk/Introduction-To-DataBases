create database covid19_vaccination_record_security_ver3; 
USE covid19_vaccination_record_security_ver3;

create table vaccine(
	vaccine_id varchar(100) not null primary key,
	name varchar(100) not null unique,
	origin varchar(100) not null
);

create table medical_center(
	center_id varchar(100) not null primary key,
	name varchar(100) not null unique,
	city varchar(100) not null,
	details varchar(100) not null,
	full_address varchar(200) not null
);

create table healthcare_professional(
	professional_id integer not null primary key,
	center_id varchar(100) not null,
	name varchar(100) not null,
	surname varchar(100) not null,
	FOREIGN KEY(center_id) REFERENCES medical_center(center_id) ON UPDATE CASCADE ON DELETE CASCADE
);

create table person(
	person_id varchar(100) not null primary key,
	name varchar(100) not null,
	surname varchar(100) not null,
	gender varchar(100) not null,
	age integer not null,
	hes_code varchar(100) not null unique,
	city varchar(100) not null,
	details varchar(100) not null,
	full_address varchar(200) not null
);

create table hes(
	hes_id varchar(100) not null primary key,
	person_id varchar(100) not null,
	phone_number varchar(100) not null unique,
	hes_code varchar(100) not null unique,
	vaccination_info varchar(100) not null,
	state_of_health varchar(100) not null,
	FOREIGN KEY(person_id) REFERENCES person(person_id) ON UPDATE CASCADE ON DELETE CASCADE
);

create table vaccination_record(
	record_id varchar(100) not null primary key,
	person_id varchar(100) not null,
	vaccine_id varchar(100) not null,
	professional_id integer not null,
	vaccination_date date not null,
	FOREIGN KEY(person_id) REFERENCES person(person_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(vaccine_id) REFERENCES vaccine(vaccine_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(professional_id) REFERENCES healthcare_professional(professional_id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT into vaccine values
("1", "화이자", "Pfizer"),
("2", "모더나", "ModernaTX"),
("3", "얀센", "J&J"),
("4", "아스트라제네카", "AstraZeneca"),
("5", "노바백스", "novavex"),
("6", "시노팜", "Sinopharm"),
("7", "가멜레야", "gamaleya"),
("8", "칸시노", "cansino"),
("9", "존슨앤존슨", "johnson&johnson"),
("10", "백터 인스티튜트", "vector Institute");

select * from vaccine;

INSERT into medical_center VALUES
('ABC123', '서울성모병원', '서울', '대학병원','서울 서초구 반포동'),
('DEF432', '강남세브란스병원', '서울', '대학병원','서울 강남구 도곡동'),
('QWE321', '삼성서울병원', '서울', '대학병원','서울 강남구 일원동'),
('POI871', '강북삼성병원', '서울', '대학병원','서울 종로구 평동'),
('CBS765', '이대목동병원', '서울', '대학병원','서울 양천구 목동'),
('LDH459', '분당서울대학교병원', '경기', '대학병원','경기 성남시 분당구'),
('LKJ781', '김민규내과', '경기', '개인병원', '경기 과천시 별양동'),
('RKB871', '좋은내과의원', '경기', '개인병원','경기 과천시 별양동'),
('CBG351', '두리이비인후과의원', '경기', '개인병원', '경기 성남시 분당구'),
('VNM000', '처음처럼내과의원', '경기', '개인병원', '경기 수원시 영통구');

select * from medical_center;

INSERT into healthcare_professional VALUES
(100 , 'ABC123', '성모', '김'),
(200 , 'DEF432', '연세', '박'),
(300 , 'QWE321', '재용', '유'),
(400 , 'POI871', '삼성', '이'),
(500 , 'CBS765', '이화', '최'),
(600 , 'CBS765', '이화', '김'),
(700, 'LDH459', '분당', '심'),
(800 , 'LKJ781', '민규', '김'),
(900 , 'RKB871', '조은', '박'),
(1000 , 'CBG351', '처음', '윤');

select * from healthcare_professional;

INSERT into person VALUES
('010112','서현', '김', '여', 23, 'A1B2-1287', '경기 성남시', '성인', '경기 성남시 분당구'),
('950628','재현', '김', '남', 27, 'B2C3-2320', '경기 과천시', '성인', '경기 과천시 별양동'),
('920506','아라', '김', '여', 31, 'C3D4-3454', '서울 강남구', '성인', '서울 강남구 도곡동'),
('910503','태연', '김', '여', 32, 'D4E5-4512', '서울 목동', '성인', '서울 양천구 목동'),
('000507','규리', '박', '여', 23, 'E5F6-5689', '경기 수원시', '성인', '경기 수원시 영통구'),
('960713','혜리', '이', '여', 27, 'F6G7-6789', '서울 종로구', '성인', '서울 종로구 평동'),
('950101','민규', '이', '남', 28, 'G7H8-7890', '서울 강남구', '성인', '서울 강남구 일원동'),
('931218','철수', '박', '남', 30, 'H8I9-8901', '서울 서초구', '성인', '서울 서초구 반포동'),
('000505','경수', '이', '남', 23, 'I9J0-9012', '경기 성남시', '성인', '경기 성남시 분당구'),
('931020','지현', '한', '여', 30, 'J0K1-0123', '경기 과천시', '성인', '경기 과천시 별양동');

select * from person;

INSERT into hes VALUES
('111', '010112', '010-0000-1111','A1B2-1287', '접종완료', '미확진자'),
('222', '950628', '010-1111-2222','B2C3-2320', '접종완료', '미확진자'),
('333', '920506', '010-2222-3333','C3D4-3454', '미접종', '확진자'),
('444', '910503', '010-3333-4444','D4E5-4512', '접종완료', '확진자'),
('555', '000507', '010-4444-5555','E5F6-5689', '미접종', '미확진자'),
('666', '960713', '010-5555-6666','F6G7-6789', '접종완료', '미확진자'),
('777', '950101', '010-6666-7777','G7H8-7890', '미접종', '확진자'),
('888', '931218', '010-7777-8888','H8I9-8901', '미접종', '미확진자'),
('999', '000505', '010-8888-9999','I9J0-9012', '접종완료', '확진자'),
('aaa', '931020', '010-9999-0000','J0K1-0123', '접종완료', '확진자');

select * from hes;

INSERT into vaccination_record VALUES
('0814aaa','010112', "1", 1000, '2021-08-14'),
('0719aaa','950628', "1", 800, '2021-07-19'),
('0621bbb','910503', "2", 500, '2021-06-21'),
('1111bbb','960713', "2", 400, '2021-11-11'),
('1223aaa','000505', "1", 700, '2021-12-23'),
('0523ccc','931020', "3", 900, '2021-05-23');

select * from vaccination_record;

/*QUERIES*/

/*1*/
select count(*) as '백신 종류의 총 개수'
from vaccine;

/*2*/
select *
from medical_center
where details Like '대학%';

/*3*/
select hes_code, vaccination_info, state_of_health
from hes
WHERE person_id IN(SELECT person_id FROM hes WHERE state_of_health='확진자');

/*4*/
SELECT person_id, vaccination_date 
FROM vaccination_record 
WHERE person_id IN(SELECT person_id 
					FROM person 
					WHERE city LIKE '%과천%');

/*5*/
SELECT surname, name FROM person 
WHERE person_id IN (SELECT person_id FROM vaccination_record WHERE vaccination_date > '2021-01-01') 
				AND (surname like '김%' OR surname like '박%');

/*6*/
SELECT * FROM healthcare_professional 
WHERE professional_id IN(SELECT professional_id FROM vaccination_record 
					WHERE person_id IN(SELECT person_id FROM person WHERE age > 20) 
                    AND vaccine_id IN(SELECT vaccine_id FROM vaccine WHERE name='화이자')) 
ORDER BY professional_id;

/*7*/
SELECT vaccine_id, COUNT(*) as number_of_vaccinated_people 
FROM vaccination_record 
GROUP BY vaccine_id 
ORDER BY vaccine_id ASC;

/*8*/
SELECT * FROM person 
WHERE person_id IN(SELECT person_id FROM vaccination_record WHERE vaccine_id 
				IN(SELECT vaccine_id FROM vaccine WHERE name='화이자') 
                AND professional_id 
                IN(SELECT professional_id FROM healthcare_professional 
                WHERE center_id 
                IN(SELECT center_id FROM medical_center 
                WHERE name LIKE '%분당%')))
ORDER BY age;

/*9*/
SELECT name FROM vaccine 
WHERE vaccine_id IN(SELECT vaccine_id FROM vaccination_record 
WHERE person_id IN(SELECT person_id FROM person 
				WHERE name='재현' AND surname='김'));
                
/*10*/
SELECT city, COUNT(*) AS '구/시도별 확진자 수' FROM person
WHERE person_id IN(SELECT person_id FROM hes WHERE state_of_health='확진자')
GROUP BY city;