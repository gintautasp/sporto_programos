
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
	}