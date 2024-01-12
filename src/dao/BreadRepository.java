package dao;

import dto.Bread;
import java.util.ArrayList;

public class BreadRepository {
	private ArrayList<Bread> listOfBreads = new ArrayList<Bread>();
	private static BreadRepository instance = new BreadRepository();
	
	public BreadRepository() {
		Bread sweetRedBean = new Bread("B1", "���ϻ�", 2000);
		sweetRedBean.setDescription("������ ���Ͼӱ��� ������ ���� ���ϻ����� ������ ������ �δ���� ��� �� �ִ� ���Ļ�");
		sweetRedBean.setCategory("Bread");
		sweetRedBean.setUnitsInStock(100);
		sweetRedBean.setContent(90);
		sweetRedBean.setCalorie(250);
		sweetRedBean.setAllergy("��, ���, ����, ���");
		sweetRedBean.setFilename("B1.jpg");
		
		Bread belt = new Bread("B2", "B.E.L.T ������ġ", 5600);
		belt.setDescription("����ȿ�� �θ��нĻ��� ������, ����, ��ä, �丶�並 �־� ���� �ǰ� ������ġ");
		belt.setCategory("Sandwich");
		belt.setUnitsInStock(30);
		belt.setContent(270);
		belt.setCalorie(560);
		belt.setAllergy("��, ����, ���, ���, �������, �丶��");
		belt.setFilename("B2.jpg");
		
		Bread sweetWhite = new Bread("B3", "�����ȭ��Ʈġ������ũ", 30000);
		sweetWhite.setDescription("�ʶ��Ǿ�ũ�� ġ��� ���� ġ� ��췯�� ġ������ũ");
		sweetWhite.setCategory("Cake");
		sweetWhite.setUnitsInStock(10);
		sweetWhite.setContent(650);
		sweetWhite.setCalorie(2100);
		sweetWhite.setAllergy("����, ���, ��, �������");
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
