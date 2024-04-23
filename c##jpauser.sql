CREATE TABLE team(
team_id varchar2(255) PRIMARY KEY,
name varchar2(255)
);

CREATE TABLE team_member(
member_id varchar2(255) PRIMARY KEY,
username varchar2(255),
team_id varchar2(255) CONSTRAINT fk_member_team REFERENCES team(team_id)
);

-- SQL Error [2291] [23000]: ORA-02291: 무결성 제약조건(C##JPAUSER.FK_MEMBER_TEAM)이 위배되었습니다- 부모 키가 없습니다
INSERT INTO team values('team1','victory');
INSERT INTO team_member tm VALUES('member1','hong','team1');

-- SQL Error [2292] [23000]: ORA-02292: 무결성 제약조건(C##JPAUSER.FK_MEMBER_TEAM)이 위배되었습니다- 자식 레코드가 발견되었습니다
DELETE FROM team t WHERE team_id = 'team1';
DELETE team_member WHERE member_id = 'member1';


CREATE TABLE team1(
team_id varchar2(255) PRIMARY KEY,
name varchar2(255)
);

-- on delete cascade : 부모가 삭제될 때 참조하는 데이터도 같이 삭제
-- on delete set null : 부모가 삭제될 때 참조하는 데이터의 외래키를 NULL로 변경
CREATE TABLE team_member1(
member_id varchar2(255) PRIMARY KEY,
username varchar2(255),
team_id varchar2(255) CONSTRAINT fk_member_team1 REFERENCES team1(team_id) ON DELETE CASCADE
);

INSERT INTO team1 values('team1','victory');
INSERT INTO team_member1 tm VALUES('member1','hong','team1');
DELETE FROM team1 t WHERE team_id = 'team1';
DELETE team_member1 WHERE member_id = 'member1';

SELECT tm.MEMBER_ID, tm.USERNAME , tm.TEAM_ID, t.NAME  FROM TEAM_MEMBER1 tm JOIN TEAM1 t ON tm.TEAM_ID =t.TEAM_ID 
WHERE tm.MEMBER_ID ='member1';

-- ORM


SELECT * FROM TEAM_MEMBER tm WHERE TEAM_TEAM_ID =(SELECT TEAM_TEAM_ID FROM TEAM_MEMBER tm2 WHERE tm.MEMBER_ID =)


SELECT * FROM BOOK b WHERE b.BOOK_ID > 0 ORDER BY b.BOOK_ID DESC;

INSERT INTO book(BOOK_ID, TITLE, WRITER, PRICE, SALE_PRICE, CATEGORY_CATEGORY_ID, PUBLISHER_PUBLISHER_ID, CREATED_DATE, LAST_MODIFIED_DATE)
(SELECT book_seq.nextval,TITLE, WRITER, PRICE, SALE_PRICE, CATEGORY_CATEGORY_ID, PUBLISHER_PUBLISHER_ID, CREATED_DATE, LAST_MODIFIED_DATE FROM book);



