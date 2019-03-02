
#把select查询的结果当做另一个select的条件值
SELECT ename, deptno FROM emp 
	WHERE deptnp=(SELECT deptno FROM emp WHERE ename='项羽');

#把查询出的结果当做一个新表
SELECT ename, salary FROM 
	(SELECT ename, salary, deptno FROM emp WHERE deptno=30) s
	WHERE s.salary>2000;

SELECT ename, salary FROM emp 
	WHERE salary>(SELECT salary FROM emp WHERE ename='程咬金') ;

SELECT ename, salary FROM emp
	WHERE salary>(SELECT MAX(salary) FROM emp WHERE deptno=30);

SELECT * FROM emp 
	WHERE (job, salary) 
	in (SELECT job, salary FROM emp WHERE ename='妲己');
SELECT * FROM emp e, (SELECT job, salary FROM emp WHERE ename='妲己') r
	e.job=r.job AND e.salary=r.salary;


SELECT * FROM emp
	WHERE empno in (SELECT mgr, GROUP_CONCAT(mgr), COUNT(mgr) FROM emp 
	GROUP BY mgr HAVING COUNT(mgr)>=2);

SELECT e.ename, e.salary, d.dname, d.local FROM emp e, dept d 
	WHERE e.deptno=d.deptno AND e.empno=7788;

SELECT e1.empno, e1.ename, e2.empno, e2.ename FROM emp e1, emp e2 
	WHERE e1.mgr=e2.empno
	AND e1.empno=7369;
