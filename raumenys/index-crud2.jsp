<!DOCTYPE html>
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page language="java" import="commons.*" %>
<%@page language="java" import="crud.*" %>
<%
	try {

		request.setCharacterEncoding ( "UTF-8" );
		response.setContentType ( "text/html; charset=UTF-8" );
		response.setCharacterEncoding ( "UTF-8" );

	} catch ( Exception e ) {

		e.printStackTrace();
	}

	String[] lent_raumenys= { "id_raumens", "pav", "id_raumenu_grupes" };
	String[] lauk_raumenys = new String [ lent_raumenys.length ];

	DbMySql db_mysql = new DbMySql();

	CrudXY crud_raumenys = new CrudXY ( db_mysql, "raumenys", lent_raumenys);
	try {

		QuerySaveResult qrs = new QuerySaveResult();
		String add = request.getParameter ( "add" );

		if ( ( ( add  ) != null ) && add.equals ( "saugoti" ) ) {

			String id_raumens = request.getParameter ( "id_raumens" );
			// out.println ( "id programos.: ." + id_raumens + "." );

			for ( int i = 1; i<lent_raumenys.length; i++ ) {

				lauk_raumenys [ i ] = request.getParameter ( lent_raumenys[ i ] );
			}
			qrs = crud_raumenys.save ( id_raumens, lauk_raumenys );
		 }

		String del;

		if ( ( ( del = request.getParameter ( "del" )  ) != null ) && del.equals ( "del1rec" ) ) {

			String id_raumens = request.getParameter ( "p_del" );
			// out.println ( "id programos.: ." + id_raumens + "." );
			qrs = crud_raumenys.delete ( id_raumens );
		}

	}  catch ( Exception e ) {

		e.printStackTrace();
	}
%>
<html>
	<head>
		<meta charset="utf-8">
		<style>
			table {
				border-collapse: collapse;
			}
			form {
				float: right;
			}
			input {
				width: 111px;
			}
			th, td {
				padding: 3px 4px;
				border: 1px solid black;
			}
			th {
				background-color: #A52A2A;
			}
			td {
				background-color: #DEB887;
			}
		</style>

		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		<script>
			<%= crud_raumenys.jsRedagavimui ( "id_raumens" ) %>
			<%= crud_raumenys.jsValymui() %>
			<%= crud_raumenys.jsTrynimui ( "raumenys" ) %>
		</script>
	</head>
<body>
<form method="post" action="">
	<table style="border: 5px solid black" id="listRaumenys">
		<tr>		<th>Raumenu grupe				</th>	<td>	<input type="text" name="raumenu_grupe" value="Raumenų grupė" id="pav" class="text ui-widget-content ui-corner-all">		</td></tr>
		<tr>		<th>Raumens pavadinimas	</th>	<td>	<input type="text" name="pav" value="pav" id="id_raumens" class="text ui-widget-content ui-corner-all">									</td></tr>
				<input type="button" name="clear" value="valyti" onClick = "iValyma()">
				<input type="submit" name="add" value="saugoti">
			</td>
		</tr>
	</table>
	<input type="hidden" id="id_raumens" name="id_raumens" value="0">
	<input type="hidden" id="alert" name="alert" value="0">
</form>
<table align="center">
<tr>
</tr>
<tr>
	<th>Veiksmai</th>
	<th>Raumenu grupe</th>
	<th>Raumuo</th>
</tr>
<%
	try {

		String sql = crud_raumenys.select( "" );

		while( crud_raumenys.db_mysql.flag_got_rows ) {

			String rec_data = "";

			AssocArrayList lst_row_fields = crud_raumenys.db_mysql.giveSelectedRow();

			for ( int i = 1; i < lauk_raumenys.length; i++ ) {
				rec_data += " data-"  + ( lent_raumenys[ i ] )   + "=\"" +  ( ( String ) lst_row_fields.giveMe (  lent_raumenys[ i ]  ) ) + "\"";
			}
			String id_rec =  ( String ) lst_row_fields.giveMe (   "id"  );
%>
<tr>
	<td>
		<input type="button" class="record_edit"  id="toEdit_<%= id_rec  %>" data-id_gal="<%= id_rec  %>"<%= rec_data %> value="&#9998;" onClick="iRedagavima( <%= id_rec %> )">
		<input type="button" class="delete"  id="toDelete_<%= id_rec  %>" data-id_gal="<%= id_rec %>" value="&#10007;" onClick="iTrinima( <%= id_rec %> )">
	</td>

<%
		for ( int i = 1; i < lauk_raumenys.length; i++ ) {
%>
	<td><%=  lst_row_fields.giveMe (  lent_raumenys [ i ]  ) %></td>
<%
		}
%>
</tr>
<%
		}
	} catch ( Exception e ) {

		e.printStackTrace();
	}
%>
</table>
</body>
</html>
