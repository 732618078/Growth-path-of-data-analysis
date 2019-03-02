SELECT COUNT(*) FROM emp;

SELECT * FROM emp WHERE id=101;
#用来查看索引是否正在被使用，并且输出其使用的索引的信息。
EXPLAIN SELECT * FROM emp WHERE id=101\G;  


-- 创建索引
CREATE INDEX 索引名称 ON TABLE(COLUMN[,COLUMN]...);
CREATE INDEX salary_index ON emp(salary);

-- 删除索引
DROP INDEX 索引名称 ON 表名;

-- 查看索引
SHOW INDEX FROM 表名;

-- 自动创建索引
#在表上定义了主键时， 会自动创建一个对应的唯一索引
#在表上定义了一个外键时，会自动创建一个普通索引


#创建索引:
#主键自动建立唯一索引
#频繁作为查询条件的字段应该创建索引
#查询中与其他表关联的字段，外键关系建立索引
#频繁更新的字段不适合建立索引，因为每次更新不单单是更新了记录还会更新索引
#WHERE条件里用不到的字段不创建索引
#查询中排序的字段，排序的字段若通过索引去访问将大大提高排序速度
#查询中统计或者分组字段

#不创建索引
#表记录太少
#经常增删改的表
#如果某个数据列包含许多重复的内容，为它建立索引就没有太大的实际效果