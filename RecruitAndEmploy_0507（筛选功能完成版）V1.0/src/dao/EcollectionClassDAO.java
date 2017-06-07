package dao;

import java.util.List;

import domain.EcollectionClass;

public interface EcollectionClassDAO {
	void create(EcollectionClass ecollectionClass);
	void update(EcollectionClass ecollectionClass);
	void delete(int id);
	List<EcollectionClass> queryList();

}
