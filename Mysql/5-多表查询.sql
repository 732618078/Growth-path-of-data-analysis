-- 表之间关系
#一对多关系
CREATE TABLE person(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50),
	age INT,
	sex CHAR(1));
CREATE TABLE car(
	id INT PRIMARY KEY,
	name VARCHAR(50),
	color VARCHAR(25),
	pid INT,
	CONSTRAINT c_p_fk FOREIGN KEY(pid) REFERENCES person(id));

#多对多关系
CREATE TABLE teacher(
	tid INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50),
	age INT,
	gender CHAR(1) DEFAULT '男');
CREATE TABLE student(
	sid INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	age INT,
	gender CHAR(1) DEFAULT '男');
CREATE TABLE tea_stu_rel(
	tid INT,
	sid INT);
ALTER TABLE tea_stu_rel ADD CONSTRAINT fk_tid FOREIGN KEY(tid) 
	REFERENCES teacher(tid);
ALTER TABLE tea_stu_rel ADD CONSTRAINT fk_sid FOREIGN KEY(sid)
	REFERENCES student(sid);

-- 多表查询
#合并结果集
CREATE TABLE a(name VARCHAR(10), score INT);
CREATE TABLE a(name VARCHAR(10), score INT);
INSERT INTO b VALUES('a', 10), ('b', 20), ('c', 30);
INSERT INTO b VALUES('a', 10), ('b', 20), ('d', 40);
SELECT * FROM a UNION SELECT * FROM b;  #去重
SELECT * FROM a UNION ALL SELECT * FROM b;  #不去重

#连接查询
SELECT * FROM stu, tech;  #出现笛卡尔积
SELECT * FROM stu, score WHERE stu.id=score.sid;
SELECT * FROM stu st, score sc WHERE st.id=sc.sid;  #99查询
SELECT * FROM stu st INNER JOIN score sc ON st.id=sc.sid;  #内连接
SELECT * FROM stu st JOIN score sc ON st.id=sc.sid;
SELECT * FROM stu st JOIN score sc ON st.id=sc.sid
	WHERE sc.score>60;
SELECT st.id, st.name, sc.score FROM stu st
	JOIN score sc ON st.id=sc.sid WHERE sc.score>60;
SELECT st.id, st.name, sc.score FROM stu st
	JOIN score sc ON st.id=sc.sid 
	WHERE sc.score>60 AND st.gender='男';

SELECT * FROM stu st 
	LEFT OUTER JOIN score sc ON st.id=sc.sid;  #左表全查出,右表查满足条件
SELECT * FROM stu st
	RIGHT JOIN score sc ON st.id=sc.sid;

CREATE TABLE course(cid INT PRIMARY KEY, name VARCHAR(50));
SELECT st.name, sc.score c.name FROM stu st, score sc, course c
	WHERE st.id=sc.sid AND sc.cid=c.cid;
SELECT st.name, sc.score, c.name FROM stu st 
	JOIN score sc ON st.id=sc.sid 
	JOIN course c ON sc.cid=c.cid;


CREATE TABLE emp(
	empno INT(11) NOT NULL,
  	ename VARCHAR(255) DEFAULT NULL,
	job VARCHAR(255) DEFAULT NULL,
  	mgr VARCHAR(255) DEFAULT NULL,
  	hiredate DATE DEFAULT NULL,
  	salary DECIMAL(10,0) DEFAULT NULL,
  	comm DOUBLE DEFAULT NULL,
  	deptno INT(11) DEFAULT NULL,
  	PRIMARY KEY(empno)) 
	ENGINE=InnoDB DEFAULT CHARSET=UTF8;
CREATE TABLE dept(
  	deptno BIGINT(2) NOT NULL AUTO_INCREMENT 
  	COMMENT '表示部门编号，由两位数字所组成',
  	dname VARCHAR(14) DEFAULT NULL 
  	COMMENT '部门名称，最多由14个字符所组成',
  	local VARCHAR(13) DEFAULT NULL 
  	COMMENT '部门所在的位置',
  	PRIMARY KEY(deptno)) 
	ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=UTF8;
