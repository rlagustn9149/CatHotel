CREATE TABLE IF NOT EXISTS review(
	r_Id VARCHAR(10) NOT NULL,
	r_class VARCHAR(20),
	r_Date VARCHAR(50),
	r_name VARCHAR(20),
	r_text TEXT,
	r_fileName  VARCHAR(20),
	PRIMARY KEY (r_Id)
)default CHARSET=utf8;

desc review;

drop table review;