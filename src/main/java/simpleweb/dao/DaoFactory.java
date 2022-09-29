package simpleweb.dao;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DaoFactory {

	private static Map<String, Object> map = new HashMap<>();
	private static Logger log = LoggerFactory.getLogger(BaseDao.class);

	@SuppressWarnings("unchecked")
	public static <T> T getDao(Class<T> clazz) {
		T dao = null;
		String key = clazz.getSimpleName();
		if (map.containsKey(key)) {
			dao = (T) map.get(key);
		} else {
			try {
				dao = clazz.getDeclaredConstructor().newInstance();
				map.put(key, dao);
			} catch (Exception e) {
				log.error(e.getMessage(), e);
			}
		}
		return dao;
	}
}