CREATE TABLE salgrade(
  	grade BIGINT(11) NOT NULL AUTO_INCREMENT 
  	COMMENT '工资等级',
  	lowSalary BIGINT(11) DEFAULT NULL 
  	COMMENT '此等级的最低工资',
  	highSalary INT(11) DEFAULT NULL 
  	COMMENT '此等级的最高工资',
  	PRIMARY KEY(grade)) 
	ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=UTF8;

INSERT INTO emp VALUES(7369, '孙悟空', '职员', '7902', '2010-12-17', 800, NULL, 20);
INSERT INTO emp VALUES(7499, '孙尚香', '销售人员', '7698', '2011-2-20', 1600, 300, 30);
INSERT INTO emp VALUES(7521, '李白', '销售人员', '7698', '2011-2-22', 1250, 500, 30);
INSERT INTO emp VALUES(7566, '程咬金', '经理', '7839', '2011-4-2', 2975, NULL, 20);
INSERT INTO emp VALUES(7654, '妲己', '销售人员', '7698', '2011-9-28', 1250, 1400, 30);
INSERT INTO emp VALUES(7698, '兰陵王', '经理', '7839', '2011-5-1', 2854, NULL, 30);
INSERT INTO emp VALUES(7782, '虞姬', '经理', '7839', '2011-6-9', 2450, NULL, 10);
INSERT INTO emp VALUES(7788, '项羽', '检查员', '7566', '2017-4-19', 3000, NULL, 20);
INSERT INTO emp VALUES(7839, '张飞', '总裁', NULL, '2010-6-12', 5000, NULL, 10);
INSERT INTO emp VALUES(7844, '蔡文姬', '销售人员', '7698', '2011-9-8', 1500, 0, 30);
INSERT INTO emp VALUES(7876, '阿珂', '职员', '7788', '2017-5-23', 1100, NULL, 20);
INSERT INTO emp VALUES(7900, '刘备', '职员', '7698', '2011-12-3', 950, NULL, 30);
INSERT INTO emp VALUES(7902, '诸葛亮', '检查员', '7566', '2011-12-3', 3000, NULL, 20);
INSERT INTO emp VALUES(7934, '鲁班', '职员', '7782', '2012-1-23', 1300, NULL, 10);

INSERT INTO dept VALUES(10, '财务部', '北京');
INSERT INTO dept VALUES(20, '调研部', '上海');
INSERT INTO dept VALUES(30, '销售部', '王者峡谷');
INSERT INTO dept VALUES(40, '运营部', '腾讯大楼');

INSERT INTO salgrade VALUES(1, 700, 1200);
INSERT INTO salgrade VALUES(2, 1201, 1400);
INSERT INTO salgrade VALUES(3, 1401, 2000);
INSERT INTO salgrade VALUES(4, 2001, 3000);
INSERT INTO salgrade VALUES(5, 3001, 9999);

SELECT e.ename, e.salary, d.dname, g.grade FROM emp e, dept d, salgrade g
	WHERE e.deptno=d.deptno
	AND e.salary>=g.lowSalary AND e.salary<=g.highSalary;
SELECT e.ename, e.salary, d.dname, g.grade FROM emp e, dept d, salgrade g
	WHERE e.deptno=d.deptno
	AND e.salary BETWEEN g.lowSalary AND g.highSalary;
SELECT e.ename, e.salary, d.dname g.grade FROM emp e 
	JOIN dept d ON e.deptno=d.deptno
	JOIN salgrade g ON e.salary BETWEEN g.lowSalary AND g.highSalsry;

CREATE TABLE stu(id INT, name VARCHAR(20));
CREATE TABLE score(sid INT, score INT);

SELECT * FROM stu, score WHERE stu.id=score.sid;
SELECT * FROM stu JOIN score ON stu.id=score.sid;

SELECT * FROM stu NATURAL JOIN score;  #列名相同时去重

SELECT * FROM stu st, score sc, course s
	WHERE st.id=sc.sid AND sc.cid=c.cid;