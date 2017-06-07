package dao;

import java.util.List;

import domain.Ecollection;

public interface EcollectionDAO {
	void create(Ecollection ecollection);
	void update(Ecollection ecollection);
	void delete_one(int id);
	void delete_more(int eclass);
	List<Ecollection> queryList(int eclass);

}
