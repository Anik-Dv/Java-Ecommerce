package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entitys.Categories;

public class CategoryDao {

	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		this.factory = factory;
	}

	// this method save all categories;
	public int saveCategories(Categories cat) {
		int catId = 0;
		try {
			Session hibernateSession = this.factory.openSession();

			catId = (Integer) hibernateSession.save(cat);

			Transaction trx = hibernateSession.beginTransaction();
			trx.commit();

			hibernateSession.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return catId;
	}

	// this method get all categories List.
	public List<Categories> getCategories() {
		List<Categories> list = null;
		try {
			Session session = this.factory.openSession();
			Query query = session.createQuery("from Categories");
			list = query.list();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// this method get by all categories by category id.
	public Categories getCategoryById(int catId) {

		Categories category = null;

		try {
			Session session = this.factory.openSession();
			category = session.get(Categories.class, catId);
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return category;
	}

}
