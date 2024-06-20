create table exam_member(
    member_no       number          primary key,
    member_id       varchar2(20)    not null unique,
    member_pw       varchar2(30)    not null,
    member_name     varchar2(20)    not null,
    member_phone    char(11)        not null
);

create sequence exam_member_seq;
select exam_member_seq.currval from dual; 
select * from exam_member;
select * from exam_board;
commit;

create table exam_board(
    board_no        number          primary key,
    board_title     varchar2(100)   not null,
    board_content   varchar2(2000)  not null,
    board_writer    number          references exam_member(member_no) on delete set null,
    read_count      number          not null,
    write_date      date            not null
);
drop table exam_board;
create sequence exam_board_seq;

rollback;
select * from exam_board join exam_member on (board_writer = member_no);
update exam_board set read_count = 1+2 where board_no = 6;

select * from exam_board left join exam_member on (board_writer = member_no);

select * from exam_member;

select * from exam_board;
select * from exam_board where board_writer is null;
select board_no, board_title, nvl(member_name,'È¸¿øÅ»Åð') as member_name, read_count, write_date from exam_board left join exam_member on (board_writer = member_no);
select board_no, board_title, board_content, nvl(board_writer,0), read_count, write_date from exam_board join exam_member on (board_writer = member_no);