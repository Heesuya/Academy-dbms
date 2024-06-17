select
    student_no,
    student_name,
    department_name,
    student_ssn,
    student_address,
    entrance_date,
    professor_name,
    round( (select avg(point) from tb_grade g where g.student_no = s.student_no),1) point_avg
from tb_student s
left join tb_department using(department_no)
left join tb_professor on (coach_professor_no = professor_no);

--index생성방법 : create index 인덱스이름 on 테이블명(컬럼명,컬럼명..);
create index grade_student_no_idx on tb_grade(student_no);
drop index grade_student_no_idx;

select * from tb_grade;