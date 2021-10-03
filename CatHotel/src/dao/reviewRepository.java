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
		
		Review standard = new Review("Standard","2020-06-12 ~ 2020-06-13","스탠다드룸 이용 후기입니다");
		standard.settext("안녕하세요. 마루마루 호텔 이용 후기입니다. 저희집 고양이가 많이 예민해서 스트레스 받을까봐 걱정 됐는데 넓은 공간에서 잘 지낸것 같아요.");
		standard.setr_Id("1");
		standard.setfileName("welcome1.jpg");
		
		Review deluxe = new Review("Deluxe","2020-07-11 ~ 2020-07-12","콩이 이용 후기입니다");
		deluxe.settext("안녕하세요. 콩이 보호자입니다. 애견샵 같은 곳에서 말만 호텔이였던 곳만 이용하다가 이런 고양이 전용호텔을 이용할 수 있어서 좋았습니다 ㅠㅠ 콩이가 창문 밖을 바라보는 것을 좋아하는데 창문이 달린 방과 캣타워가 있어서 한결 맘이 놓였어요.");
		deluxe.setr_Id("2");
		
		Review premier= new Review("Premier","2020-09-12 ~ 2020-09-14","몽이 옹이 이용 후기입니다");
		premier.settext("안녕하세요. 이번에 마루마루 호텔을 이용한 집사입니다. 가족여행을 가면서 몽이와 옹이를 맡기고 갈 만한 곳이 없었는데 마루마루 호텔 덕분에 편하게 여행 다녀올 수 있었어요 ㅠㅠ 감사합니다.");
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
