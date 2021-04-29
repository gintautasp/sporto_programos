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
	
	String[] lent_klientai = { "id", "pav", "amzius", "ugis","lytis","svoris","pasiruosimo_lygis","traumos_ligos" };
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
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<link rel="stylesheet" href="/resources/demos/style.css">
		<link href="../ext/jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet">
		<style>
			body{
				background-image: url("../pratimai/commons/svoris.jpg");
				background-repeat: no-repeat;
				background-size: cover;
				background-color: #000000
			}
			@font-face {
				font-family: 'Race Sport Free Regular';
				font-style: normal;
				font-weight: normal;
				src: local('Race Sport Free Regular'), url(../pratimai/RaceSport-nR1j0.woff) format('woff');
			}
			.font-face {
				font-family: 'Race Sport Free Regular';
				font-style: normal;
				font-weight: normal;
				src: local('Race Sport Free Regular'), url(../pratimai/RaceSport-nR1j0.woff) format('woff');
			table {
				border-radius:6px;
			}
			th, td {
				text-align: center;
				font-weight: bold;
				border-radius:6px;
				background-color: #9370DB;
			}
			mygtukas{
				background-color: #D8BFD8;
				border: none;
				color: black;
				padding: 7px 10px;
				text-align: center;
				text-decoration: none;
				display: inline-block;
				font-size: 20px;
				margin: 4px 2px;			
			ul {
				list-style-type: none;
				margin: 0;
				padding: 0;
				overflow: hidden;
				background-color: #333;
				position: -webkit-sticky; /* Safari */
				position: sticky;
				top: 0;
			}
			li {
				float: left;
			}
			li a {
				display: block;
				color: white;
				text-align: center;
				padding: 14px 16px;
				text-decoration: none;
			}

			li a:hover {
				background-color: #111;
			}

			.active {
				background-color: #4CAF50;
			}
		</style>
		 
		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="../ext/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
		<script>
			<%= crud_klientai.jsRedagavimui ( "id_klientai" ) %> 
			<%= crud_klientai.jsValymui() %>
			<%= crud_klientai.jsTrynimui ( "programos" ) %>
		</script>
		<script>
		
			 if ( window.history.replaceState ) {  							//perkrovus puslapį išmeta išsaugotą vedimo info 
				
				window.history.replaceState( null, null, window.location.href ); 
			}  
		</script>
	</head>
<body>
<ul>
  <li><a class="font-face" href="#pagrindinis">Pagrindinis</a></li>
  <li><a class="font-face" href="#paskyra">Vartotojas</a></li>
  <li><a class="font-face" href="#planai">Planai</a></li>
  <li><a class="font-face" href="#pratimai">Pratimai</a></li>
  <li><a class="font-face" href="#mityba">Mityba</a></li>
  <li><a class="font-face" href="#naujienos">Naujienos</a></li>
  <li><a class="font-face" href="#kontaktai">Kontaktai</a></li>
  <li><a class="font-face" href="#apie">Apie</a></li>
</ul>

<h2 align="center" class="font-face" style="color: #fff;font-size:42px;"><strong>Klientai</strong></h2>
<form method="post" action="">
<table style="border: 5px solid black" id="listKlientai" class="font-face">
		<!-- Apacia -->	
		<tr>		<th >Kliento vardas	</th>	<td>	<input type="text" name="pav" value="Vardas Pavardė" id="pav" class="text ui-widget-content ui-corner-all">								</td></tr>
		<tr>		<th >Amžius		</th>	<td>	<input type="number" name="amzius" value="1" id="amzius" class="text ui-widget-content ui-corner-all">									</td></tr>
		<tr>		<th >Ūgis cm		</th>	<td>	<input type="number" name="ugis" value="1" id="ugis" class="text ui-widget-content ui-corner-all">										</td></tr>
		<tr>		<th >Lytis			</th>	<td>	<select name="lytis" id="lytis" class="text ui-widget-content ui-corner-all">
												<option value="" selected disabled hidden>Pasirinkite lytį</option>
												<option value="Vyras">Vyras</option>
												<option value="Moteris">Moteris</option> </select>																		</td></tr>
		<tr>		<th >Svoris kg		</th>	<td ><input type="number" name="svoris" value="1" id="svoris" class="text ui-widget-content ui-corner-all">									</td></tr>
		<tr>		<th >Pasiruošimo lygis	</th>	<td ><input type="text" name="pasiruosimo_lygis" value="(val/sav) / pask. metus" id="pasiruosimo_lygis" class="text ui-widget-content ui-corner-all">		</td></tr>
		<tr>		<th >Traumos bei ligos	</th>	<td ><input type="text" name="traumos_ligos" value="Atkreiptinos traumos/ligos" id="traumos_ligos" class="text ui-widget-content ui-corner-all">			</td></tr>
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
<table style="padding: 2px; margin: 10px; margin-left: auto; margin-right: auto">
<tr>
</tr>
<tr class="font-face">
	<th >Veiksmai</th>
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
<tr style="background-color: #DEB887; padding: 1px ">
	<td>
		<input type="button" class="record_edit"  id="toEdit_<%= id_rec  %>" data-id_gal="<%= id_rec  %>"<%= rec_data %> value="&#9998;" onClick="iRedagavima( <%= id_rec %> )">
		<input type="button" class="delete"  id="toDelete_<%= id_rec  %>" data-id_gal="<%= id_rec %>" value="&#10007;" onClick="iTrinima( <%= id_rec %> )">
	</td>

<%
		for ( int i = 1; i < lauk_klientai.length; i++ ) {
%>
	<td class="font-face" style="color:#fff"><%=  lst_row_fields.giveMe (  lent_klientai [ i ]  ) %></td>
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