#创建employ表
CREATE TABLE if not EXISTS employ(
id INT NOT NULL,
num VARCHAR(10) NOT NULL,
`name` VARCHAR(10) NOT NULL,
sex char(1),
age INT UNSIGNED,
idcardnum CHAR(18),
worktime DATE,
CONSTRAINT pk_employ
PRIMARY KEY(id)
)COMMENT '员工表';

#删除employ表
DROP TABLE if EXISTS employ;

#查看employee的表结构
DESC employee;

#查询employee表
SELECT * FROM employee;

#在表结构中添加nickname字段类型为VARCHAR(20)
ALTER TABLE employ ADD nickname VARCHAR(20) COMMENT '昵称';

#修改表结构中的字段和字段类型
ALTER TABLE employ CHANGE nickname username VARCHAR(30) COMMENT '用户名';

#删除表中字段为username
ALTER TABLE employ DROP username;

#重命名表名
ALTER TABLE employ RENAME TO employee;

#改变表结构中的字段和类型
ALTER TABLE employee CHANGE num workno VARCHAR(10);
ALTER TABLE employee CHANGE sex gender char(1);
ALTER TABLE employee CHANGE idcardnum idcard char(18);
ALTER TABLE employee CHANGE worktime entrydate DATE;

#添加数据
INSERT into employee (id,workno,`name`,gender,age,idcard,entrydate) VALUE
(1,'1','itcast','男',19,'123456789012345678','2020-6-1'),
(2,'2','张无忌','男',28,'123456789015345678','2021-6-1'),
(3,'3','韦一笑','男',38,'123456784012345678','2022-6-1'),
(4,'4','赵敏','女',18,'123456789012345678','2023-6-1')

#修改表中数据
UPDATE employee set `name`='itheima' WHERE id=1;
UPDATE employee set `name`='小昭',gender='女' WHERE id =2;
UPDATE employee set entrydate='2008-01-02';

#删除数据练习
DELETE FROM employee where gender='女';
DELETE FROM employee;
 
#表创建练习
 CREATE TABLE my_employee (
    id INT,
    workno VARCHAR(10),
    name VARCHAR(20),
    gender CHAR(1),
    age TINYINT,
    idcard CHAR(18),
    entrydate DATE,
    city VARCHAR(20)
);

#表插入练习
INSERT INTO my_employee (id, workno, `name`, gender, age, idcard, city, entrydate) VALUES
(1, '1', '柳岩', '女', 20, '123456789012345678', '北京', '2000-01-01'),
(2, '2', '张无忌', '男', 18, '123456789012345670', '北京', '2005-09-01'),
(3, '3', '韦一笑', '男', 38, '123456789712345670', '上海', '2005-08-01'),
(4, '4', '赵敏', '女', 18, '123456757123845670', '北京', '2009-12-01'),
(5, '5', '小昭', '女', 16, '123456769012345678', '上海', '2007-07-01'),
(6, '6', '杨逍', '男', 28, '12345678931234567X', '北京', '2006-01-01'),
(7, '7', '范瑶', '男', 40, '123456789212345670', '北京', '2005-05-01'),
(8, '8', '黛绮丝', '女', 38, '123456157123645670', '天津', '2015-05-01'),
(9, '9', '范凉凉', '女', 45, '123156789012345678', '北京', '2010-04-01'),
(10, '10', '陈友谅', '男', 53, '123456789012345670', '上海', '2011-01-01'),
(11, '11', '张士诚', '男', 55, '123567897123465670', '江苏', '2015-05-01'),
(12, '12', '常遇春', '男', 32, '123446757152345670', '北京', '2004-02-01'),
(13, '13', '张三丰', '男', 88, '123656789012345678', '江苏', '2020-11-01'),
(14, '14', '灭绝', '女', 65, '123456719012345670', '西安', '2019-05-01'),
(15, '15', '胡青牛', '男', 70, '12345674971234567X', '西安', '2018-04-01'),
(16, '16', '周芷若', '女', 18, NULL, '北京', '2012-06-01')
 
 -- 条件查询

