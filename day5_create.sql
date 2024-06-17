-- create : 객체 생성하는 구문
-- 테이블 생성 구문 
/*
create table 테이블이름 (컬럼이름    자료형(크기), 컬럼이름 자료형(크기), 컬럼이름 자료형(크기)...)
create table 테이블이름 (
    컬럼이름    자료형(크기),
    컬럼이름    자료형(크기),
    컬럼이름    자료형(크기),
    ....
    컬럼이름    자료형(크기)
);
테이블 이름 : 영어 대/소문자 구분이 없음 ->  단어와 단어가 조합될때 _ 를 사용 -> 스네이크 표기법
컬럼 이름 : 영어 대/소문자 구분이 없음 -> 단어와 단어가 조합될때 _ 를 사용
자료형 : 해당 컬럼에 저장할 데이터르르 기준으로 저장가능한 길이
*/
-- 회원 정보를 저장할 테이블을 생성 
-- 테이블이름 : member_tbl
/*
-- 자료형 : char, varchar2, number, date
저장 할 회원 정보 목록 
아이디        varchar2        길이 30    member_id
이름          varchar2        길이 21    member_name
비밀번호       varchar2        길이 30    member_password      -- 현업에서는 암호화 함으로 char 타입으로 길이 똑같게 함.
생년월일       char            길이 10    member_birth    ex. 19990605/1999-06-05
별명          varchar2        길이 30     member_nickname
주소          varchar2        길이 300    member_address        --베이터베이스 규모가 커지면 앞에 해당하는속성 넣고 줄임말 잘 안씀. 
*/

drop table memeber_tbl;

create table member_tbl (
    member_id       varchar2(30),       --회원아이디
    member_name     varchar2(21),       --회원이름
    member_password varchar2(30),       --회원비밀번호
    member_birth    char(10),           --회원생년월일
    member_nickname varchar2(30),       --회원별명
    member_address  varchar2(300)       --회원주소
);

select * from member_tbl;

-- 테이블 컬럼에 주석을 작성하는 방법 
comment on column member_tbl.member_id is '회원아이디';
comment on column member_tbl.member_name is '회원이름';
comment on column member_tbl.member_password is '회원비밀번호';
comment on column member_tbl.member_birth is '회원생년월일';
comment on column member_tbl.member_nickname is '회원별명';
comment on column member_tbl.member_address is '회원주소';

insert into member_tbl values ('user01','유저1','1111','2000-01-01','윤구름','서울특별시 중구');
insert into member_tbl values ('user02','유저2','2222','1998-11-01','윤깜냥','인천 중구');
insert into member_tbl values ('user01','유저3','3333','1995-01-23','중복','서울시 양천구 목동');



create table user_tbl(
    user_no     number,             --회원번호
    user_id     varchar2(20),       --회원아이디
    user_pw     varchar2(30),       --회원비밀번호
    user_name   varchar2(30),       --회원이름
    gender      char(6),            --성별
    phone       char(11)            --전화번호
);

insert into user_tbl values(1,'user01','1111','유저1','여자','01011111111');
insert into user_tbl values(null,null,null,null,null,null);
select * from user_tbl;

--컬럼레벨에서 제약조건을 설정한다. 
create table user_tbl_notnull(
    user_no     number          not null,             --회원번호
    user_id     varchar2(20)    not null,       --회원아이디
    user_pw     varchar2(30)    not null,       --회원비밀번호
    user_name   varchar2(30),       --회원이름
    gender      char(6),            --성별
    phone       char(11)            --전화번호
);

select * from user_tbl_notnull;
insert into user_tbl_notnull values(1,'user01','1111','유저1','여자','01011111111');
insert into user_tbl_notnull values(2,'user02','2222',null,null,null);
insert into user_tbl_notnull values(3,'user03','3333','유저3','남자','01033333333');
insert into user_tbl_notnull values(4,'user03','4444','유저4','남자','01044444444');



