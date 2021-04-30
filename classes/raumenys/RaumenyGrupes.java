
	package raumenys;

	public class RaumenuGrupes {
		
		public int id;
		public String raumenu_grupe;
		
		public RaumenuGrupes() {
		}
		
		public RaumenuGrupes( String id_eil, String raumenu_grupe) {
			
			id = Integer.ParseInt ( id_eil );
			this.raumenu_grupe = raumenu_grupe;
		}		
	}