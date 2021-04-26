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
	
	String[] lent_klientai = { "id", "pav", "amzius", "ugis","lytis","svoris","pasiruosimo_lygis","traumosLigos" };
	String[] lauk_klientai = new String [ lent_klientai.length ];
	
	DbMySql db_mysql = new DbMySql();
	
	CrudXY crud_klientai = new CrudXY ( db_mysql, "klientai", lent_klientai );
	try { 
	
		QuerySaveResult qrs = new QuerySaveResult();
		String add = request.getParameter ( "add" ); 		
	
		if ( ( ( add  ) != null ) && add.equals ( "saugoti" ) ) {
		
			String id_klientai = request.getParameter ( "id_klientai" );
			// out.println ( "id programos.: ." + id_klientai + "." );			
		
			for ( int i = 1; i<lent_klientai.length; i++ ) {
			
				lauk_klientai [ i ] = request.getParameter ( lent_klientai [ i ] );
			}
			qrs = crud_klientai.save ( id_klientai, lauk_klientai );	
		 } 
		 
		String del;
	
		if ( ( ( del = request.getParameter ( "del" )  ) != null ) && del.equals ( "del1rec" ) ) {
		
			String id_klientai = request.getParameter ( "p_del" );
			// out.println ( "id programos.: ." + id_klientai + "." );		
			qrs = crud_klientai.delete ( id_klientai );
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
			<%= crud_klientai.jsRedagavimui ( "id_klientai" ) %> 
			<%= crud_klientai.jsValymui() %>
			<%= crud_klientai.jsTrynimui ( "programos" ) %>
		</script>
	</head>
<body>
<form method="post" action="">
<table style="border: 5px solid black" id="listKlientai">
		<!-- Apacia -->	
		<tr>		<th>Kliento vardas	</th>	<td>	<input type="text" name="pav" value="Vardas Pavardė" id="pav" class="text ui-widget-content ui-corner-all">								</td></tr>
		<tr>		<th>Amžius		</th>	<td>	<input type="number" name="amzius" value="1" id="amzius" class="text ui-widget-content ui-corner-all">									</td></tr>
		<tr>		<th>Ūgis cm		</th>	<td>	<input type="number" name="ugis" value="1" id="ugis" class="text ui-widget-content ui-corner-all">										</td></tr>
		<tr>		<th>Lytis			</th>	<td>	<select name="lytis" id="lytis" class="text ui-widget-content ui-corner-all">
												<option value="" selected disabled hidden>Pasirinkite lytį</option>
												<option value="Vyras">Vyras</option>
												<option value="Moteris">Moteris</option> </select>																		</td></tr>
		<tr>		<th>Svoris kg		</th>	<td ><input type="number" name="svoris" value="1" id="svoris" class="text ui-widget-content ui-corner-all">									</td></tr>
		<tr>		<th>Pasiruošimo lygis	</th>	<td ><input type="text" name="pasiruosimo_lygis" value="(val/sav) / pask. metus" id="pasiruosimo_lygis" class="text ui-widget-content ui-corner-all">		</td></tr>
		<tr>		<th>Traumos bei ligos	</th>	<td ><input type="text" name="traumosLigos" value="Atkreiptinos traumos/ligos" id="traumosLigos" class="text ui-widget-content ui-corner-all">			</td></tr>
		<tr>
			<td colspan="2">
				
				<input type="button" name="clear" value="valyti" onClick = "iValyma()"> 
				<input type="submit" name="add" value="saugoti">
			</td>
		</tr>
	</table>
	<input type="hidden" id="id_klientai" name="id_klientai" value="0">
	<input type="hidden" id="alert" name="alert" value="0">
</form>
<table align="center">
<tr>
</tr>
<tr>
	<th>Veiksmai</th>
	<th>Pavadinimas</th>
	<th>Amžius</th>
	<th>Ūgis cm</th>
	<th>Lytis</th>
	<th>Svoris kg</th>
	<th>Pasiruošimo lygis</th>
	<th>Traumos bei ligos</th>
	
</tr>
<%
	try {
	
		String sql = crud_klientai.select( "" );
		 
		while( crud_klientai.db_mysql.flag_got_rows ) {
		
			String rec_data = "";
			
			AssocArrayList lst_row_fields = crud_klientai.db_mysql.giveSelectedRow();
		
			for ( int i = 1; i < lauk_klientai.length; i++ ) {
				rec_data += " data-"  + ( lent_klientai [ i ] )   + "=\"" +  ( ( String ) lst_row_fields.giveMe (  lent_klientai [ i ]  ) ) + "\"";
			}
			String id_rec =  ( String ) lst_row_fields.giveMe (   "id"  );
%>
<tr>
	<td>
		<input type="button" class="record_edit"  id="toEdit_<%= id_rec  %>" data-id_gal="<%= id_rec  %>"<%= rec_data %> value="&#9998;" onClick="iRedagavima( <%= id_rec %> )">
		<input type="button" class="delete"  id="toDelete_<%= id_rec  %>" data-id_gal="<%= id_rec %>" value="&#10007;" onClick="iTrinima( <%= id_rec %> )">
	</td>

<%
		for ( int i = 1; i < lauk_klientai.length; i++ ) {
%>
	<td><%=  lst_row_fields.giveMe (  lent_klientai [ i ]  ) %></td>
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