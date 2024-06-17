commit;
select * from tb_department;
select * from tb_student;
select * from tb_class;
select * from tb_class_professor; 
select * from tb_professor;
select * from tb_grade;

--Basic select
-- 1
select department_name as "�а� ��", category �迭 from tb_department;
-- 2
select department_name||'�� ������ '||capacity||'�� �Դϴ�.' as "�а��� ����" from tb_department;
-- 3
select student_name from tb_student where student_no in ('A513079','A513090','A513091','A513110','A513119');
--4
select department_name, category from tb_department where capacity between 20 and 30;
--5
select professor_name 
from tb_professor
where department_no is null;
--6
select class_no
from tb_class
where preattending_class_no is not null;
--7
select category
from tb_department
intersect
select category
from tb_department;

--function
--1
select student_no �й�, student_name �̸�, entrance_date �й� from tb_student where department_no =002
order by entrance_date;

--2
select professor_name, professor_ssn from TB_PROFESSOR where length(professor_name)!=3; 
--3 
select professor_name, 
case 
    when substr(professor_ssn,1) in 4
    then
    extract(year from sysdate) - 19||(substr(professor_ssn,1,2))+1
    else 
    extract(year from sysdate) - extract(year from to_date(substr(professor_ssn,1,6),'rrmmdd'))+1
    end
    as ����
from tb_professor
where professor_ssn like '%-1%';

select professor_name, extract(year from sysdate) - (19||substr(professor_ssn,1,2))+1 as ����
from tb_professor
where professor_ssn like '%-1%'
order by 2;

--4
select substr(professor_name,2)
from tb_professor;

--5
select student_no, student_name
from tb_student
where (extract(year from ENTRANCE_DATE) - extract(year from to_date(substr(STUDENT_SSN,1,6),'rrmmdd'))+1) > 20
order by 1; 

--6 
select to_char(to_date('2020-12-25','yyyy-mm-dd'), 'day') as "����" from dual;

--7
select student_no, student_name
from tb_student
where student_no not like 'A%';

--8
select student_no, student_name, student_ssn
from tb_student
where STUDENT_ADDRESS like '%����%'
    and
    absence_yn like 'N'
    and
    entrance_date like '02%';
    
--9
select round(avg(nvl(point,0)),1) ���� 
from tb_grade
where student_no = 'A517178';

--10
select department_no �а���ȣ, count(department_no) �ο���
from tb_student 
group by department_no
order by 1;

--11
select 
    count(nvl(coach_professor_no,1)) as "�л� ��"
from tb_student
where coach_professor_no is null;


--12
select substr(term_no,1,4) �⵵, avg(point) as "�⵵ �� ����"
from tb_grade
where student_no = 'A112113' 
group by substr(term_no,1,4);

--13
select department_no �а��ڵ��, count(department_no) as "���л� ��"
from tb_student
where ABSENCE_YN like 'Y'
group by department_no
order by 1;


--14
select student_name, count(student_name)
from tb_student s1
join tb_student s2 using (student_name)
where s1.student_address != s2.student_address
group by student_name;

--additional select
--1
select student_name, student_address
from TB_STUDENT;


select *
from TB_STUDENT;
--2 
select student_name, student_ssn
from tb_student
where ABSENCE_YN like 'Y'
order by 2 desc;

--3
select student_name, student_no, student_address
from tb_student
where extract(year from entrance_date) between '1990'and '1999'
    and student_address like '��⵵%'
    order by 1;
    
--4 
select professor_name, professor_ssn
from tb_professor
join tb_department using (department_no)
where department_name like '���а�'
order by 1 desc;

--5
select student_no, point
from TB_GRADE
where term_no = 200402 and class_no like 'C3118100'
order by 2 desc,1;

--6
select student_no, student_name, department_name
from tb_student
join tb_department using (department_no)
order by 2 ;

--7
select class_name, department_name
from tb_class 
join tb_department using (department_no);

--8 
select class_name, professor_name
from tb_class
join tb_class_professor using (class_no)
join TB_PROFESSOR using (professor_no);

