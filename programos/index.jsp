<!DOCTYPE html>
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page language="java" import="commons.AssocArrayList" %>
<%@page language="java" import="commons.QuerySaveResult" %>
<%@page language="java" import="commons.CrudXY" %>
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
	CrudXY crud_programos = new CrudXY ( "programos", lent_programos );
	try { 
	
		QuerySaveResult qrs = new QuerySaveResult();
		String add = request.getParameter ( "add" ); 		
	
		if ( ( ( add  ) != null ) && add.equals ( "saugoti" ) ) {
		
			String id_galimybes = request.getParameter ( "id_programos" );
			// out.println ( "id programos.: ." + id_programos + "." );			
		
			for ( int i = 1; i<lent_programos.length; i++ ) {
			
				lauk_programos [ i ] = request.getParameter ( lent_programos [ i ] );
			}
			qrs = crud_galimybes.save ( id_programos, lauk_programos );	
		 } 
		 
		String del;
	
		if ( ( ( del = request.getParameter ( "del" )  ) != null ) && del.equals ( "del1rec" ) ) {
		
			String id_galimybes = request.getParameter ( "p_del" );
			// out.println ( "id programos.: ." + id_programos + "." );		
			qrs = crud_galimybes.delete ( id_programos );
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
			<%= crud_galimybes.jsRedagavimui ( "id_programos" ) %> 
			<%= crud_galimybes.jsValymui() %>
			<%= crud_galimybes.jsTrynimui ( "programos" ) %>
		</script>
	</head>
<body>
<form method="post" action="">
	<table>
		<tr>
			<th>Programos</th>
			<td>
				<input id="pav" type="text" name="pav" required>
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