mysql -u root -p
password
SHOW DATABASES;
USE my_test;

-- 创建存储过程
DELIMITER $$
CREATE PROCEDURE show_emp()
BEGIN
SELECT * FROM emp;
END$$
DELIMITER ;

-- 使用存储过程
CALL show_emp();

-- 查看存储过程
#查看所有存储过程
SHOW PROCEDURE STATUS;
#查看指定数据库中的存储过程
SHOW PROCEDURE STATUS WHERE db='my_test';
#查看指定存储过程源代码
SHOW CREATE PROCEDURE 存储过程名;

-- 删除存储过程
DROP PROCEDURE show_emp;

-- 存储过程变量
#声明变量,分配变量值
DELIMITER $$
CREATE PROCEDURE test()
BEGIN
DECLARE res VARCHAR(255) DEFAULT '';
DECLARE x, y INT DEFAULT 0;
SET x=3;
SET y=4;
DECLARE avgRes DOUBLE DEFAULT 0;
SELECT avg(salary) INTO avgRes FROM emp;
END$$
DELIMITER;

-- 存储过程参数
DELEIMITER $$
CREATE PROCEDURE getName(IN name VARCHAR(255))
BEGIN
SELECT * FROM emp WHERE ename=name;
END$$
DELIMITER;

CALL getName('鲁班');


DELIMITER$$
CREATE PROCEDURE getSalary(IN n VARCHAR(255), OUT salary INT)
BEGIN
SELECT salary INTO FROM emp WHERE ename=n;
END$$
DELIMITER;

CALL getSalary(('鲁班', @s))
SELECT @s FROM DUAL;


DELIMITER$$
CREATE PROCEDURE test(INOUT num INT, IN inc INT)
BEGIN
SELECT num=num+inc,
END$$
DELIMITER;

SET @num1 = 20;
CALL test(@num1, 10);
SELECT @num1;


-- 自定义函数
#随机生成一个指定个数的字符串
DELIMITER$$
CREATE function rand_str(n INT) RETURNS VARCHAR(255)
BEGIN
DECLARE str VARCHAR(100) 
	DEFAULT 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
DECLARE i INT DEFAULT 0;
DECLARE res_str VARCHAR(255) DEFAULT '';
WHILE i<n DO 
SET res_str = CONCAT(res_str, SUBSTR(str, FLOOR(1+RAND()*52), 1));
SET i = i+1;
END WHILE;
RETURN res_str;
END$$ 
DELIMITER;

SELECT rand_str(4);



CREATE TABLE emp(id INT, name VARCHAR(50), age INT);

DELIMITER$$
CREATE PROCEDURE insert_emp(IN startNum INT, IN max_num INT)
BEGIN
DECLARE i INT DEFAULT 0;
SET AUTOCOMMIT = 0;  #不让自动提交sql
REPEAT
SET i = i+1;
INSERT INTO emp VALUES(startNum+i, rand_str(5), FLOOR(10+RAND()*30));
UNTIL i = max_num
END REPEAT;
COMMIT;  #整体提高所有sql,提高效率
END$$
DELIMITER;

CALL inset_emp(10, 10000000);