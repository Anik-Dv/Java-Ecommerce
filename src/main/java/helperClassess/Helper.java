package helperClassess;

import java.util.HashMap;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class Helper {
	// get products description only 10words
	public static String getProduct10Word(String str) {
		String[] strArr = str.split(" ");
		if (strArr.length > 10) {

			String strhold = "";
			for (int i = 0; i < 10; i++) {
				strhold = strhold + strArr[i] + " ";
			}
			return (strhold + " ");
		} else {
			return (str + "...");
		}

	}
	
	// getting count of user
	public static Map<String, Long> CountUser(SessionFactory factory) {
		// get hibernate session
		Session session = factory.openSession();
		// fire hql query
		String q = "Select Count(*) from Users";
		
		Query query = session.createQuery(q);
		Long usercount = (Long)query.list().get(0);
		
		Map<String, Long> map = new HashMap<String, Long>();
		map.put("usercount", usercount);
		
		return map;
	}
	

}
