package entitys;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Categories {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int catagoryId;
	@Column(length = 100)
	private String Title;
	@Column(length = 300)
	private String Description;

	@OneToMany(mappedBy = "category")
	private List<Products> product = new ArrayList<Products>();

	public Categories() {
		super();
	}

	public Categories(int catagoryId, String title, String description, List<Products> product) {
		this.catagoryId = catagoryId;
		this.Title = title;
		this.Description = description;
		this.product = product;
	}

	public Categories(String title, String description, List<Products> product) {
		this.Title = title;
		this.Description = description;
		this.product = product;
	}

	public int getCatagoryId() {
		return catagoryId;
	}

	public void setCatagoryId(int catagoryId) {
		this.catagoryId = catagoryId;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		this.Title = title;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		this.Description = description;
	}

	public List<Products> getProducts() {
		return product;
	}

	public void setProducts(List<Products> product) {
		this.product = product;
	}

}
