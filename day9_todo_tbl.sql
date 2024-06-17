create table todo_tbl(
    todo_no          number          primary key,        --할일 번호 
    todo_content     varchar(300)    not null,           --할일
    todo_writer      varchar(30)     not null,           --할일 작성자
    todo_done       char(1)         check(todo_done in ('Y','N')),--할일 완료여부
    todo_date       date                                 --할일 작성일
);

create sequence todo_seq;           --할일 번호를 자동으로 채변할 시퀀스 객체

