	package crud;

	import java.util.ArrayList;

	public class AssocArrayList {
		
		public ArrayList<String> names;
		public ArrayList<Object> values;
		
		public AssocArrayList() {
			
			names = new ArrayList<String>();
			values = new ArrayList<Object>();
		}
		
		public void addSet ( String name, Object value ) {
			
			
			int num_in_list = names.indexOf ( name );
			
			if ( num_in_list == -1 ) {
		
				names.add ( name );
				values.add ( value );
			
			} else {
				
				values.set ( num_in_list, value );
			}
		}
		
		public Object giveMe ( String name ) {
			
			Object res = null;
			
			int num_in_list = names.indexOf ( name );
			
			if ( num_in_list != -1 ) {
		
				res = values.get ( num_in_list );			
			}
			return res;
		}
		
		public int length () {
			
			return names.size();
		}
	}