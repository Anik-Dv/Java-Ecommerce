package entitys;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Products {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int pId;
	private String pTitle;
	@Column(length = 2000)
	private String pDescription;
	@Column(length = 1000)
	private String pImage;
	private float pPrice;
	private int pDiscount;
	private String pQuantity;

	@ManyToOne
	private Categories category;

	public Products() {
		super();
	}

	public Products(int pId, String pTitle, String pDescription, String pImage, float pPrice, int pDiscount,
			String pQuantity, Categories category) {
		this.pId = pId;
		this.pTitle = pTitle;
		this.pDescription = pDescription;
		this.pImage = pImage;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		this.pQuantity = pQuantity;
		this.category = category;
	}

	public Products(String pTitle, String pDescription, String pImage, float pPrice, int pDiscount, String pQuantity,
			Categories category) {
		this.pTitle = pTitle;
		this.pDescription = pDescription;
		this.pImage = pImage;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		this.pQuantity = pQuantity;
		this.category = category;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public String getpTitle() {
		return pTitle;
	}

	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	public String getpDescription() {
		return pDescription;
	}

	public void setpDescription(String pDescription) {
		this.pDescription = pDescription;
	}

	public String getpImage() {
		return pImage;
	}

	public void setpImage(String pImage) {
		this.pImage = pImage;
	}

	public float getpPrice() {
		return pPrice;
	}

	public void setpPrice(float pPrice) {
		this.pPrice = pPrice;
	}

	public int getpDiscount() {
		return pDiscount;
	}

	public void setpDiscount(int pDiscount) {
		this.pDiscount = pDiscount;
	}

	public String getpQuantity() {
		return pQuantity;
	}

	public void setpQuantity(String pQuantity) {
		this.pQuantity = pQuantity;
	}

	public Categories getCatagories() {
		return category;
	}

	public void setCatagories(Categories category) {
		this.category = category;
	}

	// Calculate product price after discount
	public int getPriceAfterDiscout() {
		int discount = (int)((this.getpDiscount() / 100.0) * this.getpPrice());
		return (int) this.getpPrice() - discount;
	}

}
