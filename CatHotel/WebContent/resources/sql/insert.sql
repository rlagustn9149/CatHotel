INSERT INTO room VALUES('101', 'Standard','스탠다드 룸은 창문이 없는 방입니다. 조용하고 소심한 고양이가 묵기 좋은 방입니다.', 'IPTV, 원목 캣워커, 스크래쳐, 화장실, 방석, 러그, 식기, 사료, 모래, 일지서비스',25000,1,'Standard.jpg','Standard1.jpg', 'Standard2.jpg','Standard3.jpg');
INSERT INTO room VALUES('201', 'Deluxe','디럭스 룸은 창문이 있는 방입니다. 창밖을 구경하길 좋아하는 고양이가 묵기 좋은 방입니다.', 'IPTV, 원목 캣워커, 스크래쳐, 화장실, 방석, 러그, 식기, 사료, 모래, 일지서비스',28000,1,'Deluxe.jpg','Deluxe1.jpg', 'Deluxe2.jpg','Deluxe3.jpg');
INSERT INTO room VALUES('301', 'Premier','프리미어 룸은 창문이 있는 방입니다. 두마리 또는 세마리의 고양이가 묵기 적합한 방입니다.', 'IPTV, 원목 캣워커, 스크래쳐, 화장실, 방석, 러그, 식기, 사료, 모래, 일지서비스',35000,1,'Premier.jpg','Premier1.jpg', 'Premier2.jpg','Premier3.jpg');

INSERT INTO review VALUES('1','Standard','2020-06-12 ~ 2020-06-13','스탠다드룸 이용 후기입니다','안녕하세요. 마루마루 호텔 이용 후기입니다. 저희집 고양이가 많이 예민해서 스트레스 받을까봐 걱정 됐는데 넓은 공간에서 잘 지낸것 같아요.','welcome1.jpg');
INSERT INTO review VALUES('2','Deluxe','2020-07-11 ~ 2020-07-12','콩이 이용 후기입니다','안녕하세요. 콩이 보호자입니다. 애견샵 같은 곳에서 말만 호텔이였던 곳만 이용하다가 이런 고양이 전용호텔을 이용할 수 있어서 좋았습니다 ㅠㅠ 콩이가 창문 밖을 바라보는 것을 좋아하는데 창문이 달린 방과 캣타워가 있어서 한결 맘이 놓였어요.','');
INSERT INTO review VALUES('3','Premier','2020-09-12 ~ 2020-09-14','몽이 옹이 이용 후기입니다','안녕하세요. 이번에 마루마루 호텔을 이용한 집사입니다. 가족여행을 가면서 몽이와 옹이를 맡기고 갈 만한 곳이 없었는데 마루마루 호텔 덕분에 편하게 여행 다녀올 수 있었어요 ㅠㅠ 감사합니다.','welcome2.jpg');

select * from room;
select * from review;