--컬럼레벨에서 제약조건을 설정한다. 
create table user_tbl_unique(
    user_no     number  unique,             --회원번호
    user_id     varchar2(20)    unique,       --회원아이디
    user_pw     varchar2(30),       --회원비밀번호
    user_name   varchar2(30),       --회원이름
    gender      char(6),            --성별
    phone       char(11)    unique            --전화번호
);

insert into user_tbl_unique values(1,'user01','1111','유저1','남자','01011111111');
insert into user_tbl_unique values(2,'user02','2222','유저2','여자','01022222222');
insert into user_tbl_unique values(3,'user03','3333','유저3','남자','01011111112');
insert into user_tbl_unique values(4,'user04','4444','유저4','여자','01044444444');
insert into user_tbl_unique values(5,'user05','5555','유저5','여자',null);
insert into user_tbl_unique values(6,'user06','6666','유저6','남자',null);  --null은 데이터가 아님
select * from user_tbl_unique;


--테이블에서 제약조건 설정
create table user_tbl_unique2(
    user_no     number,             --회원번호
    user_id     varchar2(20),       --회원아이디
    user_pw     varchar2(30),       --회원비밀번호
    user_name   varchar2(30),       --회원이름
    gender      char(6),            --성별
    phone       char(11),            --전화번호
    unique(user_no),
    unique(user_id)
    --따로따로 걸어줘
);

insert into user_tbl_unique2 values(1,'user01','1111','유저1','남자','01011111111');
insert into user_tbl_unique2 values(2,'user02','2222','유저2','여자','01022222222');
insert into user_tbl_unique2 values(2,'user03','2222','유저3','남자','01033333333');

select * from user_tbl_unique2;


--위와 다른 문법이다. 
create table user_tbl_unique3(
    user_no     number,             --회원번호
    user_id     varchar2(20),       --회원아이디
    user_pw     varchar2(30),       --회원비밀번호
    user_name   varchar2(30),       --회원이름
    gender      char(6),            --성별
    phone       char(11),            --전화번호
    unique(user_no, user_id)
    --동시에 겹칠때 유니크가 걸린다.
);

insert into user_tbl_unique3 values(1,'user01','1111','유저1','여자','01011111111');
insert into user_tbl_unique3 values(2,'user02','2222','유저2','남자','01022222222');
insert into user_tbl_unique3 values(3,'user02','3333','유저3','여자','01033333333');
insert into user_tbl_unique3 values(2,'user02','4444','유저4','남자','01044444444');

commit;

-- not null uniuqe 동시적용 
create table user_tbl_nn_unq(
    user_no     number not null unique,             --회원번호
    user_id     varchar2(20) not null,       --회원아이디
    user_pw     varchar2(30),       --회원비밀번호
    user_name   varchar2(30),       --회원이름
    gender      char(6),            --성별
    phone       char(11),            --전화번호
    unique(user_id)
);
insert into user_tbl_nn_unq values(1,'user01','1111','유저1','남자','01011111111');
insert into user_tbl_nn_unq values(2,'user02','2222','유저2','남자','01022222222');

select * from user_tbl_nn_unq;


--da6(24.06.10)
--primary key 하나밖에 못씀   unique + not null
create table user_tbl_pk1(
    user_no     number primary key,             --회원번호
    user_id     varchar2(20) unique not null,       --회원아이디
    user_pw     varchar2(30),       --회원비밀번호
    user_name   varchar2(30),       --회원이름
    gender      char(6),            --성별
    phone       char(11)            --전화번호
);
insert into user_tbl_pk1 values(1, 'user01','1111','유저1','남자','01011111111');
insert into user_tbl_pk1 values(2, 'user02','2222','유저2','남자','01022222222');

create table user_tbl_pk2(
    user_no     number,             --회원번호
    user_id     varchar2(20) unique not null,       --회원아이디
    user_pw     varchar2(30),       --회원비밀번호
    user_name   varchar2(30),       --회원이름
    gender      char(6),            --성별
    phone       char(11),            --전화번호
    primary key(user_no) --컬러레벨 뿐 아니라, 테이블레벨에서 넣을수 있다. 
);

