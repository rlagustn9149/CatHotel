package dto;

public class Review {
	
	private String r_Id;
	private String roomClass;	// 룸 클래스
	private String Date;		// 날짜
	private String name;		//이름	
	private String text;        //내용
	private String fileName;
	
	public Review() {
		super();
	}
	
	public Review(String roomClass, String Date, String name) {
		this.roomClass=roomClass;
		this.Date=Date;
		this.name=name;
	}
	public void settext(String text)
	{
		this.text=text;
	}
	public String gettext()
	{
		return text;
	}
	
	public void setfileName(String fileName) {
		this.fileName=fileName;
	}
	public String getfileName() {
		return fileName;
	}
	
	public void setr_Id(String r_Id)
	{
		this.r_Id=r_Id;
	}
	public String getr_Id()
	{
		return r_Id;
	}
	
	public void setroomClass(String roomClass)
	{
		this.roomClass=roomClass;
	}
	public String getroomClass()
	{
		return roomClass;
	}
	
	public void setDate(String Date)
	{
		this.Date=Date;
	}
	public String getDate()
	{
		return Date;
	}
	
	public void setname(String name)
	{
		this.name=name;
	}
	public String getname()
	{
		return name;
	}
}
