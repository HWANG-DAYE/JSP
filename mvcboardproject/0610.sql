select * from board;

select b.*, u.name from board b left outer join user u
on b.id = u.id where num =1;

select * from comment;

select count(*) from comment where bno=1;
insert into comment(bno, comment, commenter) values(1,'내용', 'asdf');
delete from comment where con = 1 and commenter = 'asdf';
select * from comment where bno = 1;
select * from comment where cno = 2;
update comment set comment = '수정' where cno = 2 and commenter = 'asdf'