create table user_tbl_pk3(
    user_no     number,             --회원번호
    user_id     varchar2(20) unique not null,       --회원아이디
    user_pw     varchar2(30),       --회원비밀번호
    user_name   varchar2(30),       --회원이름
    gender      char(6),            --성별
    phone       char(11),            --전화번호
    primary key(user_no, user_id) --합쳐서 pk로 사용(unique)와 동일 // 문법상의 문제가 없지만, 두개 합쳐서 primary key 이다.  
);

create table user_tbl_pk4(
    user_no     number,             --회원번호
    user_id     varchar2(20) unique not null,       --회원아이디
    user_pw     varchar2(30),       --회원비밀번호
    user_name   varchar2(30),       --회원이름
    gender      char(6),            --성별
    phone       char(11),            --전화번호
    primary key(user_no),
    primary key(user_id)  --pk는 테이블당 1개만 설정이 가능하므로 지금처럼 작성하면 에러 
                          --"table can have only one primary key"
);



-- 외래키(Foreign Key, FK) : 참조된 다른 테이블이 제공하는 값만 사용할 수 있도록 제한하는 것 
-- 외래키 사용하기 위해서는 primary key(기본적으로), unique 가 와야 한다. 
/*
쇼핑몰 데이터베이스를 구축
-> 해당쇼핑몰은 반드시 로그인한 후 로그인한 후 쇼핑이 가능
-> 쇼핑구매목록에는 로그인한 회원 아이디가 기록 
*/

CREATE TABLE SHOP_MEMBER1(
    MEMBER_ID      VARCHAR2(20),
    MEMBER_PW       VARCHAR2(30),
    MEMBER_NAME     VARCHAR2(21),
    MEMBER_PHONE    CHAR(13)
);
insert into shop_member1 values('user01','1111','유저1','010-1111-1111');
insert into shop_member1 values('user02','2222','유저2','010-2222-2222');
insert into shop_member1 values('user03','3333','유저3','010-3333-3333');
select * from shop_member1;

create table shop_cart1(
    cart_no         number,             --구매번호
    product_name    varchar2(100),      --구매상품이름
    member_id       varchar2(20),       --구매회원아이디
    buy_date        date                --구매날짜
);
insert into shop_cart1 values(1,'아이폰','user01',sysdate);
insert into shop_cart1 values(2,'갤럭시','user03',sysdate);
insert into shop_cart1 values(3,'볼펜','user11',sysdate);

select * from shop_cart1;
select * from shop_member1;


select
    cart_no,product_name,buy_date, member_name, member_phone
from 
    shop_cart1
left join
    shop_member1 using (member_id);
    
    
create table shop_member2(
    member_no      number           primary key,
    member_id      varchar2(20)     unique not null,
    member_pw      varchar2(30),
    member_name    varchar2(21),
    member_phone   char(13)
);

create table shop_cart2(
    cart_no         number,
    product_name    varchar2(100),
    member_id       varchar2(20) references shop_member2(member_id),--참조하는 키는 primary key이거나 최소한 uniqe 정도는 되야한다. 
    buy_date        date
);
insert into shop_member2 values(1,'user01','1111','유저1','010-1111-1111');
insert into shop_member2 values(2,'user02','2222','유저2','010-2222-2222');
insert into shop_member2 values(3,'user03','3333','유저3','010-3333-3333');
select * from shop_member2;
select * from shop_cart2;
insert into shop_cart2 values(1,'아이폰','user01',sysdate);
insert into shop_cart2 values(2,'갤럭시','user03',sysdate);
insert into shop_cart2 values(3,'볼펜','test11',sysdate); --error : parent key not found
insert into shop_cart2 values(3,'볼펜',null,sysdate);--null은 들어갈수 있다.  



create table shop_member3(
    member_no      number           primary key,
    member_id      varchar2(20)     unique not null,
    member_pw      varchar2(30),
    member_name    varchar2(21),
    member_phone   char(13)
);

create table shop_cart3(
    cart_no         number,
    product_name    varchar2(100),
    member_id       varchar2(20), 
    buy_date        date,
    foreign key (member_id) references shop_member3(member_id)
);



