
	package crud;
	
	import commons.*;

	public class CrudXY extends Crudx {
		
		public CrudXY() {
		}
		
		public CrudXY ( DbMySql db_mysql, String lentele, String[] laukeliai ) {
			
			super( db_mysql, lentele, laukeliai );
		}
		
		public QuerySaveResult save (  String id_rec, String[] fields_rec ) {
			
			QuerySaveResult qrs = new QuerySaveResult();

			if  ( (  id_rec == null ) || ( id_rec.equals ( "0" ) ) ) {																			
		
				qrs = this.insert ( fields_rec );
				
			} else {
			
				fields_rec [ 0 ] = id_rec;

				String salyga = " `id`=" + id_rec;
				
				qrs = this.update ( fields_rec, salyga );
			}			
			return qrs;
		}
		
		public String getListAsOptions ( String table, String field_value, String field_name  ) {
			
			String sql_list = "SELECT `" + field_value + "`, `"  + field_name + "` FROM `" + table + "` WHERE 1";
			String options = "";
			
			try {
				
				String [] fields = { field_value, field_name };
				db_mysql.select ( "list_options", sql_list, fields );
				
				while ( db_mysql.flag_got_rows ) {
					
					AssocArrayList option  = db_mysql.giveSelectedRow();
					
					options += "<option value=\"" + option.giveMe ( field_value ) + "\">" +  option.giveMe ( field_name  ) + "</option>";
				}
				
			} catch(Exception e){

			}
			
			return options;
		}
	}