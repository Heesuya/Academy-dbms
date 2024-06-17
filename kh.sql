select * from employee; 
select emp_name, email from employee;
select               -- 2. 조회하고 싶은 컬럼(모든컬럼을 조회할꺼면 * )
    emp_name, phone, email  
from                 -- 1. 조회하고 싶은 테이블
    employee;

select              --3. 조회하고 싶은 컬럼 
    *           
from                --1. 조회하고 싶은 테이블
    employee
where               --2. 조회하고 싶은 조건 
    emp_name = '송종기';
    
-- 오른쪽주석
/*
범위주석
*/
--1. job테이블에서 job_name컬럼 정보만 출력
select job_name from job;
--2. department테이블의 전체 내용을 출력
select * from department;
--3. employee 테이블에서 이름(emp_name), 이메일(email), 전화번호(phone), 고용일(hire_date) 출력
select emp_name, email, phone, hire_date from employee;
--4. employee 테이블에서 고용일(hire_date), 이름(emp_name), 월급(salary)을 출력
select hire_date, emp_name, salary from employee;
--5. employee 테이블에서 월급(salary)가 2500000원 이상인 사람의 이름(emp_name), 월급(salary) 출력
select emp_name, salary from employee where salary >= 2500000  ;
--6. employee 테이블에서 월급(salary)가 3500000원 이상이면서 job_code가 'J3'인 사람의 이름(emp_name), 전화번호(phone) 출력
select emp_name, phone from employee where job_code = 'J3' and salary >= 3500000;
--and, or

------------------------------------------------------------------------------
--select는 할때 산술연산이 가능. 원본데이터에 영향을 주지 않는다. 조회 결과에 계산결과를 포함시킬수 있다. 
select emp_name, salary, salary*12 from employee;

select emp_name, salary, salary+salary*bonus from employee;

select * from employee;
-- 조회 컬럼의 별칭 설정

select 
-- 가장 정석적인 방법 컬럼 (+) as (+) " "  // 컬럼 (+띄어쓰기) " " // " " 가 필요한 상황 : 컬럼 안에 특수문자가 들어있을때 
    emp_name as "이름", salary "급여", salary*12 "연봉(세금포함)", hire_date 입사일
from
    employee;
    
-- 리터럴
select
    emp_name, salary,'$' 단위  --없는 일반데이터도 컬럼인것처럼 값을 붙여줄수 있다. 
from
    employee;
    
-- distinct : 중복된 결과를 제외하고 보여줌 (조회된 모든 컬럼이 다 일치해야 함)
select distinct job_code from employee;

select distinct emp_name, job_code from employee; --조회되는 컬럼이 완벽히 똑같아야 사라진다.
-----------------------------------------------------------------------------
-- 연결연산자(||) : 데이터를 붙일 때(자바에서 문자열 +)
select emp_name || salary from employee; --erroe  mp_name+salary
select 
    emp_name, salary||'원'
from employee;

-- 논리연산자 : 여러개의 조건을 하나로 합칩 때 사용하는 연산자 (and, or, not)
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
    
    
-- between A and B : A이상, B이하 
-- 급여를 3500000원보다 많이 받고 6000000원보다 적게 받는 직원의 이름, 급여 조회 
-- 날짜 문자열 다 쓸수 있다. 
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
    
-- employee 테이블에서 입사날짜가 90/01/01 ~ 01/01/01 인 사원의 이름, 입사일 출력
select
    emp_name, hire_date
from
    employee
where
    hire_date between '90/01/01' and '01/01/01';
    
-- LIKE : 비교하려는 값이 특정 패턴을 만족시키면 true를 리턴
-- 성이 전씨인 직원의 모든정보 조회 
-- 이름 중 첫글자가 전으로 시작하는 이름 
-- 와일드카드 : 아무거나 들어와도 괜찮은 문자

-- _ : 한문자를 대체하는 와일드카드
-- % : 길이와 상관없이 대체하는 와일드카드 
select
    *
from    
    employee
where
-- _ : 현재 employee 에 저장된 이름이 3글자이기 때문에 3글자인 경우 가능// 4글자이면 적용이 안된다.
   -- emp_name like '전__';
-- % : 길이가 상관없이 다 포함이 된다.    
   -- emp_name like '전%';
-- 성이 전씨가 아닌 직원을 모두 조회 
    emp_name not like '전%';
    
-- 직원의 이메일 주소 중 '_' 앞자리가 3자리인 직원의 모든정보
select
    *
from 
    employee
where
-- escape #은 _ 가 아니야 
    email like '___#_%' escape '#';
    
select * from employee where emp_name like '__연' ; 
select * from employee where phone not like '010%';
select 
    * 
from 
    employee 
where 
    email like '%s%'
    -- 연산에도 우선순위가 있다. or 을 먼저 할 경우 괄호로 먼저 연산을 우선순위로 바꿔야 함. 
    and (dept_code = 'D9' or dept_code = 'D6')
    and hire_date between '90/01/01' and '00/12/01'
    and salary >= 2700000;

-- is null, is not null : null데이터는 데이터가 없음 의미 -> 산술연산, 비교연산 불가능
-- 조건에서 null을 조건으로 검색하고싶으면 null 전용 연산자를 사용
-- employee 테이블에서 보너스를 받는 직원의 이름, 급여, 보너스, 보너스금액
select emp_name, salary, bonus, salary*bonus
from employee
where bonus is not null;
-- employee 테이블에서 보너스를 받지않는 직원의 이름, 급여, 보너스, 보너스금액
select emp_name, salary, bonus, salary*bonus
from employee
where bonus is null;

-- in : 비교하려는 값 목록에 일치하는 값이 있으면 true리턴
-- dept_code코드가 D6이거나 D9이거나 D5인 부서원들의 이름, 부서코드, 급여조회 
select 
    emp_name, dept_code, salary
from 
    employee 
where
    dept_code in ('D6' , 'D9' , 'D5');
    -- dept_code = 'D6' or dept_code = 'D9' or dept_code = 'D5';
    -- not in
    
    
 -- order by : select한 컬럼에 대한 정렬을 할 때 사용하는 구문
 -- order by는 selcet문 가장 마지막에 작성하고, 가장 마지막에 실행 
 -- 사용법1 : order by 정렬하고싶은 컬럼 [asc|desc] [null순서결정]
 -- asc : 오름차순(작은수->큰수 / 사전순 / 빠른날->늦은날 / null 제일아래로) 생략하면 asc로 적용 
 -- desc : 내림차순(큰수->작은수 / 사전역순 / 늦은날->빠른날 / null 제일위로) 
select           --3. 조회컬럼
    emp_id, emp_name, salary, bonus
from             --1. 테이블
    employee
where            --2. 조건
    dept_code='D5'
order by bonus desc; --4. 정렬기준 

 -- 사용법2 : order by 조회된컬럼순서
select
    emp_name, salary, dept_code
from
    employee
where dept_code is not null
order by 2; -- 2번째 컬럼으로 정렬해줘~~ 

 -- 사용법3 : order by 별칭
select
    emp_name, salary 월급, dept_code
from
    employee
where dept_code is not null
order by 월급;

 -- 사용법4 : order by 컬럼1, 컬럼2 : 컬럼1로 정렬했을때 동일한 데이터면, 해당데이터는 컬럼2로 재정렬
select
    emp_name, salary 월급, dept_code
from
    employee
where dept_code is not null
order by 월급, emp_name;