-- priamry key 이 테이블의 공유 식별자는 나야 ~~ 
-- 데이터 연결 목적으로 사용
create table shop_member4(
    member_no      number           primary key,
    member_id      varchar2(20)     unique not null,
    member_pw      varchar2(30),
    member_name    varchar2(21),
    member_phone   char(13)
);

create table shop_cart4(
    cart_no         number,
    product_name    varchar2(100),
    member_no       number      references shop_member4, -- 참조할 테이블명만 작성하면 해당 테이블의 pk를 참조
    buy_date        date
);
insert into shop_member4 values(1,'user01','1111','유저1','010-1111-1111');
insert into shop_member4 values(2,'user02','2222','유저2','010-2222-2222');
insert into shop_member4 values(3,'user03','3333','유저3','010-3333-3333');
select * from shop_member4;
update shop_member4 set member_no=100 where member_id = 'user01';
-- 업데이트할때 다 바꿔줘 라 하는 mySQL 등 가능 기능
select * from shop_cart4;
insert into shop_cart4 values(1,'아이폰',1,sysdate);
insert into shop_cart4 values(2,'갤럭시',3,sysdate);
insert into shop_cart4 values(3,'볼펜',10,sysdate);

delete from shop_member4 where member_no=2;
delete from shop_member4 where member_no=3;
delete from shop_cart4 where cart_no=2;



-- foreign key - 삭제 옵션 
create table shop_member5(
    member_no      number           primary key,
    member_id      varchar2(20)     unique not null,
    member_pw      varchar2(30),
    member_name    varchar2(21),
    member_phone   char(13)
);

create table shop_cart5(
    cart_no         number,
    product_name    varchar2(100),
    --member_no       number     not null references shop_member5 on delete set null, 
    --not null과 같이 못쓰는 옵션, 지울때 null이 들어가야하는데 못들어감 
    member_no       number      references shop_member5 on delete set null, 
    buy_date        date
);
insert into shop_member5 values(1,'user01','1111','유저1','010-1111-1111');
insert into shop_member5 values(2,'user02','2222','유저2','010-2222-2222');
insert into shop_member5 values(3,'user03','3333','유저3','010-3333-3333');
select * from shop_member5;
select * from shop_cart5;
delete from shop_member5 where member_no=1;
insert into shop_cart5 values(1,'아이폰',1,sysdate);
insert into shop_cart5 values(2,'갤럭시',3,sysdate);



--on delete cascade(종속)
--내 부모 데이터가 지워지면 너도 같이 지워
create table shop_member6(
    member_no      number           primary key,
    member_id      varchar2(20)     unique not null,
    member_pw      varchar2(30),
    member_name    varchar2(21),
    member_phone   char(13)
);



create table shop_cart6(
    cart_no         number,
    product_name    varchar2(100),
    member_no       number      references shop_member6 on delete cascade, 
    buy_date        date
);

insert into shop_member6 values(1,'user01','1111','유저1','010-1111-1111');
insert into shop_member6 values(2,'user02','2222','유저2','010-2222-2222');
insert into shop_member6 values(3,'user03','3333','유저3','010-3333-3333');
insert into shop_cart6 values(1,'아이폰',1,sysdate);
insert into shop_cart6 values(2,'갤럭시',3,sysdate);

select * from shop_member6;
delete from shop_member6 where member_no=1;
select * from shop_cart6; --참조하던 데이터도 같이 지워진다. 데이터가 지워지기에 위험~
--옵션 잘못 들어있으면 데이터가 잘 날아가기에 잘 써야함. db코드가 바뀌면 자바코드 영향을 많이 받기에 처음에 잘 잡아야함. 



--제약조건 - CHECK
--다른테이블과의 관계는 없다.
create table user_tbl(
    user_no     number,             --회원번호
    user_id     varchar2(20),       --회원아이디
    user_pw     varchar2(30),       --회원비밀번호
    user_name   varchar2(30),       --회원이름
    gender      char(6),            --성별
    phone       char(11)            --전화번호
);

