select * from employee; 
select emp_name, email from employee;
select               -- 2. ��ȸ�ϰ� ���� �÷�(����÷��� ��ȸ�Ҳ��� * )
    emp_name, phone, email  
from                 -- 1. ��ȸ�ϰ� ���� ���̺�
    employee;

select              --3. ��ȸ�ϰ� ���� �÷� 
    *           
from                --1. ��ȸ�ϰ� ���� ���̺�
    employee
where               --2. ��ȸ�ϰ� ���� ���� 
    emp_name = '������';
    
-- �������ּ�
/*
�����ּ�
*/
--1. job���̺��� job_name�÷� ������ ���
select job_name from job;
--2. department���̺��� ��ü ������ ���
select * from department;
--3. employee ���̺��� �̸�(emp_name), �̸���(email), ��ȭ��ȣ(phone), �����(hire_date) ���
select emp_name, email, phone, hire_date from employee;
--4. employee ���̺��� �����(hire_date), �̸�(emp_name), ����(salary)�� ���
select hire_date, emp_name, salary from employee;
--5. employee ���̺��� ����(salary)�� 2500000�� �̻��� ����� �̸�(emp_name), ����(salary) ���
select emp_name, salary from employee where salary >= 2500000  ;
--6. employee ���̺��� ����(salary)�� 3500000�� �̻��̸鼭 job_code�� 'J3'�� ����� �̸�(emp_name), ��ȭ��ȣ(phone) ���
select emp_name, phone from employee where job_code = 'J3' and salary >= 3500000;
--and, or

------------------------------------------------------------------------------
--select�� �Ҷ� ��������� ����. ���������Ϳ� ������ ���� �ʴ´�. ��ȸ ����� ������� ���Խ�ų�� �ִ�. 
select emp_name, salary, salary*12 from employee;

select emp_name, salary, salary+salary*bonus from employee;

select * from employee;
-- ��ȸ �÷��� ��Ī ����

select 
-- ���� �������� ��� �÷� (+) as (+) " "  // �÷� (+����) " " // " " �� �ʿ��� ��Ȳ : �÷� �ȿ� Ư�����ڰ� ��������� 
    emp_name as "�̸�", salary "�޿�", salary*12 "����(��������)", hire_date �Ի���
from
    employee;
    
-- ���ͷ�
select
    emp_name, salary,'$' ����  --���� �Ϲݵ����͵� �÷��ΰ�ó�� ���� �ٿ��ټ� �ִ�. 
from
    employee;
    
-- distinct : �ߺ��� ����� �����ϰ� ������ (��ȸ�� ��� �÷��� �� ��ġ�ؾ� ��)
select distinct job_code from employee;

select distinct emp_name, job_code from employee; --��ȸ�Ǵ� �÷��� �Ϻ��� �Ȱ��ƾ� �������.
-----------------------------------------------------------------------------
-- ���Ῥ����(||) : �����͸� ���� ��(�ڹٿ��� ���ڿ� +)
select emp_name || salary from employee; --erroe  mp_name+salary
select 
    emp_name, salary||'��'
from employee;

-- �������� : �������� ������ �ϳ��� ��Ĩ �� ����ϴ� ������ (and, or, not)
select 
    emp_name, dept_code, salary
from
    employee
where
    dept_code='D6';

select
    emp_name, dept_code, salary
from
    employee
where
    salary >= 3000000;
    
select
    emp_name, dept_code, salary
from
    employee
where
    salary >= 3000000 or dept_code = 'D6';
    
    
-- between A and B : A�̻�, B���� 
-- �޿��� 3500000������ ���� �ް� 6000000������ ���� �޴� ������ �̸�, �޿� ��ȸ 
-- ��¥ ���ڿ� �� ���� �ִ�. 
select
    emp_name, salary
from 
    employee
where
    salary >= 3500000 and salary <= 6000000;
    
select
    emp_name, salary
from
    employee
where
    salary between 3500000 and 6000000;
    
-- employee ���̺��� �Ի糯¥�� 90/01/01 ~ 01/01/01 �� ����� �̸�, �Ի��� ���
select
    emp_name, hire_date
from
    employee
where
    hire_date between '90/01/01' and '01/01/01';
    
