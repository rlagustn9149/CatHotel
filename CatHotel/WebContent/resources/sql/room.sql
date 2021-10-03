CREATE TABLE IF NOT EXISTS room(
	r_number VARCHAR(10) NOT NULL,
	r_class VARCHAR(20),
	r_description TEXT,
   	r_supply TEXT,
	r_onedayprice INTEGER,
	r_capacity INTEGER,
	r_fileName  VARCHAR(20),
	r_fileName1  VARCHAR(20),
	r_fileName2  VARCHAR(20),
	r_fileName3  VARCHAR(20),
	PRIMARY KEY (r_number)
)default CHARSET=utf8;




desc room;

drop table room;
