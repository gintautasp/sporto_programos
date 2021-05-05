
	package crud;
	
	import commons.*;

	public class CrudXYsimple extends CrudXY {
	
		public CrudXYsimple() {
		}
		
		public CrudXYsimple ( DbMySql db_mysql, String lentele, String[] laukeliai ) {
			
			super( db_mysql, lentele, laukeliai );
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
				+	"document.getElementById ( 'r_del' ).value = id_rec\n"
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
		
		public String htmlRecRow ( String glue, AssocArrayList lst_row_fields  ) {
			
			String html_rec_row = "";
			
			String gluex = "";
		
			for ( int i = 1; i < laukai.length; i++ ) {
				
				html_rec_row += gluex + lst_row_fields.giveMe (  laukai [ i ]  );
				gluex = glue;
			}			
			return html_rec_row;
		}
	}