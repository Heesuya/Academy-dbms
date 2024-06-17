-- ������ �Լ� : �� �ึ�� �ݺ������� ����Ǿ� �Է¹��� ���� ����ŭ ����� ��ȯ

-- ���� ó�� �Լ� 

-- length(param) : �Ű������� ���޵� ������ ���̸� ��ȯ 
select
    emp_name, length(emp_name) �̸�����, email, length(email) �̸��ϱ��� 
from employee;

-- lengthb(param) : �Ű������� ���޵� ������ ����(byte)�� ��ȯ 
select
    emp_name, lengthb(emp_name) �̸�����, email, lengthb(email) �̸��ϱ��� 
from employee;
    
-- instr(param1, param2, [param3], [param4]) : param1���ڿ����� param2�� ��ġ�� ã�Ƽ� �ǵ����ִ� �Լ� 
-- param1 : �������ڿ�
-- param2 : ã���������
-- param3 : �������ڿ� �� ���ڸ� ã�� ���� ���ڹ�ȣ(param3�� ������ �ְԵǸ� �ں��� ã��)
-- param4 : �˻��� ���� ����
select instr('Hello World Hi High', 'H') from dual;
select instr('Hello World Hi High', 'H', 2) from dual;
select instr('Hello World Hi High', 'H', 2, 2) from dual;
select instr('Hello World Hi High', 'H', -1, 1) from dual;
select instr('Hello World Hi High', 'H', -5, 1) from dual;

select email, instr(email, '@', 1, 1) from employee; --�ʿ��Ѱ� ã�Ƽ� ���� �ִ� 


-- LPAD / RPAD
-- LPAD(param1, param2, [param3]) : param1���ڿ��� param2���̸�ŭ ������ ����
-- ������ ���̰� �������ڿ����� ��� ���ʿ� ������ �־ ���̸� ����
-- ������ ���̺��� �������ڿ��� ª���� ������ ���̸�ŭ ����ϰ� ���ڿ��� �߶� 
-- param1 : ��� ���ڿ�
-- param2 : ���� 
-- param3 : �����ȱ��̺��� �������ڿ��� ª�Ƽ� ���̸� �ø��� ������ ä�� ���ڸ� ���� 
-- RPAD�� LPAD�� ������ �Լ����� �����ʿ� ���� 
select lpad('abc', 2), lpad('abc', 5, '$'), rpad('abc', 2), rpad('abc', 5, '$') from dual;

select email, lpad(email,20,'#'), rpad(email,20,'#'), lpad(email,10,'#'), rpad(email,10,'#')
from employee;

-- LTRIM/RTRIM
-- LTRIM(param1, [param2]) : param1�� ���ڿ��� ���ʿ��� param2�� ���Ե� ��繮�ڸ� ������ �������� ��ȯ 
--                         : �̶� param2�� �����ϸ� ' '�������� ó��
select '   KH', ltrim('   KH') from dual;
select '###KH', ltrim('###KH', '#') from dual;
select ltrim('000123456', '0') from dual;
select ltrim('123321456', '123') from dual; -- 1 or 2 or 3 �̾� 123�� ������ �ƴϴ� 
select rtrim('000123456000', '0') from dual;
select rtrim('123321456123321', '123') from dual;

-- trim(param1) : �־��� param1�� ��/��/���ʿ� �ִ� ������ ���ڸ� ������ �������� ��ȯ
-- trim(char from param1)
-- trim(���� char from param1)
-- trim�� �����ϴ� ���ڰ� �ݵ�� 1����!!
select rtrim(ltrim('   KH   ', ' '),' ') from dual;
select trim('   KH   ')from dual; --���ڿ��������� ���ʿ��� ����(' ')�� ����
select trim('#' from '###KH###') from dual;
select trim(leading '#' from '###KH###') from dual;
select trim(trailing '#' from '###KH###') from dual;
select trim(both '#' from '###KH###') from dual;

-- ����1
select rtrim('Hello KH Java', 'Jav') from dual;

-- ����2
select ltrim('Hello KH Java' ,'Helo ') from dual;

-- ����3
select trim (trailing '��' from dept_title) from department;

-- ����4
select rtrim(ltrim('982341678934509hello89798739273402', '0123456789'),'0123456789') from dual;


-- substr(param1, param2, [param3]) : param1���ڿ����� param2���� param3������ŭ ���ڿ��� �߶� ���� 
--                                  : param3�� �����ϸ� ������ �߶� ���� 

select substr('show me the money', 3, 5) from dual;
select substr('show me the money', 5) from dual;
select substr('show me the money', 5, 3) from dual;
select substr('show me the money', -5, 3) from dual; -- ���� ������ ����

-- ��� �̸� �� �� / �̸� �и� 
select substr(emp_name, 1, 1), substr(emp_name, 2) from employee;

