-- 创建用户
CREATE USER '用户名'@'localhost' IDENTIFIED BY '密码';

-- 删除用户
DROP 用户名;

-- 分配权限
GRANT 权限(columns) ON 数据库对象 TO 用户 
	IDENTIFIED BY '密码' WITH GRANT OPTION;

#超级管理员权限
GRANT ALL PRIVILEGES ON *.* TO 用户
	IDENTIFIED BY '密码' WITH GRANT OPTION;
FLUSH PRIVILEGES;

-- 创建对指定数据库的所有权限
GRANT ALL PRIVILEGES ON 数据库名.*TO 用户
	IDENTIFIED BY '密码' WITH GRANT OPTION;
FLUSH PRIVILEGES;

#创建一个gxq用户只能对stu表进行CRUD操作
GRANT INSERT, UPDATE, SELECT, DELETE ON my_test.stu TO privuser@localhost
	IDENTIFIED BY '1234';
FLUSH PRIVILEGES;

-- 查看权限
SHOW GRANTS;

#查看指定用户权限
SHOW GRANTS FOR root@localhost;

-- 删除权限
REMOVE 权限 ON 数据库对象 FROM 用户;