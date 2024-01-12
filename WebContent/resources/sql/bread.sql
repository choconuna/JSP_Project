CREATE TABLE IF NOT EXISTS Bread(
b_id VARCHAR(20) NOT NULL,
b_name VARCHAR(50),
b_unitPrice INTEGER,
b_description VARCHAR(60),
b_category VARCHAR(20),
b_unistInStock LONG,
b_content INTEGER,
b_calorie INTEGER,
b_allergy VARCHAR(60),
b_filename VARCHAR(40),
PRIMARY KEY (b_id)
)default CHARSET=utf8;

DESC Bread;