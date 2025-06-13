insert into user(id, pass, name) values('asdf', '1234', '홍길동');

select * from user where id = 'asdf';

select * from board;

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