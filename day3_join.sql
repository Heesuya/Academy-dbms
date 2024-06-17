 --일반적인 컬럼과 그룹함수가 오면 오류가 나지만 group by 사용하면 합계를 가져온다
select 
    dept_code, sum(salary)
from employee
group by dept_code;

select 
    sum(salary)
from employee
where dept_code = 'D1';

--group by 기준으로 집계가 된다. 
select
   dept_code, decode(substr(emp_no,8,1),'1','남','2','여') 성별, sum(salary), floor(avg(salary)), count(*)
from employee
group by dept_code, decode(substr(emp_no,8,1),'1','남','2','여')
order by dept_code;

-- 평균급여가 300만원 이상인 각 부서별 평균 급여
-- 동작 순서 : from / where / group by / having / select / order by
-- where 과 having 은 다르다 
select dept_code, floor(avg(salary)) 평균
from employee
group by dept_code
having avg(salary) >= 3000000;


-- join 이후에는 표준 문법(어디에서든 사용하는)을 사용
select emp_name, dept_code from employee;
select * from department;

--1. 직원의 이름(employee), 부서코드(employee,department), 부서명(department)을 조회 
-- 오라클 전용문법 
select
    emp_name,
    dept_code,
    dept_title
from employee, department
where dept_code = dept_id;

--표준 구문(비교하려는 컬럼 이름이 다른경우)
select
    emp_name,
    dept_code,
    dept_title
from employee
join department on (dept_code = dept_id);

--2. 직원의 이름(employee), 직급코드(employee,job), 직급명(job)을 조회 
select emp_name, job_code from employee;
select * from job;
-- 오라클 구문
select
    emp_name, employee.job_code, job_name
from employee, job
where employee.job_code = job.job_code;
-- 표준구문(비교하려는 컬럼 이름이 같을 때)
select 
    emp_name,job_code, job_name
from employee
join job using (job_code);

------------------------------------------------------------------------
select * from employee;
select * from department;
select * from job;
--1. 회원의 이름(employee / emp_name), 부서명(department / dept_title) 조회
-- 비교하려는 컬럼 이름이 다른 경우
select
    emp_name, dept_title
from employee
join department on (dept_code = dept_id); --순서는 조인하는 순서대로 작성 

--2. 회원의 이름(employee emp_name), 직급명(job job_name) 조회
-- 조회(비교할려는 컬럼 이름이 같은 경우)
select
    emp_name, job_name
from employee
join job using (job_code);

select  --이런경우 존재하긴 하다. 
    emp_name, job_name, employee.job_code
from employee
join job on(employee.job_code = job.job_code);

-- select / (from / join) / where / group by / having / order by
select   -- 약어 설정해서 한다.  같은게 두개 일때는 무조건 구분을 해줘야 한다. 
    emp_name, job_name, e.job_code
from employee e
join job j on (e.job_code = j.job_code);
select * from department;

select distinct dept_code from employee order by 1;
select * from department;


-- inner join(내부조인) : 일반적인 join의 형태로 join조건에 일치하는 데이터가 없으면, 조회결과에서 제외
-- -> 하동운, 이오리 직원의 dept_code가 null이므로 join 조건에 일치하는 데이터가 없어서 조회에서 누락 
select
    emp_name, dept_id, dept_title
from employee join department on (dept_code=dept_id);

--left join(왼쪽외부조인) : join 조건에 일치하는 데이터가 없어도 join문 기준으로 먼저작성된 테이블의 데이터는 조회결과에 포함(null을 사용)
-- ->하동운, 이오리 직원의 dept_title이 null로 조회 
select
    emp_name, dept_code, dept_title
from employee left join department on (dept_code=dept_id);

-- right join(오른쪽외부조인) : join조건에 일치하는 데이터가 없어도 join문 기준으로 나중에 작성된 테이블의 데이터는 조회결과에 포함(null을 사용)
-- D7, D3, D4 부서에 속한 직원이 없지만 조회결과에 포함되어 있음(직원이름은 null로 처리)
select
    emp_name, dept_id, dept_title
from employee right join department on (dept_code=dept_id);


-- full join(완전외부조인) : left join과 right join을 합친 결과 
select
    emp_name, dept_id, dept_title
from employee full join department on (dept_code=dept_id);

-- cross join : 각 행들이 모두 매핑된 데이터가 검색되는 조인 
select
    emp_name, dept_code, dept_title
from employee
cross join department; -- 조건식이 없다. 다 곱한거 1:1로 전부다 매칭시킴 