--9 
select class_name, professor_name
from tb_class c1
join tb_class_professor using (class_no)
join TB_PROFESSOR using (professor_no)
join tb_department d1 on (c1.department_no = d1.department_no) 
where d1.CATEGORY like '�ι���ȸ' ;--and professor_name is not null;

--10

-- department_no   = 059
select
    student_no, s1.student_name, avg(point)
from TB_STUDENT s1
left join tb_department d1 on (s1.department_no, d1.department_no)
left join tb_grade using (student_no) 
where d1.departmetn_name like '�����а�'
group by student_no, s1.student_name;

select
    student_no, s1.student_name, round(avg(point),1)
from TB_STUDENT s1
left join tb_department using (department_no)
left join tb_grade using (student_no) 
where department_name like '�����а�'
group by student_no, s1.student_name
order by 2;

--11    coach_proessor_no p034      department_no 008
select 
    department_name, student_name, professor_name
from 
    tb_department
join tb_student using (department_no)
join tb_professor on (coach_professor_no = professor_no)
where student_no = 'A313047';

--12
select
    student_name, term_no
from tb_student
join tb_grade using (student_no)
join tb_class using (class_no)
where class_name like '�ΰ������' and term_no like '2007%';

--13
select
    class_name, department_name
from tb_department
left join tb_class using (department_no)
left join tb_class_professor using (class_no)
left join tb_professor using (professor_no)
where category like '��ü��' and professor_no is null;


--14
select
    student_name �л��̸�, nvl(professor_name, '�������� ������') ��������
from tb_student s1
left join tb_professor on (coach_professor_no = professor_no)
join tb_department d1 on (s1.department_no = d1.department_no)
where department_name like '���ݾƾ��а�';

select * from tb_student;
select * from tb_class;
select * from tb_grade;

--15
select
    s1.student_no �й�, student_name �̸�, department_name �а��̸�, avg(point) ����
from tb_student s1
join tb_department using (department_no)
join tb_grade g1 on (s1.student_no = g1.student_no)
where absence_yn = 'N' 
group by s1.student_no, student_name, department_name 
having avg(point) >= 4.0 ;

--16
select
    class_no, class_name, department_name, avg(point) ����
from tb_student s1
join tb_department using(department_no)
join tb_grade g1 on (s1.student_no = g1.student_no)
join tb_class using (class_no)
where department_name like 'ȯ�������а�' and class_type like '����%'
group by class_no, class_name, department_name; 


--17
select 
    student_name, student_address
from tb_student
where department_no = (select department_no
from tb_student
where student_name like '�ְ���');

--18
select 
    student_no, student_name
from tb_student
where student_no  =
(
select
    student_no
from 
(
select 
    rownum, student_no, ���
from 
(
select 
    student_no, avg(point) ���
from tb_grade
join tb_class using (class_no)
join tb_department using (department_no) 
where department_name like '������а�'
group by student_no
order by ��� desc
)
where rownum = 1
)
)
;


select 
    rownum, student_no, ���
from 
(
select 
    student_no, avg(point) ���
from tb_grade
join tb_class using (class_no)
join tb_department using (department_no) 
where department_name like '������а�'
group by student_no
order by ��� desc
)
where rownum = 1;






select 
    student_no, avg(point) ���
from tb_grade
join tb_class using (class_no)
join tb_department using (department_no) 
where department_name like '������а�'
group by student_no
order by ��� desc;



select
    class_no as "�迭 �а���" , avg(point)
from tb_grade 
join 
(
select
    class_no
from tb_department
join tb_class using (department_no)
where department_name like 'ȯ�������а�'
)
using (class_no)
group by class_no;



select
    student_no, department_name, class_name
from tb_student s1
join tb_department d1 on (s1.department_no = d1.department_no)
join tb_class c1 on (d1.department_no = c1.department_no)
where department_name like 'ȯ�������а�';

-- 19
select
    department_name, round(avg(point),1)
from 
    tb_department
join tb_class using (department_no)
join tb_grade using (class_no)
where category =
(select category from tb_department where department_name like 'ȯ�������а�')
group by department_name
;


