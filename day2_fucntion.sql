-- 단일행 함수 : 각 행마다 반복적으로 적용되어 입력받은 행의 수만큼 결과를 반환

-- 문자 처리 함수 

-- length(param) : 매개변수로 전달된 문자의 길이를 반환 
select
    emp_name, length(emp_name) 이름길이, email, length(email) 이메일길이 
from employee;

-- lengthb(param) : 매개변수로 전달된 문자의 길이(byte)를 반환 
select
    emp_name, lengthb(emp_name) 이름길이, email, lengthb(email) 이메일길이 
from employee;
    
-- instr(param1, param2, [param3], [param4]) : param1문자열에서 param2의 위치를 찾아서 되돌려주는 함수 
-- param1 : 원본문자열
-- param2 : 찾고싶은문자
-- param3 : 원본문자열 중 문자를 찾을 시작 글자번호(param3을 음수로 주게되면 뒤부터 찾음)
-- param4 : 검색된 문자 순서
select instr('Hello World Hi High', 'H') from dual;
select instr('Hello World Hi High', 'H', 2) from dual;
select instr('Hello World Hi High', 'H', 2, 2) from dual;
select instr('Hello World Hi High', 'H', -1, 1) from dual;
select instr('Hello World Hi High', 'H', -5, 1) from dual;

select email, instr(email, '@', 1, 1) from employee; --필요한걸 찾아서 쓸수 있다 


-- LPAD / RPAD
-- LPAD(param1, param2, [param3]) : param1문자열을 param2길이만큼 강제로 지정
-- 지정된 길이가 원본문자열보다 길면 왼쪽에 공백을 넣어서 길이를 맞춤
-- 지정된 길이보다 원본문자열이 짧으면 지정된 길이만큼 사용하고 문자열을 잘라냄 
-- param1 : 대상 문자열
-- param2 : 길이 
-- param3 : 지정된길이보다 원본문자열이 짧아서 길이를 늘릴때 공백대신 채울 문자를 지정 
-- RPAD는 LPAD와 동일한 함수지만 오른쪽에 동작 
select lpad('abc', 2), lpad('abc', 5, '$'), rpad('abc', 2), rpad('abc', 5, '$') from dual;

select email, lpad(email,20,'#'), rpad(email,20,'#'), lpad(email,10,'#'), rpad(email,10,'#')
from employee;

-- LTRIM/RTRIM
-- LTRIM(param1, [param2]) : param1의 문자열의 왼쪽에서 param2에 포함된 모든문자를 제거한 나머지를 반환 
--                         : 이때 param2를 생략하면 ' '공백으로 처리
select '   KH', ltrim('   KH') from dual;
select '###KH', ltrim('###KH', '#') from dual;
select ltrim('000123456', '0') from dual;
select ltrim('123321456', '123') from dual; -- 1 or 2 or 3 이야 123의 순서가 아니다 
select rtrim('000123456000', '0') from dual;
select rtrim('123321456123321', '123') from dual;

-- trim(param1) : 주어진 param1의 앞/뒤/양쪽에 있는 지정한 문자를 제거한 나머지를 반환
-- trim(char from param1)
-- trim(방향 char from param1)
-- trim은 제거하는 문자가 반드시 1글자!!
select rtrim(ltrim('   KH   ', ' '),' ') from dual;
select trim('   KH   ')from dual; --문자열기준으로 양쪽에서 공배(' ')을 제거
select trim('#' from '###KH###') from dual;
select trim(leading '#' from '###KH###') from dual;
select trim(trailing '#' from '###KH###') from dual;
select trim(both '#' from '###KH###') from dual;

-- 문제1
select rtrim('Hello KH Java', 'Jav') from dual;

-- 문제2
select ltrim('Hello KH Java' ,'Helo ') from dual;

-- 문제3
select trim (trailing '부' from dept_title) from department;

-- 문제4
select rtrim(ltrim('982341678934509hello89798739273402', '0123456789'),'0123456789') from dual;


-- substr(param1, param2, [param3]) : param1문자열에서 param2부터 param3갯수만큼 문자열을 잘라서 리턴 
--                                  : param3을 생략하면 끝까지 잘라서 리턴 

select substr('show me the money', 3, 5) from dual;
select substr('show me the money', 5) from dual;
select substr('show me the money', 5, 3) from dual;
select substr('show me the money', -5, 3) from dual; -- 음수 방향의 지시

-- 사원 이름 중 성 / 이름 분리 
select substr(emp_name, 1, 1), substr(emp_name, 2) from employee;

