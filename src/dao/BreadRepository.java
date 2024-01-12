package dao;

import dto.Bread;
import java.util.ArrayList;

public class BreadRepository {
	private ArrayList<Bread> listOfBreads = new ArrayList<Bread>();
	private static BreadRepository instance = new BreadRepository();
	
	public BreadRepository() {
		Bread sweetRedBean = new Bread("B1", "단팥빵", 2000);
		sweetRedBean.setDescription("엄선된 단팥앙금이 함유된 정통 단팥빵으로 남녀노소 누구나 부담없이 즐길 수 있는 간식빵");
		sweetRedBean.setCategory("Bread");
		sweetRedBean.setUnitsInStock(100);
		sweetRedBean.setContent(90);
		sweetRedBean.setCalorie(250);
		sweetRedBean.setAllergy("밀, 대두, 우유, 계란");
		sweetRedBean.setFilename("B1.jpg");
		
		Bread belt = new Bread("B2", "B.E.L.T 샌드위치", 5600);
		belt.setDescription("토종효모 로만밀식빵에 베이컨, 에그, 야채, 토마토를 넣어 즐기는 건강 샌드위치");
		belt.setCategory("Sandwich");
		belt.setUnitsInStock(30);
		belt.setContent(270);
		belt.setCalorie(560);
		belt.setAllergy("밀, 우유, 대두, 계란, 돼지고기, 토마토");
		belt.setFilename("B2.jpg");
		
		Bread sweetWhite = new Bread("B3", "스노우화이트치즈케이크", 30000);
		sweetWhite.setDescription("필라델피아크림 치즈와 끼리 치즈가 어우러진 치즈케이크");
		sweetWhite.setCategory("Cake");
		sweetWhite.setUnitsInStock(10);
		sweetWhite.setContent(650);
		sweetWhite.setCalorie(2100);
		sweetWhite.setAllergy("우유, 계란, 밀, 돼지고기");
		sweetWhite.setFilename("B3.jpg");
		
		listOfBreads.add(sweetRedBean);
		listOfBreads.add(belt);
		listOfBreads.add(sweetWhite);
	}
	
	public ArrayList<Bread> getAllBreads() {
		return listOfBreads;
	}
	
	public Bread getBreadById(String breadId) {
		Bread breadById = null;
		
		for(int i = 0; i < listOfBreads.size(); i++) {
			Bread bread = listOfBreads.get(i);
			if(bread != null && bread.getBreadId() != null && bread.getBreadId().equals(breadId)) {
				breadById = bread;
				break;
			}
		}
		
		return breadById;
	}
	
	public void addBread(Bread bread) {
		listOfBreads.add(bread);
	}
	
	static public BreadRepository getInstance() {
		return instance;
	}
}
