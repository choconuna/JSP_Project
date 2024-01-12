package dto;

import java.io.Serializable;

public class Bread implements Serializable {
	private String breadId; // �� ���̵�
	private String bname; // �� �̸�
	private Integer breadPrice; // �� ����
	private String description; // �� ����
	private String category; // �� �з�
	private long unitsInStock; // �� ���
	private Integer content; // �� �� ���뷮
	private Integer calorie; // �� Į�θ�
	private String allergy; // �˷����� ����
	private String filename; // �̹��� ���ϸ�
	
	public Bread() {
	}
	
	public Bread(String breadId, String bname, Integer breadPrice) {
		this.breadId = breadId;
		this.bname = bname;
		this.breadPrice = breadPrice;
	}
	
	public String getBreadId() {
		return breadId;
	}
	public void setBreadId(String breadId) {
		this.breadId = breadId;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public Integer getBreadPrice() {
		return breadPrice;
	}
	public void setBreadPrice(Integer breadPrice) {
		this.breadPrice = breadPrice;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public long getUnitsInStock() {
		return unitsInStock;
	}
	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}
	public Integer getContent() {
		return content;
	}
	public void setContent(Integer content) {
		this.content = content;
	}
	public Integer getCalorie() {
		return calorie;
	}
	public void setCalorie(Integer calorie) {
		this.calorie = calorie;
	}
	public String getAllergy() {
		return allergy;
	}
	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
}