-- LOWER/UPPER/INITCAP
select lower('SHow mE tHE moNEy') from dual;        --���� �ҹ��ڷ� ��ȯ
select upper('SHow mE tHE moNEy') from dual;        --���� �빮�ڷ� ��ȯ
select initcap('SHow mE tHE moNEy') from dual;      --�� �ܾ ù���ڸ� �빮�ڷ� ��ȯ

-- concat(param1, param2) :  param1�� param2�� ���ļ� �ϳ��� ���ڿ��� ���� 
select concat('�����ٶ�', 'ABDC') from dual;
select '�����ٶ�'||'ABCD'||'1234' from dual; --���Ῥ���ڸ� ����ϴ°� �� ���ϴ�

-- replace(param1, param2, param3) : param1���ڿ����� param2���ڿ��� ã�Ƽ� param3���ڿ��� ��ȯ�ؼ� ����
select replace('show me the money', 'me', 'you') from dual; 
select replace('show me the money', 'm', 'a') from dual; --ã�Ƽ� �ϴ� �ٲ��ش�

select emp_name, emp_no, replace(email, 'kh.or', 'iei.co') from employee;

-- ���� ó�� �Լ� 

-- ABS(param1) : �Ű������� ������ ���� ���밪�� ���� 
select abs(10), abs(-10) from dual;

-- mod(param1, param2) : param1%param2
select mod(10, 3), mod(10, 2), mod(10,4) from dual;

-- round(param1, [param2]) : param1�� ���� ���ڸ� param2�ڸ����� ǥ���ϵ��� �ݿø� 
select round(126.456) from dual;
select round(126.456,3) from dual; --������
select round(126.4562,2) from dual;
select round(126.4562,0) from dual;
select round(126.4562,-1) from dual;
select round(126.4562,-2) from dual;

--floor(param1) : �Ҽ��� �ڸ����� ����
select floor(126.456) from dual;

--trunc(param1, param2) : param1�� �Ҽ��� �� param2�ڸ��� ���ĸ� ���� 
select trunc(126.4562,1) from dual;
select trunc(126.4562,2) from dual;
select trunc(126.4562,-2) from dual;

-- ceil(param1) : �Ҽ��� �ڸ����� �ø�
select ceil(126.456) from dual;

-- ��¥ó�� �Լ� 
-- sysdate : �ý��ۿ� ����Ǿ��ִ� ���� ��¥�� ��ȯ�ϴ� �Լ� 
select
    sysdate, current_date, localtimestamp, current_timestamp from dual;
    
-- months_between(param1, param2) : param1�� param2 �� ��¥ ������ �������� ����(����)
select emp_name, hire_date, months_between(sysdate, hire_date) from employee;

-- add_months(param1, param2) : param1��¥�� param2�������� ���� ��¥�� ���� 
select emp_name, hire_date, add_months(hire_date,3) from employee;

-- next_day(param1, param2) : param1��¥�� ��������, ���� ����� param2������ �ش��ϴ� ��¥�� ���� 
-- ������ ���� 1=�Ͽ��� ~ 7=�����
select sysdate, next_day(sysdate, '������') from dual;
select sysdate, next_day(sysdate, 2) from dual;
select sysdate, next_day(sysdate, 'ȭ����') from dual;
select sysdate, next_day(sysdate, '������') from dual;
select sysdate, next_day(sysdate, '�����') from dual;


-- last_day(param1) : param1�� ���� ��¥�� ���� ���� ���� ��������¥�� ���ؼ� ���� 
select emp_name, hire_date, last_day(hire_date), last_day(sysdate), add_months(sysdate,1) from employee; -- ������ ���� ����ؾ��ϴ� ȸ�簡 �־ �߿���

-- extract : ��¥�����Ϳ��� �⵵, ��, �� ������ ���� ���� ����(����� �����ʹ� ����)
-- extract(year from param1) : param1 ��¥���� �⵵�� ���� 
-- extract(month from param1) : param1 ��¥���� �޸� ���� 
-- extract(day from param1) : param1 ��¥���� ���ϸ� ���� 
select sysdate, extract(year from sysdate), extract(month from sysdate), extract(day from sysdate) from dual;

-- ��¥ Ÿ�Կ����� ������ ������ 
select emp_name, extract(year from hire_date), extract(month from hire_date), extract(day from hire_date) from employee;

