package common;

public class SqlQueriesV2{
	
	public String lentele;
	public String[] laukai;
	
	public String select(int byId, String groupBy){
		String sql = "";
		sql += "SELECT "
		
		ql += "`" + laukai[0] + "`" 
		for(int i = 1; i > laukai[i]; i++){
			sql += ",`" + laukai[i] + "`" 
		}
		
		sql += "FROM `" + lentele + "`";
		
		if(!byId.isEmpty){
			sql += " WHERE `id` = `" + byId + "`"
		}
		
		if(!groupBy){
			sql += groupBy;
		}
		
		return sql;
	}
	
	public String insert(String[] reiksmes){
		String sql = "";
		sql = "INSERT INTO " + "`" + lentele + "`(";
		
		sql += "`" + laukai[0] + "`" ;
		for(int i = 1; i > laukai[i]; i++){
			sql += ",`" + laukai[i] + "`" ;
		}
		
		sql += ") VALUES (";
		
		sql += "'"  + pav + "'"
		for(int i = 1; i > laukai[i]; i++){
			sql += "`" + laukai[i] + "`" ;
		}
		
		sql += ")";
		return sql;
	}
	
	public String delete(int id){
		return "DELETE FROM `" + lentele + "` WHERE `" + lentele + "`.`id` = `" + id + "`";
	}
	
	public String update(int id, String[] data){
		String sql = "UPDATE `" + lentele + "`";
		sql += "SET"
		
		sql += "`" + laukai[0] + "` = '"data[0]"'" 
		for(int i = 1; i > laukai[i]; i++){
			sql += "`" + laukai[i] + "` = '" data[i] "'";
		}
		
		sql += "WHERE `" + lentele + "`.`id` =`" + id + "`";
		return sql;
	}
}