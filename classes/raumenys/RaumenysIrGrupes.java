
	package raumenys;

	import java.sql.DriverManager;
	import java.sql.ResultSet;
	import java.sql.Statement;
	import java.sql.Connection;

	public class RaumenysIrGrupes {


		public String pav;
		public int id_raumens;
		public int id_raumenu_grupes;
		public String raumenu_grupe;

		public RaumenuGrupes[] raumenu_grupes;
		public int kiek_raumenu_grupiu = 0;

		public RaumenysIrGrupes() {

		}

		public void pasiimtiRaumenuGrupes( Connection connection ) {

			try {

				Statement statement=connection.createStatement();
				String sql ="SELECT * FROM `raumenu_grupes`  WHERE 1";
				ResultSet resultSet = statement.executeQuery(sql);

				raumenu_grupes = new RaumenuGrupes [ 20 ];
				kiek_raumenu_grupiu = 0;

				while ( resultSet.next() ) {

					raumenu_grupes [ kiek_raumenu_grupiu ] = new RaumenuGrupes ( resultSet.getString ( "id" ), resultSet.getString ( "raumenu_grupe" ) );
					kiek_raumenu_grupiu++;
				}
			}  catch ( Exception e ) {

				e.printStackTrace();
			}
		}

		public int surastiRaumenuGrupesId( String raumenu_grupe_is_formos ) {

			int raumenu_grupes_id = 0;

			for ( int i  = 0; i < kiek_raumenu_grupiu; i++ ) {

				if ( raumenu_grupes [ i ].raumenu_grupe.equals ( raumenu_grupe_is_formos ) ) {

					raumenu_grupes_id = raumenu_grupes [ i ].id;
				}
			}
			return raumenu_grupes_id;
		}

		public int pridetiRaumenuGrupe( Connection connection, String raumenu_grupe ) {

			int id_raumenu_grupes = 0;

			try {

				String sql_ins =
				      "INSERT INTO `raumenu_grupes`"
				      + " ( `raumenu_grupe`)"
				      + " VALUES ( "
				      + "'" 	   	+ raumenu_grupe               +"'"
				      + " )";
				// out.println ( sql_ins );

				Statement statement_change = connection.createStatement();
				int resultSetChange = statement_change.executeUpdate(sql_ins);


				String sql_get_id = "SELECT LAST_INSERT_ID() AS `id_raumenu_grupes`";

				Statement statement_get_id = connection.createStatement();
				ResultSet resultSetGetId = statement_get_id.executeQuery ( sql_get_id );

				if ( resultSetGetId.next() ) {

					id_raumenu_grupes = Integer.parseInt ( resultSetGetId.getString ( "id_raumenu_grupes" ) );
				}

			} catch ( Exception e ) {

				e.printStackTrace();
			}
			return id_raumenu_grupes;
		}
	}
