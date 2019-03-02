-- 实体完整性
#主键约束
CREATE TABLE person(
	id BIGINT PRIMARY KEY,
	name VARCHAR(50));

CREATE TABLE person(
	id BIGINT,
	name VARCHAR(50),
	age INT,
	PRIMARY KEY(id));

CREATE TABLE student(
	id BIGINT,
	snum BIGINT,
	name VARCHAR(50),
	PRIMARY KEY(id, snum));

CREATE TABLE student(
	sid INT,
	name VARCHAR(50));
ALTER TABLE student ADD CONSTRAINT PRIMARY KEY(sid);

#唯一约束
CREATE TABLE student(
	id INT PRIMARY KEY,
	name VARCHAR(50) UNIQUE);

#自动增长列
CREATE TABLE student(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(20) UNIQUE);

-- 域完整性
CREATE TABLE stu(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(20) UNIQUE NOT NULL,
	gender CHAR(1) DEFAULT '男');

-- 参照完整性
CREATE TABLE stu(
	id INT PRIMARY KEY,
	name VARCHAR(50),
	age INT);
CREATE TABLE score(
	sid INT,
	score INT
	CONSTRAINT sc_st_fk FOREIGN KEY(sid) REFERENCES stu(id));

CREATE TABLE stu(
	id INT PRIMARY KEY,
	name VARCHAR(50),
	age INT);
CREATE TABLE score(
	sid INT,
	score INT);
ALTER TABLE score
	ADD CONSTRAINT sc_st_fk FOREIGN KEY(sid) REFERENCES stu(id);
