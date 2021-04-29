package common;

import java.sql.*;
import java.util.*;
import planai.*;
import pratimai.*;

public class SqlRunner{
	
	public Connection connection = null;
	
	public SqlRunner(Connection conn){
		
		System.out.println( "Connecting to database..." );
		connection = conn;
	}
	
	public List<Planas> getTreniruociuPlanas() throws SQLException {
		List<Planas> planai = new ArrayList<Planas>();
		
		String sql = SqlQueries.readTreniruociuPlanas();

		try (
			PreparedStatement statement = this.connection.prepareStatement(sql);
			ResultSet rezultatuRinkinys = statement.executeQuery();
		) {
			while (rezultatuRinkinys.next()) {
				Planas planas = new Planas();
				
				planas.setId(rezultatuRinkinys.getInt("id"));
				planas.setPav(rezultatuRinkinys.getString("pav"));
				planas.setPratimai(this.getPratimaiPagalPlanas(planas.getId()));
				
				planai.add(planas);
			}
		}

		return planai;
	}
	
	public List<Pratimai> getPratimaiPagalPlanas(int pratimaiId) throws SQLException {
		List<Pratimai> planai = new ArrayList<Pratimai>();
		
		String sql = SqlQueries.readTreniruociuPratimai(pratimaiId);

		try (
			PreparedStatement statement = this.connection.prepareStatement(sql);
			ResultSet rezultatuRinkinys = statement.executeQuery();
		) {
			while (rezultatuRinkinys.next()) {
				Pratimai pratimai = new Pratimai();
				
				pratimai.pav = rezultatuRinkinys.getString("pav");
				pratimai.pastabos = rezultatuRinkinys.getString("pastabos");
				pratimai.lygis_sunkumo = rezultatuRinkinys.getInt("lygis_sunkumo");
				pratimai.id_kito_lygio = rezultatuRinkinys.getInt("id_kito_lygio");
				pratimai.id = rezultatuRinkinys.getInt("id");
				
				
				planai.add(pratimai);
			}
		}

		return planai;
	}
	
	
	public void insertPlanasDb(String pav) throws SQLException{
		String sql = SqlQueries.insertTreniruociuPlanas(pav);
		
		try (
			PreparedStatement statement = this.connection.prepareStatement(sql);
			
		){
			statement.executeUpdate();
		}
	}
	
	public void deletePlanasIsDb(int id) throws SQLException{
		String sql = SqlQueries.deleteTreniruociuPlanas(id);
		
		try (
			PreparedStatement statement = this.connection.prepareStatement(sql);
			
		){
			statement.executeUpdate();
		}
	}
	
	public void updateTreniruociuPlanas(int id, String pav) throws SQLException{
		String sql = SqlQueries.updateTreniruociuPlanas(id, pav);
		
		try (
			PreparedStatement statement = this.connection.prepareStatement(sql);
			
		){
			statement.executeUpdate();
		}
	}
}