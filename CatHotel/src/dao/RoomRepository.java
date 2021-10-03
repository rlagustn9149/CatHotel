package dao;
import java.util.ArrayList;
import dto.Room;

public class RoomRepository {
	private ArrayList<Room> listOfRooms = new ArrayList<Room>();
	private static RoomRepository instance = new RoomRepository();
	
	public static RoomRepository getInstance() {
		return instance;
	}
	
	public void addRoom(Room room)
	{
		listOfRooms.add(room);
	}
	
	public RoomRepository() {
		
		Room standard= new Room("Standard",25000,1);
		standard.setroomNumber("101");
		standard.setdescription("스탠다드 룸은 창문이 없는 방입니다. 조용하고 소심한 고양이가 묵기 좋은 방입니다.");
		standard.setsupply("IPTV, 원목 캣워커, 스크래쳐, 화장실, 방석, 러그, 식기, 사료, 모래, 일지서비스");
		standard.setfileName("Standard.jpg");
		standard.setfileName1("Standard1.jpg");
		standard.setfileName2("Standard2.jpg");
		standard.setfileName3("Standard3.jpg");
		
		Room deluxe= new Room("Deluxe",28000,1);
		deluxe.setroomNumber("201");
		deluxe.setdescription("디럭스 룸은 창문이 있는 방입니다. 창밖을 구경하길 좋아하는 고양이가 묵기 좋은 방입니다.");
		deluxe.setsupply("IPTV, 원목 캣워커, 스크래쳐, 화장실, 방석, 러그, 식기, 사료, 모래, 일지서비스");
		deluxe.setfileName("Deluxe.jpg");
		deluxe.setfileName1("Deluxe1.jpg");
		deluxe.setfileName2("Deluxe2.jpg");
		deluxe.setfileName3("Deluxe3.jpg");
		
		Room premier= new Room("Premier",35000,3);
		premier.setroomNumber("301");
		premier.setdescription("프리미어 룸은 창문이 있는 방입니다. 두마리 또는 세마리의 고양이가 묵기 적합한 방입니다.");
		premier.setsupply("IPTV, 원목 캣워커, 스크래쳐, 화장실, 방석, 러그, 식기, 사료, 모래, 일지서비스");
		premier.setfileName("Premier.jpg");
		premier.setfileName1("Premier1.jpg");
		premier.setfileName2("Premier2.jpg");
		premier.setfileName3("Premier3.jpg");
		
		listOfRooms.add(standard);
		listOfRooms.add(deluxe);
		listOfRooms.add(premier);
	}
	
	public ArrayList<Room> AllgetRooms(){
		return listOfRooms;
	}
	
	public Room getRoomByNumber(String roomNumber)
	{
		Room RoomByNumber = null;
		
		for(int i=0; i<listOfRooms.size(); i++) {
			Room room = listOfRooms.get(i);
			if(room !=null && room.getroomNumber()!=null && room.getroomNumber().equals(roomNumber)) {
				RoomByNumber=room;
				break;
			}
		}
		return RoomByNumber;
	}
}
