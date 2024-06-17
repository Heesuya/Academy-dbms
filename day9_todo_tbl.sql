create table todo_tbl(
    todo_no          number          primary key,        --���� ��ȣ 
    todo_content     varchar(300)    not null,           --����
    todo_writer      varchar(30)     not null,           --���� �ۼ���
    todo_done       char(1)         check(todo_done in ('Y','N')),--���� �ϷῩ��
    todo_date       date                                 --���� �ۼ���
);

create sequence todo_seq;           --���� ��ȣ�� �ڵ����� ä���� ������ ��ü

