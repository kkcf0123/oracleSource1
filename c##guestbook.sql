-- board(전체조회), member email 조회
-- bno, title, content, member_email

SELECT b.bno, b.title, b.content, b.writer_email
FROM BOARD b LEFT JOIN "MEMBER" m ON b.WRITER_EMAIL =m.EMAIL ;

