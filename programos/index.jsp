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


	String[] lent_programos = { "id", "pav", "trukme", "aprasymas" };
	String[] lauk_programos = new String [ lent_programos.length ];

	DbMySql db_mysql = new DbMySql();

	CrudXYsimple crud_programos = new CrudXYsimple ( db_mysql, "programos", lent_programos );
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
			nav {
				width: 700px;
				text-align: center;
				margin: 12px auto;
			}
			nav a {
				display: inline-block;
				border: 1px solid brown;
				background: yellow;
				padding: 12px;
				margin: 12px;
			}
			nav a:hover {
				background: lightgreen;
			}
		</style>
		<script>
			<%= crud_programos.jsRedagavimui ( "id_programos" ) %>
			<%= crud_programos.jsValymui() %>
			<%= crud_programos.jsTrynimui ( "programos" ) %>
		</script>
	</head>
<body>
<nav>
<%
	
	for (Meniu m : Meniu.values()) {
		//System.out.printf("Your weight on %s is %f%n", p, p.surfaceWeight(mass));
%>
		<a href="<%= m.itemurl() %>"><%= m %></a>
<%
	}
%>
</nav>
<form method="post" action="">
	<table>
		<tr>
			<th>Pavadinimas</th>
			<td>
				<input id="pav" type="text" name="pav" required>
			</td>
		</tr>
		<tr>
			<th>Trukmė</th>
			<td>
				<input id="trukme" type="text" name="trukme" required>
			</td>
		</tr>
		<tr>
			<th>Aprašymas</th>
			<td>
				<input id="aprasymas" type="text" name="aprasymas" required>
			</td>
		</tr>
		<tr>
			<td>
			</td>
			<td>
				<input type="button" name="clear" value="valyti" onClick = "iValyma()">
				<input type="submit" name="add" value="saugoti">
			</td>
		</tr>
	</table>
	<input type="hidden" id="id_programos" name="id_programos" value="0">
	<input type="hidden" id="alert" name="alert" value="0">
</form>
<table align="center">
<tr>
</tr>
<tr>
	<th>Veiksmai</th>
	<th>Pavadinimas</th>
	<th>Trukme</th>
	<th>Aprasymas</th>
</tr>
<%
	try {

		String sql = crud_programos.select( "" );

		while( crud_programos.db_mysql.flag_got_rows ) {
		
			AssocArrayList lst_row_fields = crud_programos.db_mysql.giveSelectedRow();
%>
<tr>
	<td>
		<input type="button" class="record_edit" <%= crud_programos.getDataList() %> value="&#9998;" onClick="iRedagavima( <%= lst_row_fields.giveMe (  "id" ) %> )">
		<input type="button" class="delete" value="&#10007;" onClick="iTrinima( <%= lst_row_fields.giveMe (  "id" ) %> )">
	</td>
	<td>
		<%= crud_programos.htmlRecRow ( "</td><td>", lst_row_fields ) %>
	</td>
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
