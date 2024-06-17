-- union(������) : �� ��ȸ ����� ��ġ�鼭 �ߺ��� �����͸� �����ϰ�, ù��° �÷��������� ����
select
    emp_id, emp_name, dept_code, salary
from employee
where dept_code = 'D5'

union

select
    emp_id, emp_name, dept_code, salary
from employee
where salary > 3000000;

-- union all(������) : �� ��ȸ ����� ��ġ�鼭 �ߺ����� �����ʰ�, ���� �������� 
select
    emp_id, emp_name, dept_code, salary
from employee
where dept_code = 'D5'

union all

select
    emp_id, emp_name, dept_code, salary
from employee
where salary > 3000000;


-- intersect(������) : �ߺ��� �����͸� ��� 
select
    emp_id, emp_name, dept_code, salary
from employee
where dept_code = 'D5'

intersect

select
    emp_id, emp_name, dept_code, salary
from employee
where salary > 3000000;


-- minus(������) : ���� select ������� ���� select����� ��ġ�� �ʴ� �κи� ��ȸ
select
    emp_id, emp_name, dept_code, salary
from employee
where dept_code = 'D5'

minus

select
    emp_id, emp_name, dept_code, salary
from employee
where salary > 3000000;


select
    emp_id, emp_name, dept_code, salary
from employee
where salary > 3000000

minus

select
    emp_id, emp_name, dept_code, salary
from employee
where dept_code = 'D5';

-- union , intersect 
-- union all, minus  :  ������ �߿��� 
-- ���� �Խ���(Ȩ���������� �Խ����� �������϶�)�� ���� set operator�� ����. 


--------------------------------------------------------------------
-- �� ������ ��� �޿����� ���� �޿��� �ް��ִ� ������ ���, �̸�, �����ڵ�, �޿��� ��ȸ
-- ��������, �������� (subquery)
-- ������ ��������
select 
    emp_id, emp_name, job_code, salary
from
    employee
where
    salary > (select avg(salary) from employee); --���κ��� ���� �����Ѵ�. 
    -- ������ Ÿ�� �����ؾ� �Ѵ�. 

-- �������� ��ձ޿��� ���ϴ� ���
select avg(salary) from employee;


--1. ���� �� �������� : ���������� ��ȸ ����� 1�� 1�� -> ���ϰ� (���������� ���� �ϳ� ���� ��) 

-- �� ������ ��� �޿����� ���� �޿��� �ް��ִ� ������ ���, �̸�, �����ڵ�, �޿��� ��ȸ
-- -> �������� ��ձ޿� 
select avg(salary) from employee;

select 
    emp_id, emp_name, job_code, salary
from
    employee
where
    salary > (select avg(salary) from employee);

--1. �����ؿ� �޿��� ���� ������� �˻��ؼ�, �����ȣ,����̸�, �޿��� ����϶�.
-- ��, �����ش� ��� �Ǹ� �ȵ�
select 
    emp_id, emp_name, salary 
from employee
where salary = (select salary from employee where emp_name = '������') and emp_name != '������';

--2. employee ���̺��� �⺻�޿��� ���� ���� ����� ���� ���� ����� ������
-- ���, �����, �⺻�޿��� ��Ÿ������.
select 
    emp_id, emp_name, salary
from employee
where salary in((select max(salary) from employee) ,(select min(salary) from employee)) ;

-- 3. D1, D2�μ��� �ٹ��ϴ� ����� �߿���
-- �޿��� D5 �μ� �������� '��տ���' ���� ���� ����鸸
-- �μ���ȣ, �����ȣ, �����, ������ ��Ÿ������.
select 
    dept_code, emp_id, emp_name 
from 
    employee
where
    dept_code in ('D1','D2') and 
    salary > (select avg(salary) from employee where dept_code = 'D5');
    
    
-- 2. ���� �� �������� : �������� ���� ����� 1���÷�, ������ row�� ������ ��� 
-- �μ��� �ְ� �޿��� �޴� ������ �̸�, �����ڵ�, �μ��ڵ�, �޿��� ��ȸ 
select
    emp_name, job_code, dept_code, salary
from 
    employee
where 
    salary in (select max(salary) from employee group by dept_code);

-- �μ��� �ְ� �޿� 
--�� ���°� ������ ���� 
select max(salary) from employee group by dept_code;
    
    
-- ������ �Ǵ� �ڳ��� ���� �μ��� �ٹ����� �ʴ� ��� ��ȸ 
-- �Ϲ� �����ڴ� ������� ���ϰ�, �������� ���Ҽ� �ִ� �����ڸ� ����Ѵ�. 
select *
from employee
where dept_code not in (select dept_code from employee where emp_name in ('������','�ڳ���'));
select dept_code
from employee
where emp_name in ('������','�ڳ���');

-- ������ ��ǥ, �λ����� �ƴ� ��� ����� �̸�,�μ���,�����ڵ带 ����ϼ���.
select 
    emp_name, dept_title, job_code
from employee
join department on (dept_code=dept_id)
where job_code not in (select job_code from job where job_name in ('��ǥ','�λ���'));

select 
    emp_name, dept_code, job_code
from 
    employee
where job_code not in (select job_code from job where job_name in ('��ǥ','�λ���'));


-- any : �ּҰ����� ũ�� or �ִ밪���� ������ 
-- or �� �̾��ְڴ�.  ��ȣ ������ in �� ���� 
select emp_id, emp_name, salary
from employee
where salary = any(2000000,6000000);

select emp_id, emp_name, salary
from employee
where salary > any(2000000,6000000);

select emp_id, emp_name, salary
from employee
where salary < any(2000000,6000000);

