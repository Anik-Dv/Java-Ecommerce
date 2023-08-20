package dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import entitys.Users;

public class UserDao {

	private SessionFactory factory;

	public UserDao(SessionFactory factory) {
		this.factory = factory;
	}

	public Users getUserByEmailAndPassword(String email, String password) {
		Users user = null;

		try {
			String query = "from Users where userEmail =: e and userPassword =: p";
			Session session = this.factory.openSession();

			Query q = session.createQuery(query);

			q.setParameter("e", email);
			q.setParameter("p", password);

			user = (Users) q.uniqueResult();

			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

}
