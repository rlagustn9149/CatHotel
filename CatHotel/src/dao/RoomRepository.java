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
		standard.setdescription("���Ĵٵ� ���� â���� ���� ���Դϴ�. �����ϰ� �ҽ��� ����̰� ���� ���� ���Դϴ�.");
		standard.setsupply("IPTV, ���� Ĺ��Ŀ, ��ũ����, ȭ���, �漮, ����, �ı�, ���, ��, ��������");
		standard.setfileName("Standard.jpg");
		standard.setfileName1("Standard1.jpg");
		standard.setfileName2("Standard2.jpg");
		standard.setfileName3("Standard3.jpg");
		
		Room deluxe= new Room("Deluxe",28000,1);
		deluxe.setroomNumber("201");
		deluxe.setdescription("�𷰽� ���� â���� �ִ� ���Դϴ�. â���� �����ϱ� �����ϴ� ����̰� ���� ���� ���Դϴ�.");
		deluxe.setsupply("IPTV, ���� Ĺ��Ŀ, ��ũ����, ȭ���, �漮, ����, �ı�, ���, ��, ��������");
		deluxe.setfileName("Deluxe.jpg");
		deluxe.setfileName1("Deluxe1.jpg");
		deluxe.setfileName2("Deluxe2.jpg");
		deluxe.setfileName3("Deluxe3.jpg");
		
		Room premier= new Room("Premier",35000,3);
		premier.setroomNumber("301");
		premier.setdescription("�����̾� ���� â���� �ִ� ���Դϴ�. �θ��� �Ǵ� �������� ����̰� ���� ������ ���Դϴ�.");
		premier.setsupply("IPTV, ���� Ĺ��Ŀ, ��ũ����, ȭ���, �漮, ����, �ı�, ���, ��, ��������");
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