-- LOWER/UPPER/INITCAP
select lower('SHow mE tHE moNEy') from dual;        --전부 소문자로 변환
select upper('SHow mE tHE moNEy') from dual;        --전부 대문자로 변환
select initcap('SHow mE tHE moNEy') from dual;      --각 단어별 첫글자만 대문자로 변환

-- concat(param1, param2) :  param1과 param2를 합쳐서 하나의 문자열로 리턴 
select concat('가나다라', 'ABDC') from dual;
select '가나다라'||'ABCD'||'1234' from dual; --연결연산자를 사용하는게 더 편리하다

-- replace(param1, param2, param3) : param1문자열에서 param2문자열을 찾아서 param3문자열로 변환해서 리턴
select replace('show me the money', 'me', 'you') from dual; 
select replace('show me the money', 'm', 'a') from dual; --찾아서 싹다 바꿔준다

select emp_name, emp_no, replace(email, 'kh.or', 'iei.co') from employee;

-- 숫자 처리 함수 

-- ABS(param1) : 매개변수로 전달한 수의 절대값을 리턴 
select abs(10), abs(-10) from dual;

-- mod(param1, param2) : param1%param2
select mod(10, 3), mod(10, 2), mod(10,4) from dual;

-- round(param1, [param2]) : param1로 받은 숫자를 param2자리까지 표현하도록 반올림 
select round(126.456) from dual;
select round(126.456,3) from dual; --보여줘
select round(126.4562,2) from dual;
select round(126.4562,0) from dual;
select round(126.4562,-1) from dual;
select round(126.4562,-2) from dual;

--floor(param1) : 소수점 자리수를 버림
select floor(126.456) from dual;

--trunc(param1, param2) : param1의 소수점 중 param2자리수 이후를 버림 
select trunc(126.4562,1) from dual;
select trunc(126.4562,2) from dual;
select trunc(126.4562,-2) from dual;

-- ceil(param1) : 소수점 자리수를 올림
select ceil(126.456) from dual;

-- 날짜처리 함수 
-- sysdate : 시스템에 저장되어있는 현재 날짜를 반환하는 함수 
select
    sysdate, current_date, localtimestamp, current_timestamp from dual;
    
-- months_between(param1, param2) : param1과 param2 두 날짜 사이의 개월수를 리턴(숫자)
select emp_name, hire_date, months_between(sysdate, hire_date) from employee;

-- add_months(param1, param2) : param1날짜에 param2개월수를 더한 날짜를 리턴 
select emp_name, hire_date, add_months(hire_date,3) from employee;

-- next_day(param1, param2) : param1날짜를 기준으로, 가장 가까운 param2요일을 해당하는 날짜를 리턴 
-- 요일을 숫자 1=일요일 ~ 7=토요일
select sysdate, next_day(sysdate, '월요일') from dual;
select sysdate, next_day(sysdate, 2) from dual;
select sysdate, next_day(sysdate, '화요일') from dual;
select sysdate, next_day(sysdate, '수요일') from dual;
select sysdate, next_day(sysdate, '목요일') from dual;


-- last_day(param1) : param1로 받은 날짜가 속한 달의 가장 마지막날짜를 구해서 리턴 
select emp_name, hire_date, last_day(hire_date), last_day(sysdate), add_months(sysdate,1) from employee; -- 업무에 따라 결산해야하는 회사가 있어서 중요함

-- extract : 날짜데이터에서 년도, 월, 일 정보를 각각 추출 리턴(추출된 데이터는 숫자)
-- extract(year from param1) : param1 날짜에서 년도만 추출 
-- extract(month from param1) : param1 날짜에서 달만 추출 
-- extract(day from param1) : param1 날짜에서 요일만 추출 
select sysdate, extract(year from sysdate), extract(month from sysdate), extract(day from sysdate) from dual;

-- 날짜 타입에서만 추출이 가능함 
select emp_name, extract(year from hire_date), extract(month from hire_date), extract(day from hire_date) from employee;

---------------
-- 형 변환 함수
-- to_char : 날짜데이터 or 숫자데이터를 문자형식으로 변환하는 함수 
-- to_char(날짜,[format])
select to_char(sysdate),to_char(sysdate, 'yyyy-mm-dd'), sysdate from dual;
select to_char(sysdate, 'yyyy-mm-dd') from dual;
select to_char(sysdate, 'yyyy/mm/dd') from dual;
select to_char(sysdate, 'yyyy/mm/dd/day') from dual;
select to_char(sysdate, 'yyyy/month/dd/day') from dual;
-- 오전 오후 24시 표기법 다 가능
select to_char(sysdate, 'yyyy/month/dd/day pm hh24:mi:ss') from dual;
select to_char(sysdate, 'yyyy/month/dd/day  hh24"시"mi"분"ss"초"') from dual;
select to_char(sysdate, 'day') from dual;

