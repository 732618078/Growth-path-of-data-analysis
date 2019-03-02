-- 字符串函数
#将传入的字符连接成一个字符串,任何字符串与null进行连接结果都是null
SELECT CONCAT('aaa', 'bbb');
SELECT CONCAT('aaa', 'bbb', NULL);

#将字符串str从x位置开始，y个字符长的子串替换为指定的字符
SELECT INSERT('abcdefg', 2, 3, '**');

#LOWER(Str)和UPPER(str),将字符串转成小写或大写

#分别返回字符串最左边的x个字符和最右边的x个字符
#如果第二个参数为null，那么不返回任何字符
SELECT LEFT('shanghai', 3);
SELECT RIGHT('shanghai', 3);

#用字符串pad对str最左边或最右边进行填充，直接到长度为n个字符长度
SELECT LPAD('my', 5, 123456);
SELECT RPAD('my', 6, 123456);

#LTRIM(str)和RTRIM(str),去掉字符串当中最左侧和最右侧的空格
#TRIM(str),去掉字符串左右的空格

#返回str重复x次的结果
SELECT REPEAD('123', 4);

#用字符串b替换字符串str中所有出现的字符串a.
SELECT REPALCE('myxq', 'x', 'q');

#返回字符串str中第x位置起y个字符长度的字符
SELECT SUBSTR('myxq', 2, 3);

-- 数值函数

#ABS(x),返回X的绝对值

#小数不为零部分上取整，即向上取最近的整数
SELECT CEIL(2.3);
#小数部分下取整，即向下取最近的整数
SELECT FLOOR(2.3);

#返回X/Y的模
SELECT MOD(9, 2);

#返回0-1内容的随机值
SELECT RAND();

-- 日期和时间函数

#CURDATE(),返回当前日期，只包含年月日

#CURTIME(),返回当前时间，只包含时分秒

#返回当前日期和时间，年月日时分秒都包含
SELECT NOW();

#返回当前日期的时间戳
SELECT UNIX_TIMESTAMP();

#将一个时间戳转换成日期
SELECT FROM_UNIXTIME(1521540507);

#WEEK(DATE),返回当前是一年中的第几周

#YEAR(DATE),返回所给日期是那一年

#HOUR(TIME),返回当前时间的小时

#MINUTE(TIME),返回当前时间的分钟

#DATE_FORMAT(date,fmt),按字符串格式化日期date值

#计算日期间隔
SELECT DATE_ADD(NOW(), INTERVAL 3 DAY);

#计算两个日期相差的天数
SELECT DATEDIFF('2018-02-05', NOW());

-- 流程函数

#如果value是真，返回t,否则返回f
SELECT IF((SELECT salary FROM emp 
	WHERE ename='李白')>5000, '经理', '员工');

#IFNULL(value1,value2),如果value1不为空，返回value1否者返回value2

#CASE WHEN THEN END
SELECT CASE WHEN 2>3 THEN '对' ELSE '错';

-- 其他常用函数

#DATABASE(),返回当前数据库名

#返回当前数据库版本
SELECT VERSION();

#返回当前登陆用户名
SELECT USER();

#PASSWORD(STR),对str进行加密

#MD5(),返回str的MD5值