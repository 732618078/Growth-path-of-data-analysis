-- 创建视图
CREATE VIEW emp_salary_view 
	AS (SELECT * FROM emp WHERE salary>2000);
SELECT * FROM emp_salary_view WHERE job='经理';

CREATE VIEW emp_mgr_view
	AS (SELECT * FROM emp WHERE job='经理');

-- 修改视图
CREATE OR REPLACE VIEW emp_salary_view
	AS (SELECT * FROM emp);

-- 删除视图
DROP VIEW emp_salary_view;

#只要视图当中的数据不直接来源于基表就不能修改