select emp_name, to_char(hire_date, 'yyyy-mm-dd day') from employee;

-- to_char(숫자,[format])
select 
    500000,
    to_char(500000, '999,999'),     --정상변환
    to_char(500000, '000,000'),     --정상변환
    to_char(500000, '9,999,999'),   --정상변환
    to_char(500000, '0,000,000'),   --정상변환(남는 형식을 0으로 채움)
    to_char(500000, '99,999'),      --자리수 모자라면 정상변환이 불가능
    to_char(500000, '00,000') ,     --자리수 모자라면 정상변환이 불가능
    to_char(500000, 'L999,999')     --로컬 통화로 표시(현지 단위)
    from dual;

-- to_date(문자 or 숫자, format)
select to_char(to_date(20240531, 'yyyymmdd'),'yyyy-mm-dd hh24:mi:ss'), to_date('2024-05-31', 'yyyy-mm-dd') from dual;

-- to_number(문자, [format])
select to_number('1,000,000','9,999,999') from dual;

select to_number('100a') from dual; --숫자로 변환할 수 없는 데이터는 에러가 발생 

-- 100+1000 = 1100
-- '1000' || '100' = 1000100
-- 오라클에서 +연산을 하면 무조건 산술연산 -> 숫자가 아닌데이터를 + 연산할려고하면? 자동으로 숫자로 형변환
select '1000'+'100a' from dual;     --error
select '1000'+'100' from dual;

-- 아.. 피곤해... 

-- 기타함수 

-- nvl(param1, param2) : param1데이터가 null이면 param2로 대체해서 리턴 / null이 아니면 param1을 리턴

-- 데이터 타입을 맞춰야 한다. 
select
    emp_name, dept_code, nvl(dept_code,'부서없음'),salary, bonus, nvl(bonus,0), salary+salary*nvl(bonus, 0)
from
    employee;
    
-- decode - 선택함수 : 여러가지 경우에 선택을 할 수 있는 기능을 제공(일치)
-- decode(표현식,조건1,결과1,조건2,결과2,조건3,조건3,......,조건에해당되는거 없으면)
-- switch랑 비슷함
select * from employee;
select emp_name, decode(substr(emp_no,8,1),'1','남자','2','여자','3','남자','4','여자','여기가default') from employee ;

-- case - 선택함수 : 여러가지 경우에 선택을 할 수 있는 기능을 제공(범위값도 가능)
-- if ~ else 랑 비슷함
/*
    case 
        when 조건1 then 결과1 
        when 조건2 then 결과2 
        when 조건3 then 결과3           
        else 나머지결과
    end
    as 별칭
*/

select
    emp_name, 
    case 
        when substr(emp_no,8,1) in ('1','3') then '남자'
        when substr(emp_no,8,1) = '2' or substr(emp_no,8,1) = '4' then '여자'
        else '여기가 기본값'
    end
    as 성별 
from
    employee;
    
---------------------------   
-- 그룹함수 : 하나이상의 행을 그룹으로 묶어서 연산 함수 총합, 평균 등을 구하는 함수 

-- sum(컬럼) : 해당 컬럼의 총 합을 구하는 함수 
-- 일반 컬럼과 같이 사용할수 없다. 갯수가 다름.
select 
    sum(salary) 
from employee 
where dept_code='D9'; --3명으로 줄여놓고 3명의 총합이 나온다. 

-- avg(컬럼) : 해당 컬러의 평균을 구하는 함수 
select avg(salary) from employee;
select avg(bonus) from employee; --null은 그룹함수 연산에서 제외 
select avg(nvl(bonus,0)) from employee;--null을 그룹함수 연산에 포함시키려면 nvl을 적용
select bonus from employee;

-- count(컬럼) : 조회 조건을 만족하는 행의 갯수를 리턴
select count(dept_code) from employee;
select count(*) from employee;

-- max(컬럼), min(컬럼) : 주어진 컬럼 중 최대/최소값을 구하여 리턴 
select max(salary) from employee;
select min(salary) from employee;
select sum(salary), avg(bonus), count(*), max(salary), min(salary) from employee;

