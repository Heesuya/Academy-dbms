create table member_tbl(
    member_no   number          primary key,
    member_id       varchar2(30)    unique not null,
    member_pw       varchar2(30)    not null,
    member_name     varchar2(30)    not null,
    member_grade    number         check(member_grade in (1,2))
);
select * from member_tbl;
create sequence member_tbl_seq
start with 1
increment by 1
;


alter sequence member_tbl_seq
increment by 1
maxvalue 1000
cycle
;

create sequence member_tbl_emp_seq
start with 2000
maxvalue 2000
increment by 1
;

select * from member_tbl;
create table book_tbl(
    book_no     number          primary key,
    book_genre      varchar(30)     not null,
    book_title      varchar2(200)   unique not null,
    book_author     varchar2(30)    not null,
    book_stock     number          not null
);



alter table book_tbl
rename column book_quantity to book_stock;

create sequence book_tbl_seq
start with 1
increment by 1
;

select * from book_tbl;

create table rental_tbl(
    rental_no       number   primary key,
    rental_date         date      not null,
    rental_return_date  date      ,
    rental_status       number    check(rental_status in (1,2)),
    member_no    number    references member_tbl(member_no),
    book_no      number    references book_tbl(book_no)
);
create sequence rental_tbl_seq
start with 1
increment by 1
;
commit;