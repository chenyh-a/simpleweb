package simpleweb.dao;

public interface IDao<T, E> {
	E execute(T req);

}
