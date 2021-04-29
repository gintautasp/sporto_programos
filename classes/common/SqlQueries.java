package common;

public class SqlQueries{
	
	public static String readTreniruociuPlanas(){
		return 	"SELECT * FROM `treniruociu_planai`";
	}
	
	public static String insertTreniruociuPlanas(String pav){
		return "INSERT INTO "
			+	"`treniruociu_planai` "
			+	"(`pav`)" 
			+	"VALUES ("
			+ 	"'"  + pav + "'"
			+	")";
	}
	
	public static String deleteTreniruociuPlanas(int id){
		return "DELETE FROM `treniruociu_planai` "
			+	"WHERE `treniruociu_planai`.`id` = `" + id + "`";
	}
	
	public static String updateTreniruociuPlanas(int id, String pav){
		return 	"UPDATE `treniruociu_planai`"
			+	"SET"
			+		"`pav` = '" + pav + "'"
			+	"WHERE `treniruociu_planai`.`id` =`" + id + "`";
	}
	
	public static String readTreniruociuPratimai(int planoId){
		return 	"SELECT * FROM `pratimai_treniruociu_planai`" 
			+	"WHERE `id_planai` = `"+ planoId + "`";
	}
}