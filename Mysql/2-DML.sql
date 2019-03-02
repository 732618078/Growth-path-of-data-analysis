USE my_test;
SHOW TABLES;

-- 查询表中的所有数据
SELECT * FROM students;

-- 插入操作
DESC students;
INSERT INTO students(id, name, age, email, score)
	VALUES(2, 'ls', 18, 'abc@163.com', NULL);
SELECT * FROM students\G;  #分条展示数据
INSERT INTO students(id, name, age, email, score)
	VALUES(3, 'wc', 2, 'qq@163.com', 20),
	(4, 'lili', 20, 'lili@163.com', 90);
SELECT * FROM students;

-- 更新操作
SELECT * FROM students;
UPDATE students SET score=90;
SELECT * FROM students;
UPDATE students SET score=60 WHERE name='zs';
SELECT * FROM students;
UPDATE students SET age=30, score=70 WHERE name='ls';
SELECT * FROM students;
UPDATE students SET age=age+1 WHERE name='wc' 
#修改数据库密码
exit;
mysql -u root -p
password
USE mysql;
SHOW TABLES;
UPDATE user SET authentication_string=password(newpassword)
	WHERE user='root' AND Host='localhost';
FLUSH PRIVILEGES;
QUIT;
mysql -u root -p
newpassword
exit;
mysqladmin -u root -p password newpassword
password
mysql -u root -p
newpassword

-- 删除操作
USE my_test;
SHOW TABLES;
SELECT * FROM students;
DELETE FROM students WHERE name='ww';
SELECT * FROM students;
#表结构还在,可以找回
DELETE FROM students;
#表结构不在创建新的表,不可以找回,执行速度快
TRUNCATE TABLE students;
