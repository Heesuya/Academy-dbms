-- union(합집합) : 두 조회 결과를 합치면서 중복된 데이터를 제거하고, 첫번째 컬럼기준으로 정렬
select
    emp_id, emp_name, dept_code, salary
from employee
where dept_code = 'D5'

union

select
    emp_id, emp_name, dept_code, salary
from employee
where salary > 3000000;

-- union all(합집합) : 두 조회 결과를 합치면서 중복제거 하지않고, 정렬 하지않음 
select
    emp_id, emp_name, dept_code, salary
from employee
where dept_code = 'D5'

union all

select
    emp_id, emp_name, dept_code, salary
from employee
where salary > 3000000;


-- intersect(교집합) : 중복된 데이터만 출력 
select
    emp_id, emp_name, dept_code, salary
from employee
where dept_code = 'D5'

intersect

select
    emp_id, emp_name, dept_code, salary
from employee
where salary > 3000000;


-- minus(차집합) : 선행 select 결과에서 후행 select결과와 겹치지 않는 부분만 조회
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
-- union all, minus  :  순서가 중요함 
-- 통합 게시판(홈페이지에서 게시판이 여러개일때)을 쓸때 set operator을 쓴다. 


--------------------------------------------------------------------
-- 전 직원의 평균 급여보다 많은 급여를 받고있는 직원의 사번, 이름, 직급코드, 급여를 조회
-- 메인쿼리, 서브쿼리 (subquery)
-- 단일행 서브쿼리
select 
    emp_id, emp_name, job_code, salary
from
    employee
where
    salary > (select avg(salary) from employee); --메인보다 먼저 동작한다. 
    -- 데이터 타입 동일해야 한다. 

-- 전직원의 평균급여를 구하는 방법
select avg(salary) from employee;


--1. 단일 행 서브쿼리 : 서브쿼리의 조회 결과가 1행 1열 -> 단일값 (고정적으로 값이 하나 나올 때) 

-- 전 직원의 평균 급여보다 많은 급여를 받고있는 직원의 사번, 이름, 직급코드, 급여를 조회
-- -> 전직원의 평균급여 
select avg(salary) from employee;

select 
    emp_id, emp_name, job_code, salary
from
    employee
where
    salary > (select avg(salary) from employee);

--1. 윤은해와 급여가 같은 사원들을 검색해서, 사원번호,사원이름, 급여를 출력하라.
-- 단, 윤은해는 출력 되면 안됨
select 
    emp_id, emp_name, salary 
from employee
where salary = (select salary from employee where emp_name = '윤은해') and emp_name != '윤은해';

--2. employee 테이블에서 기본급여가 제일 많은 사람과 제일 적은 사람의 정보를
-- 사번, 사원명, 기본급여를 나타내세요.
select 
    emp_id, emp_name, salary
from employee
where salary in((select max(salary) from employee) ,(select min(salary) from employee)) ;

-- 3. D1, D2부서에 근무하는 사원들 중에서
-- 급여가 D5 부서 직원들의 '평균월급' 보다 많은 사람들만
-- 부서번호, 사원번호, 사원명, 월급을 나타내세요.
select 
    dept_code, emp_id, emp_name 
from 
    employee
where
    dept_code in ('D1','D2') and 
    salary > (select avg(salary) from employee where dept_code = 'D5');
    
    
-- 2. 다중 행 서브쿼리 : 서브쿼리 수행 결과가 1개컬럼, 여러개 row로 나오는 경우 
-- 부서별 최고 급여를 받는 직원의 이름, 직급코드, 부서코드, 급여를 조회 
select
    emp_name, job_code, dept_code, salary
from 
    employee
where 
    salary in (select max(salary) from employee group by dept_code);

-- 부서별 최고 급여 
--이 상태가 다중형 상태 
select max(salary) from employee group by dept_code;
    
    
-- 송종기 또는 박나라가 속한 부서에 근무하지 않는 사원 조회 
-- 일반 연산자는 사용하지 못하고, 여러개를 비교할수 있는 연산자를 사용한다. 
select *
from employee
where dept_code not in (select dept_code from employee where emp_name in ('송종기','박나라'));
select dept_code
from employee
where emp_name in ('송종기','박나라');

-- 직급이 대표, 부사장이 아닌 모든 사원의 이름,부서명,직급코드를 출력하세요.
select 
    emp_name, dept_title, job_code
from employee
join department on (dept_code=dept_id)
where job_code not in (select job_code from job where job_name in ('대표','부사장'));

select 
    emp_name, dept_code, job_code
from 
    employee
where job_code not in (select job_code from job where job_name in ('대표','부사장'));


