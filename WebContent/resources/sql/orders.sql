CREATE TABLE Orders(
orderid INTEGER AUTO_INCREMENT,
memid VARCHAR(40) NOT NULL,
b_id VARCHAR(20) NOT NULL,
order_count INTEGER NOT NULL,
total_price INTEGER NOT NULL,
b_filename VARCHAR(40),
order_day VARCHAR(50),
PRIMARY KEY(orderid),
FOREIGN KEY(memid) REFERENCES Member(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(b_id) REFERENCES Bread(b_id) ON DELETE CASCADE ON UPDATE CASCADE
)default CHARSET=utf8;

DROP TABLE Orders;