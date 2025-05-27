select * from board;
insert into board(title, content, writer) values('제목1', '내용1', 'asdf');
update board set title = '변경', content = '변경' where num = 1 and writer = 'asdf';
delete from board where num=1;

select * from member;
