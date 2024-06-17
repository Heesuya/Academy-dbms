 --�Ϲ����� �÷��� �׷��Լ��� ���� ������ ������ group by ����ϸ� �հ踦 �����´�
select 
    dept_code, sum(salary)
from employee
group by dept_code;

select 
    sum(salary)
from employee
where dept_code = 'D1';

--group by �������� ���谡 �ȴ�. 
select
   dept_code, decode(substr(emp_no,8,1),'1','��','2','��') ����, sum(salary), floor(avg(salary)), count(*)
from employee
group by dept_code, decode(substr(emp_no,8,1),'1','��','2','��')
order by dept_code;

-- ��ձ޿��� 300���� �̻��� �� �μ��� ��� �޿�
-- ���� ���� : from / where / group by / having / select / order by
-- where �� having �� �ٸ��� 
select dept_code, floor(avg(salary)) ���
from employee
group by dept_code
having avg(salary) >= 3000000;


-- join ���Ŀ��� ǥ�� ����(��𿡼��� ����ϴ�)�� ���
select emp_name, dept_code from employee;
select * from department;

--1. ������ �̸�(employee), �μ��ڵ�(employee,department), �μ���(department)�� ��ȸ 
-- ����Ŭ ���빮�� 
select
    emp_name,
    dept_code,
    dept_title
from employee, department
where dept_code = dept_id;

--ǥ�� ����(���Ϸ��� �÷� �̸��� �ٸ����)
select
    emp_name,
    dept_code,
    dept_title
from employee
join department on (dept_code = dept_id);

--2. ������ �̸�(employee), �����ڵ�(employee,job), ���޸�(job)�� ��ȸ 
select emp_name, job_code from employee;
select * from job;
-- ����Ŭ ����
select
    emp_name, employee.job_code, job_name
from employee, job
where employee.job_code = job.job_code;
-- ǥ�ر���(���Ϸ��� �÷� �̸��� ���� ��)
select 
    emp_name,job_code, job_name
from employee
join job using (job_code);

------------------------------------------------------------------------
select * from employee;
select * from department;
select * from job;
--1. ȸ���� �̸�(employee / emp_name), �μ���(department / dept_title) ��ȸ
-- ���Ϸ��� �÷� �̸��� �ٸ� ���
select
    emp_name, dept_title
from employee
join department on (dept_code = dept_id); --������ �����ϴ� ������� �ۼ� 

--2. ȸ���� �̸�(employee emp_name), ���޸�(job job_name) ��ȸ
-- ��ȸ(���ҷ��� �÷� �̸��� ���� ���)
select
    emp_name, job_name
from employee
join job using (job_code);

select  --�̷���� �����ϱ� �ϴ�. 
    emp_name, job_name, employee.job_code
from employee
join job on(employee.job_code = job.job_code);

-- select / (from / join) / where / group by / having / order by
select   -- ��� �����ؼ� �Ѵ�.  ������ �ΰ� �϶��� ������ ������ ����� �Ѵ�. 
    emp_name, job_name, e.job_code
from employee e
join job j on (e.job_code = j.job_code);
select * from department;

select distinct dept_code from employee order by 1;
select * from department;


-- inner join(��������) : �Ϲ����� join�� ���·� join���ǿ� ��ġ�ϴ� �����Ͱ� ������, ��ȸ������� ����
-- -> �ϵ���, �̿��� ������ dept_code�� null�̹Ƿ� join ���ǿ� ��ġ�ϴ� �����Ͱ� ��� ��ȸ���� ���� 
select
    emp_name, dept_id, dept_title
from employee join department on (dept_code=dept_id);

--left join(���ʿܺ�����) : join ���ǿ� ��ġ�ϴ� �����Ͱ� ��� join�� �������� �����ۼ��� ���̺��� �����ʹ� ��ȸ����� ����(null�� ���)
-- ->�ϵ���, �̿��� ������ dept_title�� null�� ��ȸ 
select
    emp_name, dept_code, dept_title
from employee left join department on (dept_code=dept_id);

-- right join(�����ʿܺ�����) : join���ǿ� ��ġ�ϴ� �����Ͱ� ��� join�� �������� ���߿� �ۼ��� ���̺��� �����ʹ� ��ȸ����� ����(null�� ���)
-- D7, D3, D4 �μ��� ���� ������ ������ ��ȸ����� ���ԵǾ� ����(�����̸��� null�� ó��)
select
    emp_name, dept_id, dept_title
from employee right join department on (dept_code=dept_id);


-- full join(�����ܺ�����) : left join�� right join�� ��ģ ��� 
select
    emp_name, dept_id, dept_title
from employee full join department on (dept_code=dept_id);

-- cross join : �� ����� ��� ���ε� �����Ͱ� �˻��Ǵ� ���� 
select
    emp_name, dept_code, dept_title