-- self join : 1개의 테이블을 join하는 경우 -> 같은 테이블을 join을 하므로 인해서 모든 컬럼이 이름이 2개씩 중복 
-- -> 사용 시 모든 컬럼에 어느 테이블 소속인지를 명확히 구분만 하면 일반 조인과 동일 
-- 각 직원의 이름과 
select * from employee e1;
select * from employee e2;

select e1.emp_name, e2.emp_name
from employee e1  --직원용
left join employee e2 on (e1.manager_id = e2.emp_id); --매니저용

-- 다중 조인 
-- 직원의 이름(employee emp_name), 부서명(department dept_title), 직급명(job job_name)을 조회 
select
    emp_name, dept_title, job_name 
from employee
left join department on (dept_code = dept_id) --on 사용해도 됨, 테이블 명 구분만 잘해주면 된다. 
join job using (job_code); --컬럼 이름이 똑같으면 

select * from employee;
select * from department;
select * from location;
-- 직원의 이름(employee emp_name), 부서명(department dept_title), 근무지역명(location local_name)
select  -- 이와 같은 경우는 순서가 중요하다
    emp_name, dept_title, local_name
from employee
left join department on (dept_code = dept_id) 
left join location on (location_id = local_code);

-- 직원의 이름(employee emp_name), 근무지역명(location local_name)
select  -- employee와 location은 연관되지 않아서 department로 데이터 연결을 해야한다. 순서 중요!
    emp_name, local_name
from employee
left join department on (dept_code = dept_id) 
left join location on (location_id = local_code);

-- 실습 1  70년생, 여자, 성 = 전씨 
select
    emp_name 사원명, emp_no 주민번호, dept_title 부서명, job_name 직급명
from employee 
join department on (dept_code = dept_id)
join job using (job_code)
where emp_no like '7%-2%' and emp_name like '전%';
--where emp_name like '전%' and substr(emp_no,1,1) like 7 and substr(emp_no,8,1) like 2;

-- 실습 2 이름에 '형' 자가 들어가는 직원들의 사번, 사원명, 부서명
select
    emp_id, emp_name, dept_title
from employee
join department on (dept_code = dept_id)
where emp_name like '%형%';

-- 실습 3 해외 영업부에 근무하는 사원명, 직급명, 부서코드, 부서명 
select
    emp_name 사원명, job_name 직급명, job_code 부서코드, dept_title 부서명
from employee
left join department on (dept_code = dept_id)
left join job using (job_code)
where dept_title like '해외영업%';
--where substr(dept_title,1,2) like '해외';

-- 실습 4 보너스포인트를 받는 직원들의 사원명, 보너스포인트, 부서명, 근무지역명 
select
    emp_name 사원명, nvl(bonus,0) 보너스포인트, dept_title 부서명, local_name 근무지역명
from employee
left join department on (dept_code = dept_id)
left join LOCATION on (location_id = local_code)
where bonus not like 0;
--where bonus is not null;  --굳이 null 값을 바꾸지 않아도 됨 

-- 실습 5 부서코드 D2 인 직원들의 사원명, 직급명, 부서명, 근무지역명
select
    emp_name 사원명, job_name 직급명, dept_title 부서명, local_name 근무지역명
from employee
left join department on (dept_code = dept_id)
left join job using (job_code)
left join location on (location_id = local_code)
where dept_code = 'D2';

-- 실습 6 한국(KO) 과 일본(JP) 에 근무하는 직원들의 사원명, 부서명, 지역명, 국가명
select
    emp_name 사원명, dept_title 부서명, local_name 지역명, national_name 국가명 
from employee
left join department on (dept_code = dept_id)
left join location on (location_id = local_code)
left join national using (national_code)
where national_code in ('KO', 'JP');

--실습 7 같은 부서에 근무하는 직원들의 사원명, 부서명, 동료이름  (self join 사용) 
select
    e1.emp_name 사원명, dept_title 부서명, e2.emp_name 동료이름
from employee e1 
left join department on (e1.dept_code = dept_id)
join employee e2 using (dept_code)
where e1.emp_name not like e2.emp_name 
order by 1;

--실습 8 보너스포인트가 없는 직원들 중 -> 직급 : 차장, 사원 // 사원명, 직급명, 급여    join 과 in 사용 
select
    emp_name 사원명, job_name 직급명, salary 급여 
from employee
join job using (job_code)
where bonus is null and job_name in ('차장','사원');