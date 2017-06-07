package service;

import java.util.List;

import domain.Ecollection;

public interface EcollectionService {
	void create(Ecollection ecollection);
	void update(Ecollection ecollection);
	void deleteone(int id);
	void deletemore(int classid);
	List<Ecollection> queryList(int classid);

}