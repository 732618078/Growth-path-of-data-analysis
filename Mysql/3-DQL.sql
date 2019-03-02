mysql -u root -p
password

SHOW DATABASES;
USE my_test;

-- 查询所有信息
SELECT * FROM students;

-- 查询指定列的数据
SELECT name, age FROM students;

-- 条件查询
ALTER TABLE students ADD gender VARCHAR(2);
...
SELECT * FROM students WHERE gender='男' AND age=20;
SELECT * FROM students WHERE id=1001 OR name='zs';
SELECT * FROM students WHERE id=1001 OR id=1002 OR id=1003;
SELECT * FROM students WHERE id IN (1001, 1002, 1003);
SELECT * FROM students WHERE name IS NULL;
SELECT * FROM students WHERE name IS NOT NULL;
SELECT * FROM students WHERE gender!='男';
SELECT * FROM students WHERE age>=18 AND age<=20;
SELECT * FROM students WHERE age BETWEEN 18 AND 20;

-- 模糊查询
SELECT * FROM students WHERE name LIKE '_____';
SELECT * FROM students WHERE name LIKE '____s';
SELECT * FROM students WHERE name LIKE 'm%';
SELECT * FROM students WHERE name LIKE '_u%';
SELECT * FROM students WHERE name LIKE '%s%';

-- 字段控制查询
SELECT DISTINCT name FROM students;
SELECT *, age+score FROM students;
SELECT *, IFNULL(age, 0)+IFNULL(score, 0) FROM students;
SELECT *, IFNULL(age, 0)+IFNULL(score, 0) AS total FROM students;
SELECT name AS resName FROM students;

-- 排序
CREATE TABLE employee(
	id INT(11) NOT NULL,
	name VARCHAR(50) DEFAULT NULL,
	gender VARCHAR(1) DEFAULT NULL,
	hire_date DATE DEFAULT NULL,
	salary DECIMAL(10, 0) DEFAULT NULL,
	performance DOUBLE(255, 0) DEFAULT NULL,
	manage DOUBLE(255) DEFAULT NULL,
	department VARCHAR(255) DEFAULT NULL)
	ENGINE=InnoDB DEFAULT CHARSET=UTF8;

INSERT INTO employee VALUES(1001, '张三', '男', '1991-7-25', 2000, 200, 500, '营销部');
INSERT INTO employee VALUES(1002, '李四', '男', '2017-7-5', 4000, 500, NULL, '营销部');
INSERT INTO employee VALUES(1003, '王五', '女', '2018-5-1', 6000, 100, 5000, '研发部');
INSERT INTO employee VALUES(1004, '赵六', '男', '1991-6-1', 1000, 3000, 4000, '财务部');
INSERT INTO employee VALUES(1005, '孙七', '女', '2018-3-23', 8000, 1000, NULL, '研发部');
INSERT INTO employee VALUES(1006, '周八', '男', '2010-9-8', 5000, 500, 1000, '人事部');
INSERT INTO employee VALUES(1007, '吴九', '女', '2017-7-5', 8000, 601, NULL, '研发部');
INSERT INTO employee VALUES(1008, '郑十', '女', '2014-4-6', 4000, 1801, NULL, '人事部');

SELECT * FROM employee ORDER BY salary;
SELECT * FROM employee ORDER BY salary ASC;
SELECT * FROM employee ORDER BY salary DESC;
SELECT * FROM employee ORDER BY salary DESC, id DESC;


-- 聚合函数
SELECT COUNT(*) FROM employee;
SELECT COUNT(performance) FROM employee;
SELECT COUNT(*) FROM employee WHERE salary>2500;
SELECT COUNT(*) FROM employee
	WHERE (IFNULL(salary, 0)+IFNULL(performance, 0))>5000;
SELECT COUNT(performance), COUNT(manage) FROM employee;

SELECT SUM(salary) FROM employee;
SELECT SUM(salary), SUM(performance) FROM employee;
SELECT SUM(IFNULL(salary, 0)+IFNULL(performance, 0)) FROM employee;
SELECT AVG(salary) FROM employee;

SALECT MAX(salary), MIN(salary) FROM employee;

-- 分组查询
SELECT department, GROUP_CONCAT(name) FROM employee 
	GROUP BY department;
SELECT gender, GROUP_CONCAT(name) FROM employee GROUP BY gender;
SELECT name, gender FROM employee GROUP BY gender, name;
SELECT department, GROUP_CONCAT(salary), AVG(salary) FROM employee
	GROUP BY department;

SELECT department, GROUP_CONCAT(salary), SUM(salary) FROM employee
	GROUP BY department;
SELECT department, GROUP_CONCAT(name), COUNT(*) FROM employee 
	GROUP BY department;
SELECT department, GROUP_CONCAT(salary), COUNT(*) FROM employee 
	WHERE salary>1500 GROUP BY department;

SELECT department, GROUP_CONCAT(salary), SUM(salary) FROM employee 
	GROUP BY department
	HAVING SUM(salary)>9000;
SELECT department, GROUP_CONCAT(salary), SUM(salary) FROM employee
	WHERE salary>2000 
	GROUP BY department 
	HAVING SUM(salary)>9000;

-- LIMIT
SELECT * FROM employee LIMIT 0, 3;
SELECT * FROM employee LIMIT 3, 3;

#分页
int curPage = 1  #当前页
int pageSize = 3  #每页多少条数据
SELECT * FROM employee LIMIT (curpage-1)*pageSize, pageSize;