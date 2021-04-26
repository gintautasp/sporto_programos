
	package commons;

	import java.sql.DriverManager;
	import java.sql.ResultSet;
	import java.sql.Statement;
	import java.sql.Connection;

	public class DbMySql {
	
		public String driverName = "com.mysql.jdbc.Driver";
		public String connectionUrl = "jdbc:mysql://localhost:3306/";
		public String dbName = "sporto_programos";
		public String userId = "root";
		public String password = "";
		
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
		
		public boolean select ( String query_name, String sql_select,  String[] row_columns ) {
			
			row_cols = row_columns;
		
			try {			
				
				statements.addSet ( query_name, connection.createStatement() );
				result_select = ( ( Statement ) statements.giveMe ( query_name) ).executeQuery ( sql_select );
				flag_got_rows = result_select.next();
			
			} catch ( Exception e ) {
			
				System.out.println ( "Can't execute query" );						
			}
			
			return flag_got_rows;
		}
		
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