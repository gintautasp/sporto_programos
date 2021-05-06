<%

	try {

		QuerySaveResult qrs = new QuerySaveResult();
		String add = request.getParameter ( "add" );

		if ( ( ( add  ) != null ) && add.equals ( "saugoti" ) ) {

			String id_programos = request.getParameter ( "id_programos" );
			// out.println ( "id programos.: ." + id_programos + "." );

			for ( int i = 1; i<lent_programos.length; i++ ) {

				lauk_programos [ i ] = request.getParameter ( lent_programos [ i ] );
			}
			qrs = crud_programos.save ( id_programos, lauk_programos );
		 }

		String del;

		if ( ( ( del = request.getParameter ( "del" )  ) != null ) && del.equals ( "del1rec" ) ) {

			String id_programos = request.getParameter ( "p_del" );
			// out.println ( "id programos.: ." + id_programos + "." );
			qrs = crud_programos.delete ( id_programos );
		}

	}  catch ( Exception e ) {

		e.printStackTrace();
	}
%>