-- any : 최소값보다 크면 or 최대값보다 작으면 
-- or 로 이어주겠다.  등호 쓸봐에 in 을 쓰지 
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

-- all : 최대값보다 크면 or 최소값보다 작으면 
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

-- 일치하는 값이 없기에 쓸수 없당.   -- 최소값이나 최대값을 구할때 any와 all 을 사용한다 이런연산자도 존재한다~
select emp_id, emp_name, salary
from employee
where salary = all(2000000,6000000);

-- 3. 다중열 서브쿼리  : 서브쿼리 조회결과가 1행 n열인 경우 
-- 퇴사한 여직원과 같은부서, 같은 직급에 해당하는 사원의 이름, 직급코드, 부서코드를 조회
select dept_code, job_code from employee where ent_yn='Y';

select * from employee;
select
    emp_name, job_code, dept_code
from employee
-- 한세트를 괄호로 묶어준다. 
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
-- 한세트를 괄호로 묶어준다. 
where (dept_code, job_code) in (select dept_code, job_code from employee where ent_yn='Y');


-- 4. 다중행 다중열 서브쿼리 : 서브쿼리 수행 결과가 m행 n열인 경우 
-- 직급별 최소 급여를 받는 직원의 사번, 이름, 직급코드, 급여
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

-- 직급별 최소급여 조회
select job_code, min(salary) from employee group by job_code;


-- 5. 상관쿼리(상호연관서브쿼리) : 메인쿼리와 서브쿼리가 서로 연관되어있는 쿼리 
--                           -> 서브쿼리가 실행될때 메인쿼리의 데이터를 가지고 실행하는 구조 
-- 관리자가 있는 사원들의 사번, 이름, 부서코드, 관리자번호 조회 

 select
    emp_id, emp_name, dept_code, manager_id
from
    employee e1
where 
exists
(select emp_id from employee e2 where e2.emp_id = e1.manager_id);

select * from employee;

-- 연산자 exists(서브쿼리) : 서브쿼리 수행결과가 1개라도 있으면 true/false  


-- 6. 스칼라서브쿼리 : 상호연관서브쿼리이면서, 단일행 서브쿼리인 것 
-- 스칼라서브쿼리의 SELECT절 사용                           --join을 대체 할수 있다
-- 모든사원의 사번, 이름, 관리자사번, 관리자 이름 

    
--좋아요 기능 ?????????????????????????????????????????????????????????????????????????
select
    emp_id,
    emp_name,
    manager_id,
    nvl((select emp_name from employee e2 where e2.emp_id = e1.manager_id), '관리자없음') as 관리자이름
from
    employee e1;
    
-- 스칼라서브커리의 WHERE절 사용
-- 자신이 속한 직급의 평균 급여보다 많이받는 직원의 이름, 직급, 급여 

select
    emp_name, job_code, salary
from
    employee e1
where
    salary >= (select avg(salary) from employee e2 where e2.job_code = e1.job_code);
    
    
-- 스칼라서브쿼리 order by 절 사용
-- 직원의 사번, 이름, 부서코드를 부서명 기준으로 내림차순 정렬
select
    emp_id, emp_name, dept_code
from employee
order by 
(select dept_title from department where dept_id = dept_code)
--(select dept_title from department d where d.dept_id = e.dept_code)
desc nulls last;

 select * from department order by dept_title desc;
 
 
-- 서브쿼리를 from 절에 사용할 때(인라인 view)
-- view : 가상의 테이블 
-- TOP-N분석 : 컬럼에서 가장 큰값 기준으로 몇개만 데이터를 가져올 때     -- 블로그 게시판 전체가 안나오고 페이지 별로 나올때 --sns 안읽으면 몇개씩 불러오는거 


select *
from (select emp_name, salary from employee);

-- 직원들 중 급여를 가장 많이받는 5명은 조회 
select emp_name, salary from employee order by salary desc;

-- rownum : 조회결과에 순서대로 인덱스를 붙이는 역할            --컬럼처럼 쓰는게 아님
-- 이대로 작성하면 rownum이 붙은 후에 정렬이 발생 -> 왜? order by가 가장 마지막에 동작하니까 
select rownum, emp_name, salary from employee  where rownum <= 5 order by salary desc;
-- 정렬을 먼저하고 가상의 테이블 상태로 사용하고 조건을 넣는다. --select 동작 순위가 중요하다 
select rownum, emp_name, salary from (select emp_name, salary from employee order by salary desc) where rownum <= 5 ;
--6~10위
select *
from
(select rownum as rnum, emp_name, salary
from (select emp_name, salary from employee order by salary desc)) 
where rnum between 6 and 10;
--where rnum >= 6 and rnum <= 10;

