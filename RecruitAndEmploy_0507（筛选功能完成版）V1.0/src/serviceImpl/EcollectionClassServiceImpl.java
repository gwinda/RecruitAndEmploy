package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import dao.EcollectionClassDAO;
import daoImpl.EcollectionClassDAOImpl;
import domain.EcollectionClass;
import service.EcollectionClassService;

public class EcollectionClassServiceImpl implements EcollectionClassService{
	@Autowired
	private EcollectionClassDAO ecollectionClassDAOImpl ;
	


	public EcollectionClassDAO getEcollectionClassDAOImpl() {
		return ecollectionClassDAOImpl;
	}

	public void setEcollectionClassDAOImpl(
			EcollectionClassDAO ecollectionClassDAOImpl) {
		this.ecollectionClassDAOImpl = ecollectionClassDAOImpl;
	}

	@Override
	public void create(EcollectionClass ecollectionClass) {
		// TODO Auto-generated method stub
		ecollectionClassDAOImpl.create(ecollectionClass);
		
	}

	@Override
	public void update(EcollectionClass ecollectionClass) {
		// TODO Auto-generated method stub
		ecollectionClassDAOImpl.update(ecollectionClass);
		
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		ecollectionClassDAOImpl.delete(id);
	}

	@Override
	public List<EcollectionClass> queryList() {
		// TODO Auto-generated method stub
		return this.getEcollectionClassDAOImpl().queryList();
	}

}
