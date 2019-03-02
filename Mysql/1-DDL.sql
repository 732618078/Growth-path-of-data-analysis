mysql -u root -p
password

-- 创建数据库
CREATE DATABASE my_test CHARACTER SET UTF8;
SHOW DATABASES;
USE my_test;

-- 创建表
CREATE TABLE students(
	id INT,
	name VARCHAR(25),
	age INT,
	email VARCHAR(255));
SHOW TABLES;
DESC students;   #查看表的结构

-- 添加一列
ALTER TABLE students ADD score INT;
DESC students;

-- 修改一个表的字段类型
ALTER TABLE students MODIFY id BIGINT;
DESC students;

-- 删除一列
ALTER TABLE students ADD nums VARCHAR(10);
DESC students;
ALTER TABLE students DROP nums;
DESC students;

-- 修改表名
CREATE TABLE emplyee(
	id INT,
	name VARCHAR(50));
SHOW TABLES;
RENAME TABLE emplyee TO employee;
SHOW TABLES;

-- 查看创表细节
SHOW CREATE TABLE students;
SHOW CREATE TABLE employee;

-- 修改表的字符集
ALTER TABLE employee CHARACTER SET GBK;
SHOW CREATE TABLE employee;

-- 修改表的列名
ALTER TABLE employee CHANGE name newname VARCHAR(20);
DESC employee;

-- 删除表
DROP TABLE employee; 