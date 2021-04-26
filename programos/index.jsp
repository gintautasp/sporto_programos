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
	
	CrudXY crud_programos = new CrudXY ( db_mysql, "programos", lent_programos );
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
		</style>
		 
		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		<script>
			<%= crud_programos.jsRedagavimui ( "id_programos" ) %> 
			<%= crud_programos.jsValymui() %>
			<%= crud_programos.jsTrynimui ( "programos" ) %>
		</script>
	</head>
<body>
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
		
			String rec_data = "";
			
			AssocArrayList lst_row_fields = crud_programos.db_mysql.giveSelectedRow();
		
			for ( int i = 1; i < lauk_programos.length; i++ ) {
				rec_data += " data-"  + ( lent_programos [ i ] )   + "=\"" +  ( ( String ) lst_row_fields.giveMe (  lent_programos [ i ]  ) ) + "\"";
			}
			String id_rec =  ( String ) lst_row_fields.giveMe (   "id"  );
%>
<tr>
	<td>
		<input type="button" class="record_edit"  id="toEdit_<%= id_rec  %>" data-id_gal="<%= id_rec  %>"<%= rec_data %> value="&#9998;" onClick="iRedagavima( <%= id_rec %> )">
		<input type="button" class="delete"  id="toDelete_<%= id_rec  %>" data-id_gal="<%= id_rec %>" value="&#10007;" onClick="iTrinima( <%= id_rec %> )">
	</td>

<%
		for ( int i = 1; i < lauk_programos.length; i++ ) {
%>
	<td><%=  lst_row_fields.giveMe (  lent_programos [ i ]  ) %></td>
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