select * from employee;
--실습 1
select emp_name 직원명, email 이메일, length(email) 이메일길이 
from employee;

--실습 2
select emp_name,substr(emp_no,1,2) 년, substr(email,1, instr(email, '@')-1) 이메일아이디 from employee;

--실습 3
select emp_name 직원명 , substr(emp_no,1,2) 년생, nvl(bonus,0) 보너스 from employee
where  emp_no like '6%' ;
--where substr(emp_no,1,1) = '6';   첫자리만 나오게 해도 된당~

--실습 4
select count(*)||'명' 인원 from employee where phone not like '010%';


--실습 5
select emp_name 직원명, extract(year from hire_date)||'년 '||extract(month from hire_date)||'월' 입사년월1,
to_char(hire_date, 'yyyy"년"mm"월"') 입사년월2  --'fmyyyy"년"mm"월"' --앞에 월의 1,2자리로 나옴
from employee;

--실습 6
select emp_name, rpad(substr(emp_no,1,8),14,'*') 주민번호, 
       substr(emp_no,1,8)||'******' 주민번호2 
from employee;

--실습 7
select emp_name 직원명, job_code,  to_char((salary*12) + (salary*nvl(bonus,0)*12), 'L999,999,999') 연봉 
from employee;

--실습 8 
select emp_id, emp_name 사원명, dept_code, hire_date from employee where hire_date like '04%';
select emp_id, emp_name 사원명, dept_code, hire_date
from employee
where
    extract(year from hire_date) = 2004
    and
    dept_code in ('D5','D9');  -- ==  (dept_code = 'D5' or dept_code = 'D9') 


--실습 9 
select emp_name 직원명, hire_date 입사일 , floor(nvl(ent_date,sysdate) - hire_date) 근무일수 from employee;

select emp_name, hire_date,floor(sysdate-hire_date)
from employee;

--실습 10
select max(2025 - (19||substr(emp_no,1,2))) "최대 나이", min(2025 - (19||substr(emp_no,1,2))) "최소 나이" from employee;

--rr 옵션 : 년도 2자리일때 쓰는 옵션 50 기준으로 년도 계산함. 
select
    max(extract(year from sysdate) - extract(year from to_date(substr(emp_no,1,2),'rr'))+1) as "최대 나이",
    min(extract(year from sysdate) - extract(year from to_date(substr(emp_no,1,2),'rr'))+1) as "최소 나이" 
from employee;

--실습 11
select emp_name, dept_code,
       decode(dept_code, 'D5','야근','D6','야근','D9','야근','야근없음') 야근유무
from employee order by dept_code;
       
select emp_name, dept_code,
    case
        when dept_code in ('D5','D6','D9') then '야근'
        else '야근없음'
    end
    as 야근유무
from employee
order by dept_code;

--실습 12
select emp_name, dept_code,
    decode(dept_code,'D5','총무부','D6','기획부','D9','영업부') 부서명1,
    case 
        when dept_code = 'D5' then '총무부'
        when dept_code = 'D6' then '기획부'
        when dept_code = 'D9' then '영업부'
    end 부서명2
from employee
where dept_code in ( 'D5', 'D6', 'D9')
order by dept_code;

--실습 13 emp_no 에 day_date 를 벗어나는 날짜가 있어서 오류가 났었다. 
select emp_name, dept_code, to_date(to_number(substr(emp_no,1,6),'yy"년"mm"월"dd"일"'), (2025-(19||substr(emp_no,1,2))) 나이
from employee;

 select emp_name, dept_code, to_char(to_date(substr(emp_no,1,6),'rrmmdd'),'yyyy"년" mm"월" dd"일"') 생년월일, emp_no,
        extract(year from sysdate) - extract(year from to_date(substr(emp_no,1,6),'rrmmdd'))+1 나이
from employee
where emp_id not in (200,201,214);

-실습 14
select 
    sum(decode(extract(year from hire_date),1998,1,0)) "1998년",
    sum(decode(extract(year from hire_date),1999,1,0)) "1999년",
    sum(decode(extract(year from hire_date),2000,1,0)) "2000년",
    count(decode(extract(year from hire_date),2001,1)) "2001년",
    count(decode(extract(year from hire_date),2002,1)) "2002년",
    count(decode(extract(year from hire_date),2003,1)) "2003년",
    count(decode(extract(year from hire_date),2004,1)) "2004년",
    count(*) "전체직원수"
from employee;