package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import service.EcollectionClassService;
import service.EcollectionService;
import dao.EcollectionClassDAO;
import dao.EcollectionDAO;
import domain.Ecollection;
import domain.EcollectionClass;

	public class EcollectionServiceImpl implements EcollectionService{
		@Autowired
		private EcollectionDAO ecollectionDAOImpl ;
		

		public EcollectionDAO getEcollectionDAOImpl() {
			return ecollectionDAOImpl;
		}

		public void setEcollectionDAOImpl(EcollectionDAO ecollectionDAOImpl) {
			this.ecollectionDAOImpl = ecollectionDAOImpl;
		}

		@Override
		public void create(Ecollection ecollection) {
			// TODO Auto-generated method stub
			ecollectionDAOImpl.create(ecollection);
			
		}

		@Override
		public void update(Ecollection ecollection) {
			// TODO Auto-generated method stub
			ecollectionDAOImpl.update(ecollection);
			
		}

		@Override
		public void deleteone(int id) {
			// TODO Auto-generated method stub
			ecollectionDAOImpl.delete_one(id);
		}
		public void deletemore(int classid) {
			// TODO Auto-generated method stub
			ecollectionDAOImpl.delete_more(classid);
		}

		@Override
		public List<Ecollection> queryList(int classid) {
			// TODO Auto-generated method stub
			return this.getEcollectionDAOImpl().queryList(classid);
		}



	}



