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
	
	String[] lent_pratimai = { "id", "pav", "pastabos", "lygis_sunkumo", "id_kito_lygio" };
	String[] lauk_pratimai = new String [ lent_pratimai.length ];
	
	DbMySql db_mysql = new DbMySql();
	
	CrudXY crud_pratimai = new CrudXY ( db_mysql, "pratimai", lent_pratimai );
	try { 
	
		QuerySaveResult qrs = new QuerySaveResult();
		String add = request.getParameter ( "add" ); 		
	
		if ( ( ( add  ) != null ) && add.equals ( "saugoti" ) ) {
		
			String id_pratimai = request.getParameter ( "id_pratimai" );
			// out.println ( "id pratimai.: ." + id_pratimai + "." );			
		
			for ( int i = 1; i<lent_pratimai.length; i++ ) {
			
				lauk_pratimai [ i ] = request.getParameter ( lent_pratimai [ i ] );
			}
			qrs = crud_pratimai.save ( id_pratimai, lauk_pratimai );	
		 } 
		 
		String del;
	
		if ( ( ( del = request.getParameter ( "del" )  ) != null ) && del.equals ( "del1rec" ) ) {
		
			String id_pratimai = request.getParameter ( "p_del" );
			// out.println ( "id pratimai.: ." + id_pratimai + "." );		
			qrs = crud_pratimai.delete ( id_pratimai );
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
			<%= crud_pratimai.jsRedagavimui ( "id_pratimai" ) %> 
			<%= crud_pratimai.jsValymui() %>
			<%= crud_pratimai.jsTrynimui ( "pratimai" ) %>
		</script>
	</head>
<body>
<form method="post" action="">
	<table>
		<tr>
			<th>ID</th>
			<td>
				<input id="id" type="text" name="id" required>
			</td>
		</tr>
		<tr>
			<th>Pavadinimas</th>
			<td>
				<input id="pav" type="text" name="pav" required>
			</td>
		</tr>
		<tr>
			<th>Pastabos</th>
			<td>
				<input id="pastabos" type="text" name="pastabos" required>
			</td>
		</tr>
		<tr>
			<th>Sunkumo lygis</th>
			<td>
				<input id="lygis_sunkumo" type="text" name="lygis_sunkumo" required>
			</td>
		</tr>	
		<tr>
			<th>x</th>
			<td>
				<input id="id_kito_lygio" type="text" name="id_kito_lygio" required>
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
	<input type="hidden" id="id_pratimai" name="id_pratimai" value="0">
	<input type="hidden" id="alert" name="alert" value="0">
</form>
<table align="center">
<tr>
</tr>
<tr>	<th>ID</th>
	<th>Pavadinimas</th>
	<th>Pastabos</th>
	<th>Sunkumo lygis</th>
	<th>X</th>
	<th>Veiksmai</th>
</tr>
<%
	try {
	
		String sql = crud_pratimai.select( "" );
		 
		while( crud_pratimai.db_mysql.flag_got_rows ) {
		
			String rec_data = "";
			
			AssocArrayList lst_row_fields = crud_pratimai.db_mysql.giveSelectedRow();
		
			for ( int i = 1; i < lauk_pratimai.length; i++ ) {
				rec_data += " data-"  + ( lent_pratimai [ i ] )   + "=\"" +  ( ( String ) lst_row_fields.giveMe (  lent_pratimai [ i ]  ) ) + "\"";
			}
			String id_rec =  ( String ) lst_row_fields.giveMe (   "id"  );
%>
<tr>
	

<%
		for ( int i = 0; i < lauk_pratimai.length; i++ ) {
%>
	<td><%=  lst_row_fields.giveMe ( lent_pratimai [ i ]  ) %></td>
<%
		}
%>
	<td>
		<input type="button" class="record_edit"  id="toEdit_<%= id_rec  %>" data-id_gal="<%= id_rec  %>"<%= rec_data %> value="&#9998;" onClick="iRedagavima( <%= id_rec %> )">
		<input type="button" class="delete"  id="toDelete_<%= id_rec  %>" data-id_gal="<%= id_rec %>" value="&#10007;" onClick="iTrinima( <%= id_rec %> )">
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