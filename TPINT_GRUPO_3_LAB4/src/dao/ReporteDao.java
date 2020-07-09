package dao;

import java.util.ArrayList;

import entidades.Reporte;

public interface ReporteDao {
	public ArrayList<Reporte> obtenerDatos(int idcurso,int idmateria, int cuatrimestre, int anio);
}