select * from user_tbl;
select * from user_tbl where gender = '여자' or gender = '여';
select * from user_tbl where gender in ('남자','M');
delete from user_tbl where user_no is null;
insert into user_tbl values(2,'user02','2222','유저2','남자','01022222222');
insert into user_tbl values(3,'user03','3333','유저3','남자','01033333333');
insert into user_tbl values(4,'user04','4444','유저4','여자','01044444444');
insert into user_tbl values(5,'user05','5555','유저5','여','01055555555');
insert into user_tbl values(6,'user06','6666','유저6','M','01066666666');


create table user_tbl_check(
    user_no     number,             --회원번호
    user_id     varchar2(20),       --회원아이디
    user_pw     varchar2(30),       --회원비밀번호
    user_name   varchar2(30),       --회원이름
    gender      char(6) check(gender in ('남자','여자')),  --성별   --선택하는 사항에서 이렇게 넣는다. 
    phone       char(11)            --전화번호
);

insert into user_tbl_check values(2,'user02','2222','유저2','남자','01022222222');
insert into user_tbl_check values(4,'user04','4444','유저4','여자','01044444444');
insert into user_tbl_check values(5,'user05','5555','유저5','여','01055555555');
insert into user_tbl_check values(6,'user06','6666','유저6','M','01066666666');



--값을 지정하지 않으면 자동으로 들어가는 값(insert시에만 적용)
create table user_tbl_default(
    user_no     number,             --회원번호
    user_id     varchar2(20),       --회원아이디
    user_pw     varchar2(30),       --회원비밀번호
    user_name   varchar2(30),       --회원이름
    gender      char(6),            --성별   
    phone       char(11) default '01000000000'            --전화번호
);

insert into user_tbl_default values(1,'user01','1234','유저1','남자','01011111111');
insert into user_tbl_default (user_no,user_id,user_pw,user_name,gender,phone)
values (1,'user02','2222','유저2','여자','01022222222');
select * from user_tbl_default;

insert into user_tbl_default (user_no,user_id,user_pw,user_name,gender)
values (3,'user03','3333','유저3','남자');

--6개의 데이터 중 어떤게 생략된지 인식 못함
insert into user_tbl_default values(4,'user04','4444','유저4','남자');
insert into user_tbl_default values(4,'user04','4444','유저4','남자', default);

-- 조건절에는 쓸수 없고 값을 넣을때만 쓸수 있다. 
update user_tbl_default set phone = default where user_no=1;
select * from user_tbl_default where phone = default; -- 조건절에서는 사용이 불가능 


create table runningman(
    no          number  primary key,
    id          varchar2(20) unique,
    pass        varchar2(20) not null,
    name        varchar2(20) not null,
    nickname    varchar2(20) unique,
    gender      char(1),
    tel         varchar2(20) default '010-0000-0000',
    address     varchar2(90)
);
rollback;
select * from runningman;
insert into runningman values(1,'muhan','1234','유재석','못생긴형','M','010-4958-2333','압구정');
insert into runningman values(2,'bignese','4444','지석진','지는행','M',default,'서울');
insert into runningman values(3,'tiger','6658','김종국','안꼬','M','010-6674-8986','안양');
insert into runningman values(4,'haha','5356','하하','신분세탁','M','010-8997-1122','서래마을');
insert into runningman values(5,'ace','5555','송지효','천성임','F',default,'서울시');
insert into runningman values(6,'girrafe','9999','이광수 ','중기친구','M','010-4958-2333','압구정');
insert into runningman values(7,'ssapssap','5356','양세찬','김종국팬','M','010-1215-7777','동두천');
insert into runningman values(8,'doli','5555','전소민','전두릅','F',default,'일상');
update runningman set pass = '9999' where nickname = '중기친구';
update runningman set tel = '없음' where tel = '010-0000-0000';
delete from runningman where name = '유재석';
delete from runningman;
--조건 안달면 전체삭제
delete from runningman where no in(2,3,4,5,6,7,8);

commit;


