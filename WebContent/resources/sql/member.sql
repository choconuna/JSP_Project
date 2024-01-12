CREATE TABLE Member(
id VARCHAR(40) NOT NULL,
password VARCHAR(40) NOT NULL,
name VARCHAR(10) NOT NULL,
gender VARCHAR(10),
birth VARCHAR(20),
mail VARCHAR(40),
phone VARCHAR(20),
address VARCHAR(120),
regist_day VARCHAR(50),
PRIMARY KEY(id)
)default CHARSET=utf8;

DESC Member;

ALTER TABLE Member MODIFY mail VARCHAR(40) NOT NULL UNIQUE;
ALTER TABLE Member MODIFY phone VARCHAR(20) NOT NULL UNIQUE;
ALTER TABLE Member MODIFY address VARCHAR(120) NOT NULL;

INSERT INTO Member(id, password, name, gender, birth, mail, phone, address) VALUES('admin', '100409', '관리자', '여', '2000/01/10', 'sojin0913@naver.com','010-1997-0913', '서울특별시 성북구 서경로124');