---------------
-- �� ��ȯ �Լ�
-- to_char : ��¥������ or ���ڵ����͸� ������������ ��ȯ�ϴ� �Լ� 
-- to_char(��¥,[format])
select to_char(sysdate),to_char(sysdate, 'yyyy-mm-dd'), sysdate from dual;
select to_char(sysdate, 'yyyy-mm-dd') from dual;
select to_char(sysdate, 'yyyy/mm/dd') from dual;
select to_char(sysdate, 'yyyy/mm/dd/day') from dual;
select to_char(sysdate, 'yyyy/month/dd/day') from dual;
-- ���� ���� 24�� ǥ��� �� ����
select to_char(sysdate, 'yyyy/month/dd/day pm hh24:mi:ss') from dual;
select to_char(sysdate, 'yyyy/month/dd/day  hh24"��"mi"��"ss"��"') from dual;
select to_char(sysdate, 'day') from dual;

select emp_name, to_char(hire_date, 'yyyy-mm-dd day') from employee;

-- to_char(����,[format])
select 
    500000,
    to_char(500000, '999,999'),     --����ȯ
    to_char(500000, '000,000'),     --����ȯ
    to_char(500000, '9,999,999'),   --����ȯ
    to_char(500000, '0,000,000'),   --����ȯ(���� ������ 0���� ä��)
    to_char(500000, '99,999'),      --�ڸ��� ���ڶ�� ����ȯ�� �Ұ���
    to_char(500000, '00,000') ,     --�ڸ��� ���ڶ�� ����ȯ�� �Ұ���
    to_char(500000, 'L999,999')     --���� ��ȭ�� ǥ��(���� ����)
    from dual;

-- to_date(���� or ����, format)
select to_char(to_date(20240531, 'yyyymmdd'),'yyyy-mm-dd hh24:mi:ss'), to_date('2024-05-31', 'yyyy-mm-dd') from dual;

-- to_number(����, [format])
select to_number('1,000,000','9,999,999') from dual;

select to_number('100a') from dual; --���ڷ� ��ȯ�� �� ���� �����ʹ� ������ �߻� 

-- 100+1000 = 1100
-- '1000' || '100' = 1000100
-- ����Ŭ���� +������ �ϸ� ������ ������� -> ���ڰ� �ƴѵ����͸� + �����ҷ����ϸ�? �ڵ����� ���ڷ� ����ȯ
select '1000'+'100a' from dual;     --error
select '1000'+'100' from dual;

-- ��.. �ǰ���... 

-- ��Ÿ�Լ� 

-- nvl(param1, param2) : param1�����Ͱ� null�̸� param2�� ��ü�ؼ� ���� / null�� �ƴϸ� param1�� ����

-- ������ Ÿ���� ����� �Ѵ�. 
select
    emp_name, dept_code, nvl(dept_code,'�μ�����'),salary, bonus, nvl(bonus,0), salary+salary*nvl(bonus, 0)
from
    employee;
    
-- decode - �����Լ� : �������� ��쿡 ������ �� �� �ִ� ����� ����(��ġ)
-- decode(ǥ����,����1,���1,����2,���2,����3,����3,......,���ǿ��ش�Ǵ°� ������)
-- switch�� �����
select * from employee;
select emp_name, decode(substr(emp_no,8,1),'1','����','2','����','3','����','4','����','���Ⱑdefault') from employee ;

-- case - �����Լ� : �������� ��쿡 ������ �� �� �ִ� ����� ����(�������� ����)
-- if ~ else �� �����
/*
    case 
        when ����1 then ���1 
        when ����2 then ���2 
        when ����3 then ���3           
        else ���������
    end
    as ��Ī
*/

select
    emp_name, 
    case 
        when substr(emp_no,8,1) in ('1','3') then '����'
        when substr(emp_no,8,1) = '2' or substr(emp_no,8,1) = '4' then '����'
        else '���Ⱑ �⺻��'
    end
    as ���� 
from
    employee;
    
---------------------------   
-- �׷��Լ� : �ϳ��̻��� ���� �׷����� ��� ���� �Լ� ����, ��� ���� ���ϴ� �Լ� 

-- sum(�÷�) : �ش� �÷��� �� ���� ���ϴ� �Լ� 
-- �Ϲ� �÷��� ���� ����Ҽ� ����. ������ �ٸ�.
select 
    sum(salary) 
from employee 
where dept_code='D9'; --3������ �ٿ����� 3���� ������ ���´�. 

-- avg(�÷�) : �ش� �÷��� ����� ���ϴ� �Լ� 
select avg(salary) from employee;
select avg(bonus) from employee; --null�� �׷��Լ� ���꿡�� ���� 
select avg(nvl(bonus,0)) from employee;--null�� �׷��Լ� ���꿡 ���Խ�Ű���� nvl�� ����
select bonus from employee;

-- count(�÷�) : ��ȸ ������ �����ϴ� ���� ������ ����
select count(dept_code) from employee;
select count(*) from employee;

-- max(�÷�), min(�÷�) : �־��� �÷� �� �ִ�/�ּҰ��� ���Ͽ� ���� 
select max(salary) from employee;
select min(salary) from employee;
select sum(salary), avg(bonus), count(*), max(salary), min(salary) from employee;

