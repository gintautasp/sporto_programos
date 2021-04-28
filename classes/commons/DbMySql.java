
	package commons;

	import java.sql.DriverManager;
	import java.sql.ResultSet;
	import java.sql.Statement;
	import java.sql.Connection;

	public class DbMySql {
	
		private String driverName = "com.mysql.jdbc.Driver";
		private String connectionUrl = "jdbc:mysql://localhost:3306/";
		private String dbName = "sporto_programos";
		private String userId = "root";
		private String password = "";
		
		public Connection connection;
		
		protected AssocArrayList statements;
		
		public String[] row_cols;
		public AssocArrayList row_values;
		
		public ResultSet result_select;
		public boolean flag_got_rows;
		
		public DbMySql() {
			
			try {
		
				connection = DriverManager.getConnection ( connectionUrl + dbName + "?useUnicode=yes&characterEncoding=UTF-8", userId, password );
				
			} catch ( Exception e ) {
				
				System.out.println ( "Can't connect to db" );
				// e.printTrace();
			}
			statements = new AssocArrayList();
			row_values = new AssocArrayList();
		}
		
		/**
		* vykdo standartinį veiksmą vykdantį java duomenų bazės update užklausą
		* @param String query_name - užklausos pavadinimas, bet kokia unikali eilutė, kad atskirti užklausų struktūras, užklausų struktūrų masyve, pvz.: įterpimas į lentelę
		* @param String sql_update - SQL užklausa vykdatnti duomenų keitimą, gali būti INSERT ..,  UPDATE .., ALTER .., RENAME .. ir pan.
		* @return int požymis 0 - užklausa vykdymas nesėkmingas arba 1 užklausos vykdymas sėkmingas
		*/
		public int update ( String query_name, String sql_update ) {
			
			int result_update = 0;
			
			try {
			
				statements.addSet ( query_name, connection.createStatement() );
				result_update = ( ( Statement ) statements.giveMe ( query_name ) ).executeUpdate ( sql_update );
			
			} catch ( Exception e ) {
			
				System.out.println ( "Can't execute update: " + sql_update );
			}
			return result_update;
		}
		
		/**
		* vykdo standartinį veiksmą vykdantį java duomenų bazės išrinimo užklausą SELECT, taip pat iškelia vėliavėlę nurodančią, kad rezultate yra gautų nepasiimtų eilučių .t.y. rezultatą po įvykdymo next() su ResultSet tipo objektu, 
		* @param String query_name - užklausos pavadinimas, bet kokia unikali eilutė, kad atskirti užklausų struktūras, užklausų struktūrų masyve, pvz.: įterpimas į lentelę
		* @param String sql_update - SQL užklausa vykdatnti duomenų keitimą, gali būti SELECT .. ir pan.  ?
		* @param String[]  row_columns - užklausos rezultatų lentelės stulpelių laukų pavadinimai, naudojami pasimant duomenis su giveSelectedRow
		*/		
		public boolean select ( String query_name, String sql_select, String[] row_columns ) {
			
			row_cols = row_columns;
		
			try {			
				
				statements.addSet ( query_name, connection.createStatement() );
				result_select = ( ( Statement ) statements.giveMe ( query_name) ).executeQuery ( sql_select );
				flag_got_rows = result_select.next();
			
			} catch ( Exception e ) {
			
				System.out.println ( "Can't execute query : " + sql_select );	
			}
			
			return flag_got_rows;
		}
		
		/**
		* paima eilutės duomenis,  iš rezultatų, gautų įvykdžius SELECT užklausą, metodo select pagalba, pagal stulpelių pavadinimus, kurie buvo nurodyti vykdant select metodą
		* @return AssocArrayList - eilutės laukų reikšmės
		*/
		public AssocArrayList giveSelectedRow() {
			
			try {
			
				if ( flag_got_rows ) {
				
					for ( int i = 0; i < row_cols.length; i++ ) {
			
						row_values.addSet ( row_cols [ i ], result_select.getString ( row_cols [ i ] ) );
					}
					flag_got_rows = result_select.next();
				}
			
			} catch ( Exception e ) {
			
				System.out.println ( "Can't get row fields" );
			}
			
			return row_values;
		}
	}