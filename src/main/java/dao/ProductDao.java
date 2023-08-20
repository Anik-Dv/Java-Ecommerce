package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entitys.Products;

public class ProductDao {
	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		this.factory = factory;
	}

	public int saveProducts(Products prod) {
		int pId = 0;
		try {
			Session session = this.factory.openSession();

			session.save(prod);

			Transaction trx = session.beginTransaction();
			trx.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pId;
	}

	// get All Products
	public List<Products> getProducts() {
		List productList = null;
		try {
			Session session = this.factory.openSession();
			Query query = session.createQuery("from Products");
			productList = query.list();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return productList;
	}



	// get All Products while given category id.
	public List<Products> getProductsByCategoryId(int cid) {
		List list = null;
		try {
			Session session = this.factory.openSession();
			Query query = session.createQuery("from Products as product where product.category.catagoryId =: id");
			query.setParameter("id", cid);
			list = query.list();
			//session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}
