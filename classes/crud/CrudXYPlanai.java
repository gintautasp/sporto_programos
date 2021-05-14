
	package crud;
	
	import commons.*;

	public class CrudXYPlanai extends CrudXY {
		
		public CrudXYPlanai() {
		}
		
		public CrudXYPlanai ( DbMySql db_mysql, String lentele, String[] laukeliai ) {
			
			super( db_mysql, lentele, laukeliai );
		}
		
		public QuerySaveResult save (  String id_rec, String[] fields_rec ) {
			
			QuerySaveResult qrs = new QuerySaveResult();

			if  ( (  id_rec == null ) || ( id_rec.equals ( "0" ) ) ) {																																	// Miestai miestas = new Miestai ( lent_miestu );
		
				qrs = this.insert ( fields_rec );
				
			} else {
			
				fields_rec [ 0 ] = id_rec;

				String salyga = " `id`=" + id_rec;
				
				qrs = this.update ( fields_rec, salyga );
			}			
			return qrs;
		} 
		
		public String jsTrynimui () {
			String js_funkcja_i_trynima;
			
			js_funkcja_i_trynima = "var dialog_confirm,\n";
			js_funkcja_i_trynima += "dialog_confirm = $( '#dialog_confirm' ).dialog({\n";
			js_funkcja_i_trynima += "resizable: false,\n";
			js_funkcja_i_trynima += "height: 'auto',\n";
			js_funkcja_i_trynima += "width: 400,\n";
			js_funkcja_i_trynima += "modal: true,\n";
			js_funkcja_i_trynima += "buttons: {\n";
			js_funkcja_i_trynima += "	'Delete': function() {\n";
			js_funkcja_i_trynima += "		form.submit();\n";
			js_funkcja_i_trynima += "		$( this ).dialog( 'close' );\n";
			js_funkcja_i_trynima += "	},";
			js_funkcja_i_trynima += "	Cancel: function() {\n";
			js_funkcja_i_trynima += "		$( this ).dialog( 'close' );\n";
			js_funkcja_i_trynima += "	}\n";
			js_funkcja_i_trynima += "}\n";
			js_funkcja_i_trynima += "});\n";
			
			js_funkcja_i_trynima += "$( '.dialog-confirm' ).button().on( 'click', function() {\n";
			js_funkcja_i_trynima += "$('#id_planas').val($(this).data('id'));\n";
			js_funkcja_i_trynima += "$('#crud_action').val('del');\n";
			js_funkcja_i_trynima += "dialog_confirm.dialog( 'open' );\n";
			js_funkcja_i_trynima += "});\n";
			
			return js_funkcja_i_trynima;
		}
		
		public String jsRedagavimui () {
			String js_funkcija_i_redagavima;
			
			js_funkcija_i_redagavima = "var dialog\n";
			js_funkcija_i_redagavima += "dialog = $( '#dialog' ).dialog({\n";
			js_funkcija_i_redagavima += "autoOpen: false,\n";
			js_funkcija_i_redagavima += "height: 500,\n";
			js_funkcija_i_redagavima += "width: 500,\n";
			js_funkcija_i_redagavima += "modal: true,\n";
			js_funkcija_i_redagavima += "buttons: {\n";
			js_funkcija_i_redagavima += "	'Patvirtinti': pridetiPratima,\n";
			js_funkcija_i_redagavima += "	Cancel: function() {\n";
			js_funkcija_i_redagavima += "		dialog.dialog( 'close' );\n";
			js_funkcija_i_redagavima += "	}\n";
			js_funkcija_i_redagavima += "},\n";
			js_funkcija_i_redagavima += "close: function() {\n";
			js_funkcija_i_redagavima += "		form[ 0 ].reset();\n";
			js_funkcija_i_redagavima += "		allFields.removeClass( 'ui-state-error' );\n";
			js_funkcija_i_redagavima += "	}\n";
			js_funkcija_i_redagavima += "});\n";
			
			js_funkcija_i_redagavima += "$( '.dialog-link' ).button().on( 'click', function() {\n";
			js_funkcija_i_redagavima += "$('#id_planas').val($(this).data('id'));\n";
			js_funkcija_i_redagavima += "$('#pav').val($(this).data('pav'));\n";
			js_funkcija_i_redagavima += "$('#rusis').val($(this).data('rusis')).selectmenu('refresh');\n";
			js_funkcija_i_redagavima += "dialog.dialog( 'open' );\n";
			js_funkcija_i_redagavima += "});\n";
			
			return js_funkcija_i_redagavima;
		}
	}