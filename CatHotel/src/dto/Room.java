package dto;

import java.io.Serializable;
import java.util.ArrayList;

public class Room implements Serializable {

	private static final long serialVersionUID = -4274700572038677000L;
	
	private String roomNumber;     // �� ��ȣ
	private String roomClass;   // �� Ŭ����(standard, deluxe, premier)
	private String description; // ����
	private String supply;     // �⺻ �����Ǵ� ��
	private int oneDayPrice;  // 1�� �̿��
	private int capacity;     // �ִ� ���뷮
	private String fileName;  // �̹��� ���ϸ�
	private String fileName1;  // �̹��� ���ϸ�
	private String fileName2;  // �̹��� ���ϸ�
	private String fileName3;  // �̹��� ���ϸ�
	
	public Room()
	{	
		super();
	}
	
	public Room(String roomClass, int oneDayPrice, int capacity)
	{
		this.roomClass = roomClass;
		this.oneDayPrice=oneDayPrice;
		this.capacity = capacity;
	}
	public void setsupply(String supply) {
		this.supply=supply;
	}
	public String getsupply() {
		return supply;
	}
	
	public void setfileName(String fileName) {
		this.fileName=fileName;
	}
	public String getfileName() {
		return fileName;
	}
	public void setfileName1(String fileName) {
		this.fileName1=fileName;
	}
	public String getfileName1() {
		return fileName1;
	}
	public void setfileName2(String fileName) {
		this.fileName2=fileName;
	}
	public String getfileName2() {
		return fileName2;
	}
	public void setfileName3(String fileName) {
		this.fileName3=fileName;
	}
	public String getfileName3() {
		return fileName3;
	}

	public void setroomNumber(String roomNumber) {
		this.roomNumber=roomNumber;
	}
	public String getroomNumber(){
		return roomNumber;
	}
	
	public void setroomClass(String roomClass) {
		this.roomClass=roomClass;
	}
	public String getroomClass(){
		return roomClass;
	}
	
	public void setdescription(String description) {
		this.description=description;
	}
	public String getdescription(){
		return description;
	}
	
	public void setoneDayPrice(int oneDayPrice) {
		this.oneDayPrice=oneDayPrice;
	}
	public int getoneDayPrice(){
		return oneDayPrice;
	}
	
	public void setcapacity(int capacity) {
		this.capacity=capacity;
	}
	public int getcapacity(){
		return capacity;
	}	
}