from employee
cross join department; -- ���ǽ��� ����. �� ���Ѱ� 1:1�� ���δ� ��Ī��Ŵ 

-- self join : 1���� ���̺��� join�ϴ� ��� -> ���� ���̺��� join�� �ϹǷ� ���ؼ� ��� �÷��� �̸��� 2���� �ߺ� 
-- -> ��� �� ��� �÷��� ��� ���̺� �Ҽ������� ��Ȯ�� ���и� �ϸ� �Ϲ� ���ΰ� ���� 
-- �� ������ �̸��� 
select * from employee e1;
select * from employee e2;

select e1.emp_name, e2.emp_name
from employee e1  --������
left join employee e2 on (e1.manager_id = e2.emp_id); --�Ŵ�����

-- ���� ���� 
-- ������ �̸�(employee emp_name), �μ���(department dept_title), ���޸�(job job_name)�� ��ȸ 
select
    emp_name, dept_title, job_name 
from employee
left join department on (dept_code = dept_id) --on ����ص� ��, ���̺� �� ���и� �����ָ� �ȴ�. 
join job using (job_code); --�÷� �̸��� �Ȱ����� 

select * from employee;
select * from department;
select * from location;
-- ������ �̸�(employee emp_name), �μ���(department dept_title), �ٹ�������(location local_name)
select  -- �̿� ���� ���� ������ �߿��ϴ�
    emp_name, dept_title, local_name
from employee
left join department on (dept_code = dept_id) 
left join location on (location_id = local_code);

-- ������ �̸�(employee emp_name), �ٹ�������(location local_name)
select  -- employee�� location�� �������� �ʾƼ� department�� ������ ������ �ؾ��Ѵ�. ���� �߿�!
    emp_name, local_name
from employee
left join department on (dept_code = dept_id) 
left join location on (location_id = local_code);

-- �ǽ� 1  70���, ����, �� = ���� 
select
    emp_name �����, emp_no �ֹι�ȣ, dept_title �μ���, job_name ���޸�
from employee 
join department on (dept_code = dept_id)
join job using (job_code)
where emp_no like '7%-2%' and emp_name like '��%';
--where emp_name like '��%' and substr(emp_no,1,1) like 7 and substr(emp_no,8,1) like 2;

-- �ǽ� 2 �̸��� '��' �ڰ� ���� �������� ���, �����, �μ���
select
    emp_id, emp_name, dept_title
from employee
join department on (dept_code = dept_id)
where emp_name like '%��%';

-- �ǽ� 3 �ؿ� �����ο� �ٹ��ϴ� �����, ���޸�, �μ��ڵ�, �μ��� 
select
    emp_name �����, job_name ���޸�, job_code �μ��ڵ�, dept_title �μ���
from employee
left join department on (dept_code = dept_id)
left join job using (job_code)
where dept_title like '�ؿܿ���%';
--where substr(dept_title,1,2) like '�ؿ�';

-- �ǽ� 4 ���ʽ�����Ʈ�� �޴� �������� �����, ���ʽ�����Ʈ, �μ���, �ٹ������� 
select
    emp_name �����, nvl(bonus,0) ���ʽ�����Ʈ, dept_title �μ���, local_name �ٹ�������
from employee
left join department on (dept_code = dept_id)
left join LOCATION on (location_id = local_code)
where bonus not like 0;
--where bonus is not null;  --���� null ���� �ٲ��� �ʾƵ� �� 

-- �ǽ� 5 �μ��ڵ� D2 �� �������� �����, ���޸�, �μ���, �ٹ�������
select
    emp_name �����, job_name ���޸�, dept_title �μ���, local_name �ٹ�������
from employee
left join department on (dept_code = dept_id)
left join job using (job_code)
left join location on (location_id = local_code)
where dept_code = 'D2';

-- �ǽ� 6 �ѱ�(KO) �� �Ϻ�(JP) �� �ٹ��ϴ� �������� �����, �μ���, ������, ������
select
    emp_name �����, dept_title �μ���, local_name ������, national_name ������ 
from employee
left join department on (dept_code = dept_id)
left join location on (location_id = local_code)
left join national using (national_code)
where national_code in ('KO', 'JP');

--�ǽ� 7 ���� �μ��� �ٹ��ϴ� �������� �����, �μ���, �����̸�  (self join ���) 
select
    e1.emp_name �����, dept_title �μ���, e2.emp_name �����̸�
from employee e1 
left join department on (e1.dept_code = dept_id)
join employee e2 using (dept_code)
where e1.emp_name not like e2.emp_name 
order by 1;

--�ǽ� 8 ���ʽ�����Ʈ�� ���� ������ �� -> ���� : ����, ��� // �����, ���޸�, �޿�    join �� in ��� 
select
    emp_name �����, job_name ���޸�, salary �޿� 
from employee
join job using (job_code)
where bonus is null and job_name in ('����','���');