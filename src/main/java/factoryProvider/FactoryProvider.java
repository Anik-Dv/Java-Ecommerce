package factoryProvider;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
	private static SessionFactory factory;

	public SessionFactory getSessionFactory() {
		try {
			if(factory == null) {
				factory = new Configuration().configure("resources/hibernate.cfg.xml").buildSessionFactory();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return factory;
	}

}