select * from employee;
--�ǽ� 1
select emp_name ������, email �̸���, length(email) �̸��ϱ��� 
from employee;

--�ǽ� 2
select emp_name,substr(emp_no,1,2) ��, substr(email,1, instr(email, '@')-1) �̸��Ͼ��̵� from employee;

--�ǽ� 3
select emp_name ������ , substr(emp_no,1,2) ���, nvl(bonus,0) ���ʽ� from employee
where  emp_no like '6%' ;
--where substr(emp_no,1,1) = '6';   ù�ڸ��� ������ �ص� �ȴ�~

--�ǽ� 4
select count(*)||'��' �ο� from employee where phone not like '010%';


--�ǽ� 5
select emp_name ������, extract(year from hire_date)||'�� '||extract(month from hire_date)||'��' �Ի���1,
to_char(hire_date, 'yyyy"��"mm"��"') �Ի���2  --'fmyyyy"��"mm"��"' --�տ� ���� 1,2�ڸ��� ����
from employee;

--�ǽ� 6
select emp_name, rpad(substr(emp_no,1,8),14,'*') �ֹι�ȣ, 
       substr(emp_no,1,8)||'******' �ֹι�ȣ2 
from employee;

--�ǽ� 7
select emp_name ������, job_code,  to_char((salary*12) + (salary*nvl(bonus,0)*12), 'L999,999,999') ���� 
from employee;

--�ǽ� 8 
select emp_id, emp_name �����, dept_code, hire_date from employee where hire_date like '04%';
select emp_id, emp_name �����, dept_code, hire_date
from employee
where
    extract(year from hire_date) = 2004
    and
    dept_code in ('D5','D9');  -- ==  (dept_code = 'D5' or dept_code = 'D9') 


--�ǽ� 9 
select emp_name ������, hire_date �Ի��� , floor(nvl(ent_date,sysdate) - hire_date) �ٹ��ϼ� from employee;

select emp_name, hire_date,floor(sysdate-hire_date)
from employee;

--�ǽ� 10
select max(2025 - (19||substr(emp_no,1,2))) "�ִ� ����", min(2025 - (19||substr(emp_no,1,2))) "�ּ� ����" from employee;

--rr �ɼ� : �⵵ 2�ڸ��϶� ���� �ɼ� 50 �������� �⵵ �����. 
select
    max(extract(year from sysdate) - extract(year from to_date(substr(emp_no,1,2),'rr'))+1) as "�ִ� ����",
    min(extract(year from sysdate) - extract(year from to_date(substr(emp_no,1,2),'rr'))+1) as "�ּ� ����" 
from employee;

--�ǽ� 11
select emp_name, dept_code,
       decode(dept_code, 'D5','�߱�','D6','�߱�','D9','�߱�','�߱پ���') �߱�����
from employee order by dept_code;
       
select emp_name, dept_code,
    case
        when dept_code in ('D5','D6','D9') then '�߱�'
        else '�߱پ���'
    end
    as �߱�����
from employee
order by dept_code;

--�ǽ� 12
select emp_name, dept_code,
    decode(dept_code,'D5','�ѹ���','D6','��ȹ��','D9','������') �μ���1,
    case 
        when dept_code = 'D5' then '�ѹ���'
        when dept_code = 'D6' then '��ȹ��'
        when dept_code = 'D9' then '������'
    end �μ���2
from employee
where dept_code in ( 'D5', 'D6', 'D9')
order by dept_code;

--�ǽ� 13 emp_no �� day_date �� ����� ��¥�� �־ ������ ������. 
select emp_name, dept_code, to_date(to_number(substr(emp_no,1,6),'yy"��"mm"��"dd"��"'), (2025-(19||substr(emp_no,1,2))) ����
from employee;

 select emp_name, dept_code, to_char(to_date(substr(emp_no,1,6),'rrmmdd'),'yyyy"��" mm"��" dd"��"') �������, emp_no,
        extract(year from sysdate) - extract(year from to_date(substr(emp_no,1,6),'rrmmdd'))+1 ����
from employee
where emp_id not in (200,201,214);

-�ǽ� 14
select 
    sum(decode(extract(year from hire_date),1998,1,0)) "1998��",
    sum(decode(extract(year from hire_date),1999,1,0)) "1999��",
    sum(decode(extract(year from hire_date),2000,1,0)) "2000��",
    count(decode(extract(year from hire_date),2001,1)) "2001��",
    count(decode(extract(year from hire_date),2002,1)) "2002��",
    count(decode(extract(year from hire_date),2003,1)) "2003��",
    count(decode(extract(year from hire_date),2004,1)) "2004��",
    count(*) "��ü������"
from employee;