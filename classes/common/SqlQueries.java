package library;

public class SqlQueries{
	
	public static String readTreniruociuPlanai(){
		
		return 	"SELECT * FROM `pratimai_treniruociu_planai`";
	}
	
	public static String insertTreniruociuPlanai(String pav){
		return "INSERT INTO "
			+	"`treniruociu_planai` "
			+	"(`pav`)" 
			+	"VALUES ("
			+ 	"'"  + pav + "'"
			+	")";
	}
	
	public static String deleteTreniruociuPlanai(String id){
		return "DELETE FROM `treniruociu_planai` "
			+	"WHERE `treniruociu_planai`.`id` = `" + id + "`";
	}
	
	public static String updateCharacterSheet(String id, String pav){
		return 	"UPDATE `characters`"
			+	"SET"
			+		"`pav` = '" + pav + "'"
			+	"WHERE `treniruociu_planai`.`id` =`" + id + "`";
	}
	
}