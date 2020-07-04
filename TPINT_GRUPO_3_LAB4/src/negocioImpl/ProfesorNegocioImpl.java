package negocioImpl;

import java.util.ArrayList;

import dao.ProfesorDao;
import daoImpl.ProfesorDaoImpl;
import entidades.Profesor;
import negocio.ProfesorNegocio;

public class ProfesorNegocioImpl implements ProfesorNegocio {
	ProfesorDao profesorDao = new ProfesorDaoImpl();

	@Override
	public ArrayList<Profesor> listarProfe() {
		return profesorDao.listarProfe();
		
	}

}
