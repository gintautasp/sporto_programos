
	package crud;

	import commons.*;

	public class Crudx {

		public String lent;
		public String[] laukai;
		public String[] n_pav;
		public String sal;
		public DbMySql db_mysql;
		public boolean res_select;

		public Crudx() {
		}

		public Crudx ( DbMySql db_mysql, String lentele, String[] laukeliai ) {

			super();

			lent = lentele;
			laukai = laukeliai;
			this.db_mysql = db_mysql;
		}

		public QuerySaveResult delete ( String id_trinamo ) {

			QuerySaveResult qrs = new QuerySaveResult();
			qrs.query_save = "DELETE"

						+ " FROM"
							+ " `" + lent + "` "
					;
			qrs.query_save += " WHERE `id`=" + id_trinamo
					;
			qrs.flag_result_save = db_mysql.update ( "delete", qrs.query_save );

			return qrs;
		}

		public String select ( String by ) {

			String comma = "";
			String sql_sel = "SELECT ";

			for ( int i = 0; i < laukai.length; i++ ) {

				sql_sel += comma + " `" + laukai [ i ] + "` ";
				comma = ",";
			}

			sql_sel 	+= " FROM"
					+ " `" + lent + "` "
					+ " WHERE "
							+ "1"
							+  by
				;
			res_select = db_mysql.select ( "select", sql_sel, laukai );

			return sql_sel;
		}

		public QuerySaveResult insert ( String[] reiksmes ) {

			QuerySaveResult qrs = new QuerySaveResult();
			qrs.query_save = "INSERT INTO " + " `" + lent + "` ( ";
			String comma = "";

			for ( int i = 1; i < laukai.length; i++ ) {

				qrs.query_save += comma  + " `" + laukai [ i ] + "` ";
				comma = ",";																													// sql_ins = sql_ins + "'" + Miestai.value + "'";
			}

			comma = "";
			qrs.query_save += ") VALUES ( ";

			for ( int i = 1; i < reiksmes.length; i++ ) {

				qrs.query_save += comma + " '" + reiksmes [ i ] + "' ";
				comma = ",";

			}
			qrs.query_save += " )";

			qrs.flag_result_save = db_mysql.update ( "insert", qrs.query_save );

			return qrs;
		}

		public QuerySaveResult update ( String[] reiksmes, String by ) {

			QuerySaveResult qrs = new QuerySaveResult();
			qrs.query_save = "UPDATE" + " `" + lent + "` SET\n ";

			String comma = "";

			for ( int i = 0; i < laukai.length; i++ ) {

				qrs.query_save += comma  + " `" + laukai [ i ] + "`='" + reiksmes [ i ] + "'\n";
				comma = ",";																													// sql_ins = sql_ins + "'" + Miestai.value + "'";
			}

			qrs.query_save += " WHERE " + by;

			qrs.flag_result_save = db_mysql.update ( "update", qrs.query_save );

			return qrs;
		}
	}
