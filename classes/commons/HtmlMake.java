
	package commons;
	
	import java.util.*;

	public class HtmlMake {
	
		public static String dataList ( AssocArrayList lst_row_fields ) {
			
			String data_list = "";

			for ( int i = 0; i < lst_row_fields.length(); i++ ) {

				data_list += " data-" + lst_row_fields.names.get ( i ) + "= \"" +  lst_row_fields.values.get ( i ) + "\"";
			}
			
			return data_list;
		}
		
		public static String optionsSelect ( ArrayList<AssocArrayList> list_from, String field_value, String field_name ) {
		
			String options = "";
			
			 for ( AssocArrayList opt_row : list_from ) {	

				options += "<option value=\"" + opt_row.giveMe ( field_value ) + "\">" + opt_row.giveMe ( field_name  ) + "</option>";
			}
			return options;
		}
	}