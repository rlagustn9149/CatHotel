package dao;
import java.util.ArrayList;
import dto.Review;
import dto.Room;

public class reviewRepository {
	
	private ArrayList<Review> listOfReviews = new ArrayList<Review>();
	private static reviewRepository instance = new reviewRepository();
	
	public static reviewRepository getInstance() {
		return instance;
	}
	
	public void addreview(Review review)
	{
		listOfReviews.add(review);
	}
	public reviewRepository() {
		
		Review standard = new Review("Standard","2020-06-12 ~ 2020-06-13","���Ĵٵ�� �̿� �ı��Դϴ�");
		standard.settext("�ȳ��ϼ���. ���縶�� ȣ�� �̿� �ı��Դϴ�. ������ ����̰� ���� �����ؼ� ��Ʈ���� ������� ���� �ƴµ� ���� �������� �� ������ ���ƿ�.");
		standard.setr_Id("1");
		standard.setfileName("welcome1.jpg");
		
		Review deluxe = new Review("Deluxe","2020-07-11 ~ 2020-07-12","���� �̿� �ı��Դϴ�");
		deluxe.settext("�ȳ��ϼ���. ���� ��ȣ���Դϴ�. �ְ߼� ���� ������ ���� ȣ���̿��� ���� �̿��ϴٰ� �̷� ����� ����ȣ���� �̿��� �� �־ ���ҽ��ϴ� �Ф� ���̰� â�� ���� �ٶ󺸴� ���� �����ϴµ� â���� �޸� ��� ĹŸ���� �־ �Ѱ� ���� �������.");
		deluxe.setr_Id("2");
		
		Review premier= new Review("Premier","2020-09-12 ~ 2020-09-14","���� ���� �̿� �ı��Դϴ�");
		premier.settext("�ȳ��ϼ���. �̹��� ���縶�� ȣ���� �̿��� �����Դϴ�. ���������� ���鼭 ���̿� ���̸� �ñ�� �� ���� ���� �����µ� ���縶�� ȣ�� ���п� ���ϰ� ���� �ٳ�� �� �־���� �Ф� �����մϴ�.");
		premier.setr_Id("3");
		
		listOfReviews.add(standard);
		listOfReviews.add(deluxe);
		listOfReviews.add(premier);
	}
	
	public ArrayList<Review> AllgetReviews(){
		return listOfReviews;
	}
	
	public Review getReviewTitle(String r_id)
	{
		Review ReviewId = null;
		
		for(int i=0; i<listOfReviews.size(); i++) {
			Review review = listOfReviews.get(i);
			if(review !=null && review.getr_Id()!=null && review.getr_Id().equals(r_id)) {
				ReviewId=review;
				break;
			}
		}
		return ReviewId;
	}
	
}
