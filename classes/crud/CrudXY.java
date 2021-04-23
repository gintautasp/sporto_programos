
	package crud;

	public class CrudXY extends Crudx {
		
		public CrudXY() {
		}
		
		public CrudXY ( String lentele, String[] laukeliai ) {
			
			super( lentele, laukeliai );
		}
		
		public QuerySaveResult save ( String id_rec, String[] fields_rec ) {
			
			QuerySaveResult qrs = new QuerySaveResult();

			if  ( (  id_rec == null ) || ( id_rec.equals ( "0" ) ) ) {																																	// Miestai miestas = new Miestai ( lent_miestu );
		
				qrs = insert ( fields_rec );
				
			} else {
			
				fields_rec [ 0 ] = id_rec;

				String salyga = " `id`=" + id_rec;
				
				qrs = update ( fields_rec, salyga );
			}			
			return qrs;
		} 
		
		public String jsTrynimui ( String pav_iraso ) {
			
			String js_funkcja_i_trynima = "function iTrinima ( id_rec ) {\n\n"
			
				+ "mygtukasEdit = document.getElementById ( 'toEdit_' + id_rec );\n\n"

				+ "pav =  mygtukasEdit.dataset.pav;\n\n"
				
				+ "var r = confirm( 'Ar norite pasalinti " + pav_iraso + " ' + pav + '?' );\n\n"
				
				// + "alert( r )\n\n"
				// + "alert ( r == true )\n\n"
				
				+ "if ( r == true ) {\n\n"

				// +	"alert( id_rec + '1' )\n"
				+	"document.getElementById ( 'm_del' ).value = id_rec\n"
				// +	"alert( id_rec  + '2' )\n"
				+	"forma_del = document.getElementById ( 'del_rec' )\n"
				//+	"alert( forma_del );\n"
				+	"forma_del.submit();\n"
				+	"}\n"
			+ "}\n";
			
			return js_funkcja_i_trynima;
		}
		
		public String jsValymui () {
		
			String js_funkcija_i_valyma = "function iValyma () {\n\n";

			for ( int i = 1; i < laukai.length; i++ ) {
																																								
				js_funkcija_i_valyma += "document.getElementById( '" + laukai [ i ] + "' ).value =  \"\"\n";
	
			}
			js_funkcija_i_valyma += "}\n";
			
			return js_funkcija_i_valyma;
		}
		
		public String jsRedagavimui ( String id_id ) {
			
			String js_funkcija_i_redagavima = 
			
				"\tfunction iRedagavima ( id_rec ) {\n\n"
			
					+ "\t\tif ( mygtukas = document.getElementById ( 'toEdit_' + id_rec ) ) {\n";

			for ( int i = 1; i < laukai.length; i++ ) {

				js_funkcija_i_redagavima += "\t\t\tdocument.getElementById( '" + laukai [ i ] + "' ).value =  mygtukas.dataset." + laukai [ i ] + ";\n";

			}
			js_funkcija_i_redagavima += "\t\t}\n";					
			js_funkcija_i_redagavima += "\t\tdocument.getElementById ( '" + id_id +"' ).value = id_rec;\n";
			js_funkcija_i_redagavima +=
				"\t}\n"
			;
			return js_funkcija_i_redagavima;
		}
	}