-- LIKE : ���Ϸ��� ���� Ư�� ������ ������Ű�� true�� ����
-- ���� ������ ������ ������� ��ȸ 
-- �̸� �� ù���ڰ� ������ �����ϴ� �̸� 
-- ���ϵ�ī�� : �ƹ��ų� ���͵� ������ ����

-- _ : �ѹ��ڸ� ��ü�ϴ� ���ϵ�ī��
-- % : ���̿� ������� ��ü�ϴ� ���ϵ�ī�� 
select
    *
from    
    employee
where
-- _ : ���� employee �� ����� �̸��� 3�����̱� ������ 3������ ��� ����// 4�����̸� ������ �ȵȴ�.
   -- emp_name like '��__';
-- % : ���̰� ������� �� ������ �ȴ�.    
   -- emp_name like '��%';
-- ���� ������ �ƴ� ������ ��� ��ȸ 
    emp_name not like '��%';
    
-- ������ �̸��� �ּ� �� '_' ���ڸ��� 3�ڸ��� ������ �������
select
    *
from 
    employee
where
-- escape #�� _ �� �ƴϾ� 
    email like '___#_%' escape '#';
    
select * from employee where emp_name like '__��' ; 
select * from employee where phone not like '010%';
select 
    * 
from 
    employee 
where 
    email like '%s%'
    -- ���꿡�� �켱������ �ִ�. or �� ���� �� ��� ��ȣ�� ���� ������ �켱������ �ٲ�� ��. 
    and (dept_code = 'D9' or dept_code = 'D6')
    and hire_date between '90/01/01' and '00/12/01'
    and salary >= 2700000;

-- is null, is not null : null�����ʹ� �����Ͱ� ���� �ǹ� -> �������, �񱳿��� �Ұ���
-- ���ǿ��� null�� �������� �˻��ϰ������ null ���� �����ڸ� ���
-- employee ���̺��� ���ʽ��� �޴� ������ �̸�, �޿�, ���ʽ�, ���ʽ��ݾ�
select emp_name, salary, bonus, salary*bonus
from employee
where bonus is not null;
-- employee ���̺��� ���ʽ��� �����ʴ� ������ �̸�, �޿�, ���ʽ�, ���ʽ��ݾ�
select emp_name, salary, bonus, salary*bonus
from employee
where bonus is null;

-- in : ���Ϸ��� �� ��Ͽ� ��ġ�ϴ� ���� ������ true����
-- dept_code�ڵ尡 D6�̰ų� D9�̰ų� D5�� �μ������� �̸�, �μ��ڵ�, �޿���ȸ 
select 
    emp_name, dept_code, salary
from 
    employee 
where
    dept_code in ('D6' , 'D9' , 'D5');
    -- dept_code = 'D6' or dept_code = 'D9' or dept_code = 'D5';
    -- not in
    
    
 -- order by : select�� �÷��� ���� ������ �� �� ����ϴ� ����
 -- order by�� selcet�� ���� �������� �ۼ��ϰ�, ���� �������� ���� 
 -- ����1 : order by �����ϰ���� �÷� [asc|desc] [null��������]
 -- asc : ��������(������->ū�� / ������ / ������->������ / null ���ϾƷ���) �����ϸ� asc�� ���� 
 -- desc : ��������(ū��->������ / �������� / ������->������ / null ��������) 
select           --3. ��ȸ�÷�
    emp_id, emp_name, salary, bonus
from             --1. ���̺�
    employee
where            --2. ����
    dept_code='D5'
order by bonus desc; --4. ���ı��� 

 -- ����2 : order by ��ȸ���÷�����
select
    emp_name, salary, dept_code
from
    employee
where dept_code is not null
order by 2; -- 2��° �÷����� ��������~~ 

 -- ����3 : order by ��Ī
select
    emp_name, salary ����, dept_code
from
    employee
where dept_code is not null
order by ����;

 -- ����4 : order by �÷�1, �÷�2 : �÷�1�� ���������� ������ �����͸�, �ش絥���ʹ� �÷�2�� ������
select
    emp_name, salary ����, dept_code
from
    employee
where dept_code is not null
order by ����, emp_name;
