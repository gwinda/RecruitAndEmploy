package service;

import java.util.List;

import domain.EcollectionClass;

public interface EcollectionClassService {
	void create(EcollectionClass ecollectionClass);
	void update(EcollectionClass ecollectionClass);
	void delete(int id);
	List<EcollectionClass> queryList();

}
