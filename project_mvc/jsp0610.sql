insert into user(id, pwd, name) values('asdf', '1234', '홍길동');
insert into user(id, pwd, name) values('bwer', '1234', '아이유');

select * from user;

select * from user where id = 'asdf';
select * from user where id = 'bwer';

select * from board;
select count(*) from board;

select * from board order by num desc limit 20, 10;

insert into board(title, content, id) values('제목2', '내용1', 'asdf');

select b.*, u.name from board b
inner join user u
on b.id = u.id
where num = 1;

select * from board 
where title like '%제목2%'
order by num desc;

select count(*) from board
where title like '%제목2%';

update board set title='수정제목', content='수정제목' where id = 'asdf' and num = 11;

delete from board where id = 'asdf' and num=10;

update board set viewCnt = viewCnt + 1 where num = 1;

update board set title = '제목수정', content = '내용수정' where num = 1 and id = 'asdf';
select * from board where num = 1;

delete from board where num = 1 and id = 'asdf';