-- 1. 查询年龄等于 88 的员工
SELECT id, workno, `name`, gender, age, idcard, city, entrydate FROM my_employee WHERE age= 88;
-- 2. 查询年龄小于 20 的员工信息
SELECT id, workno, `name`, gender, age, idcard, city, entrydate FROM my_employee WHERE age<20;
-- 3. 查询年龄小于等于 20 的员工信息
SELECT id, workno, `name`, gender, age, idcard, city, entrydate FROM my_employee WHERE age<20;
-- 4. 查询没有身份证好的员工信息
SELECT id, workno, `name`, gender, age, idcard, city, entrydate FROM my_employee WHERE idcard is NULL;
-- 5. 查询有身份证号的员工信息
SELECT id, workno, `name`, gender, age, idcard, city, entrydate FROM my_employee WHERE idcard is NOT NULL;
-- 6. 查询年龄不等于 88 的员工信息
SELECT id, workno, `name`, gender, age, idcard, city, entrydate FROM my_employee WHERE age != 88;
-- 7. 查询年龄在15岁(包含)到20岁(包含)之间的员工信息
SELECT id, workno, `name`, gender, age, idcard, city, entrydate FROM my_employee WHERE age BETWEEN 15 AND 20;
-- 8. 查询性别为 女 且年龄小于 25岁的员工信息
SELECT id, workno, `name`, gender, age, idcard, city, entrydate FROM my_employee WHERE age <= 25 AND gender ='女';
-- 9. 查询年龄等于18或 20或40 的员工信息
SELECT id, workno, `name`, gender, age, idcard, city, entrydate FROM my_employee WHERE age=18 or age=20 or age=40;
SELECT id, workno, `name`, gender, age, idcard, city, entrydate FROM my_employee WHERE age in(18,20,40);
-- 10. 查询姓名为两个字的员工信息
 SELECT id, workno, `name`, gender, age, idcard, city, entrydate FROM my_employee WHERE `name` LIKE '__';
 #查询身份证号最后一位为X的员工
SELECT id, workno, `name`, gender, age, idcard, city, entrydate FROM my_employee WHERE idcard LIKE '%X';
SELECT id, workno, `name`, gender, age, idcard, city, entrydate FROM my_employee WHERE idcard LIKE '_________________X';

#统计该企业员工数量
SELECT count(id) FROM my_employee;
SELECT count(*) FROM my_employee;
SELECT count(idcard) FROM my_employee;#注意：所以的null不参与所以聚合函数运算。
#统计该企业员工的平均年龄
SELECT AVG(age) FROM my_employee;
#统计该企业员工的最大年龄
SELECT MAX(age) FROM my_employee;
#统计该企业员工的最小年龄
SELECT MIN(age) FROM my_employee;
#统计西安地区员工的年龄之和
SELECT SUM(age) FROM my_employee WHERE city='西安';

#根据性别分组，统计男性员工和女性员工的数量
SELECT gender,COUNT(id) FROM my_employee GROUP BY gender;
#根据性别分组，统计男性员工和女性员工的平均年龄
SELECT gender,AVG(age) FROM my_employee GROUP BY gender;
#查询年龄小于45的员工，并根据工作地址分组，获取员工数量大于等于3的工作地址
SELECT city,count(*) as city_count FROM my_employee WHERE age < 45 GROUP BY city HAVING city_count >=3;

#1. 根据年龄对公司的员工进行升序排序
SELECT * FROM my_employee ORDER BY age ASC;
#2. 根据入职时间，对员工进行降序排序 
SELECT * FROM my_employee ORDER BY entrydate DESC;
#3. 根据年龄对公司的员工进行升序排序，年龄相同，再按照入职时间进行降序排序
SELECT * FROM my_employee ORDER BY age ASC,entrydate DESC;

-- 分页查询

-- 1. 查询第1页员工数据，每页展示10条记录
SELECT * FROM my_employee LIMIT 0,10;
-- 2. 查询第2页员工数据，每页展示10条记录
SELECT * FROM my_employee LIMIT 10,10;

-- -------------------------- DQL 语句练习 --------------------------
-- 1. 查询年龄为20,21,22,23岁的女性员工信息。
SELECT * FROM my_employee WHERE age BETWEEN 20 and 23 AND gender= '女';
-- 2. 查询性别为 男 ，并且年龄在 20-40 岁(含)以内的姓名为三个字的员工。
SELECT * FROM my_employee WHERE age>=20 and age <=40 AND gender='男' and `name` like '___';
-- 3. 统计员工表中，年龄小于60岁的，男性员工和女性员工的人数。
SELECT gender,COUNT(*) FROM my_employee WHERE age <60 GROUP BY gender;
-- 4. 查询所有年龄小于等于35岁员工的姓名和年龄，并对查询结果按年龄升序排序，如果年龄相同按入职时间降序排序。
SELECT `name`,age FROM my_employee WHERE age<=35 ORDER BY age ASC,entrydate DESC;
-- 5. 查询性别为男，且年龄在20-40 岁(含)以内的前5个员工信息，对查询的结果按年龄升序排序，年龄相同按入职时间升序排序。
SELECT * FROM my_employee WHERE age>=20 AND age <=40 ORDER BY age asc,entrydate ASC LIMIT 0,5;

-- 查询年龄大于15的员工的姓名、年龄，并根据年龄进行升序排序
SELECT `name`,age FROM my_employee WHERE age >15 ORDER BY age ASC;

-- DCL用户管理练习
-- 创建用户 itcast ，只能够在当前主机localhost访问，密码123456；
CREATE user 'itcast'@'localhost' IDENTIFIED by '123456';
-- 创建用户 heima ，可以在任意主机访问该数据库，密码123456；

-- 修改用户 heima 的访问密码为 1234；

-- 删除itcast@localhost用户