select emp_id, emp_name, salary
from employee
where salary > 2000000 or salary > 6000000;

-- all : �ִ밪���� ũ�� or �ּҰ����� ������ 
select emp_id, emp_name, salary
from employee
where salary > all(2000000,6000000);

select emp_id, emp_name, salary
from employee
where salary > 2000000 and salary > 6000000;

select emp_id, emp_name, salary
from employee
where salary < all(2000000,6000000);

select emp_id, emp_name, salary
from employee
where salary < 2000000 and salary < 6000000;

-- ��ġ�ϴ� ���� ���⿡ ���� ����.   -- �ּҰ��̳� �ִ밪�� ���Ҷ� any�� all �� ����Ѵ� �̷������ڵ� �����Ѵ�~
select emp_id, emp_name, salary
from employee
where salary = all(2000000,6000000);

-- 3. ���߿� ��������  : �������� ��ȸ����� 1�� n���� ��� 
-- ����� �������� �����μ�, ���� ���޿� �ش��ϴ� ����� �̸�, �����ڵ�, �μ��ڵ带 ��ȸ
select dept_code, job_code from employee where ent_yn='Y';

select * from employee;
select
    emp_name, job_code, dept_code
from employee
-- �Ѽ�Ʈ�� ��ȣ�� �����ش�. 
where (dept_code, job_code) in (('D8','J6'),('D6','J4'));

select  
    emp_name, job_code, dept_code
from employee
where
    (dept_code = 'D8' and job_code = 'J6')
    or
    (dept_code = 'D6' and job_code = 'J4');
    
select
    emp_name, job_code, dept_code
from employee
-- �Ѽ�Ʈ�� ��ȣ�� �����ش�. 
where (dept_code, job_code) in (select dept_code, job_code from employee where ent_yn='Y');


-- 4. ������ ���߿� �������� : �������� ���� ����� m�� n���� ��� 
-- ���޺� �ּ� �޿��� �޴� ������ ���, �̸�, �����ڵ�, �޿�
select 
    emp_id, emp_id, job_code, salary
from
    employee
where
    (job_code, salary) in (select job_code, min(salary) from employee group by job_code);
/*
    (job_code = 'J2' and salary = 3700000)
    or
    (job_code = 'J7' and salary = 1380000)
    or
    (job_code = 'J3' and salary = 3400000)
*/

-- ���޺� �ּұ޿� ��ȸ
select job_code, min(salary) from employee group by job_code;


-- 5. �������(��ȣ������������) : ���������� ���������� ���� �����Ǿ��ִ� ���� 
--                           -> ���������� ����ɶ� ���������� �����͸� ������ �����ϴ� ���� 
-- �����ڰ� �ִ� ������� ���, �̸�, �μ��ڵ�, �����ڹ�ȣ ��ȸ 

 select
    emp_id, emp_name, dept_code, manager_id
from
    employee e1
where 
exists
(select emp_id from employee e2 where e2.emp_id = e1.manager_id);

select * from employee;

-- ������ exists(��������) : �������� �������� 1���� ������ true/false  


-- 6. ��Į�󼭺����� : ��ȣ�������������̸鼭, ������ ���������� �� 
-- ��Į�󼭺������� SELECT�� ���                           --join�� ��ü �Ҽ� �ִ�
-- ������� ���, �̸�, �����ڻ��, ������ �̸� 

    
--���ƿ� ��� ?????????????????????????????????????????????????????????????????????????
select
    emp_id,
    emp_name,
    manager_id,
    nvl((select emp_name from employee e2 where e2.emp_id = e1.manager_id), '�����ھ���') as �������̸�
from
    employee e1;
    
-- ��Į�󼭺�Ŀ���� WHERE�� ���
-- �ڽ��� ���� ������ ��� �޿����� ���̹޴� ������ �̸�, ����, �޿� 

select
    emp_name, job_code, salary
from
    employee e1
where
    salary >= (select avg(salary) from employee e2 where e2.job_code = e1.job_code);
    
    
-- ��Į�󼭺����� order by �� ���
-- ������ ���, �̸�, �μ��ڵ带 �μ��� �������� �������� ����
select
    emp_id, emp_name, dept_code
from employee
order by 
(select dept_title from department where dept_id = dept_code)
--(select dept_title from department d where d.dept_id = e.dept_code)
desc nulls last;

 select * from department order by dept_title desc;
 
 
-- ���������� from ���� ����� ��(�ζ��� view)
-- view : ������ ���̺� 
-- TOP-N�м� : �÷����� ���� ū�� �������� ��� �����͸� ������ ��     -- ��α� �Խ��� ��ü�� �ȳ����� ������ ���� ���ö� --sns �������� ��� �ҷ����°� 


select *
from (select emp_name, salary from employee);

-- ������ �� �޿��� ���� ���̹޴� 5���� ��ȸ 
select emp_name, salary from employee order by salary desc;

-- rownum : ��ȸ����� ������� �ε����� ���̴� ����            --�÷�ó�� ���°� �ƴ�
-- �̴�� �ۼ��ϸ� rownum�� ���� �Ŀ� ������ �߻� -> ��? order by�� ���� �������� �����ϴϱ� 
select rownum, emp_name, salary from employee  where rownum <= 5 order by salary desc;
-- ������ �����ϰ� ������ ���̺� ���·� ����ϰ� ������ �ִ´�. --select ���� ������ �߿��ϴ� 
select rownum, emp_name, salary from (select emp_name, salary from employee order by salary desc) where rownum <= 5 ;
--6~10��
select *
from
(select rownum as rnum, emp_name, salary
from (select emp_name, salary from employee order by salary desc)) 
where rnum between 6 and 10;
--where rnum >= 6 and rnum <= 10;

