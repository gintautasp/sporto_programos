<!DOCTYPE html>
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.text.*,java.util.*,java.io.BufferedReader,java.io.IOException,java.io.FileReader,pratimai.Pratimai" %>
<html>
	<head>
		<meta charset="utf-8">
		<link href="../ext/jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet">
		<style>
			body{
				background-image: url("commons/svoris.jpg");
				background-repeat: no-repeat;
				background-size: cover;
				background-color: #000000
			}			
			@font-face {
				font-family: 'Race Sport Free Regular';
				font-style: normal;
				font-weight: normal;
				src: local('Race Sport Free Regular'), url('RaceSport-nR1j0.woff') format('woff');
			}
			.font-face {
				font-family: 'Race Sport Free Regular';
				font-style: normal;
				font-weight: normal;
				src: local('Race Sport Free Regular'), url('RaceSport-nR1j0.woff') format('woff');
			}
			table {
				
				border-radius:6px;
			}
			td, th {
				text-align: center;
				font-weight: bold;
				border-radius:6px;
				background-color: #9370DB;
				
			}
			.button {
				background-color: #D8BFD8;
				border: none;
				color: black;
				padding: 5px 15px;
				text-align: center;
				text-decoration: none;
				display: inline-block;
				font-size: 20px;
				margin: 0px 0px;
				transition-duration: 0.4s;
			
			}
			.button:hover {
				background-color: #555555;
				color: white;
			}
			.dialog-link{
				color: black;
			}
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="../ext/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
	
	<script>
	$( document ).ready ( function() {
	
		pratimai = { id_raumenys: 0, id_pratimai: 0, id: 0 };
	
		$( '.edit' ).click ( function() {
		
			pratimai.id 				= $( this ).data( 'id' );	
			pratimai.id_raumenys			= $( this ).data( 'id_raumenys' );
			pratimai.id_pratimai 			= $( this ).data( 'id_pratimai' );
			
			$( '#id' ).val ( pratimai.id );				
			$( '#id_raumenys' ).val ( pratimai.id_raumenys );
			$( '#id_pratimai' ).val ( pratimai.id_pratimai );
					
		});
		
		$( '.remove' ).click( function() {
						
			pratimai.id  = $( this ).data ( 'id' );
									
			alert(pratimai.id);
			
			$( '#pratimai2_idx' ).val ( pratimai.id  );
			
			$( '#remove' ).submit();
			
		});
			
		$( "#dialog" ).dialog({
			autoOpen: false,
			width: 500,
			buttons: [
			{
				text: "Ok",
				click: function() {
				$('#duomenys').submit();
				}
			},
				{
				text: "Cancel",
				click: function() {
				$( this ).dialog( "close" );
				}
			}
			]
		});
		$( ".dialog-link" ).each(function( event ) {
			$(this).click(function(){
				$( "#dialog" ).dialog( "open" );
					//event.preventDefault();
				});
			});
	});

	
	</script>	
	</head>
<body>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "sporto_programos";
	String userid = "root";
	String password = "";

	Connection connection = null;
	Statement statement = null, statement_change = null;
	ResultSet resultSet = null;
	int resultSetChange = 0;

%>

<ul>
  <li><a class="font-face" href="#pagrindinis">Pagrindinis</a></li>
  <li><a class="font-face" href="http://localhost:8080/sporto_programos/klientai/index.jsp">Vartotojas</a></li>
  <li><a class="font-face" href="http://localhost:8080/sporto_programos/trenyruociu-planai/index.jsp">Planai</a></li>
  <li><a class="font-face" href="http://localhost:8080/sporto_programos/pratimai/index.jsp">Pratimai</a></li>
  <li><a class="font-face" href="#mityba">Mityba</a></li>
  <li><a class="font-face" href="#naujienos">Naujienos</a></li>
  <li><a class="font-face" href="#kontaktai">Kontaktai</a></li>
  <li><a class="font-face" href="#apie">Apie</a></li>
</ul>

<h2 align="center" class="font-face" style="color: #fff;font-size:42px;"><strong>Pratimai-Raumenys</strong></h2>

<table align="center" cellpadding="4" cellspacing="2">
<tr>

</tr>
<tr>
	<th class="font-face">Id</th>
	<th class="font-face">Id Raumenys</th>
	<th class="font-face">Id Pratimai</th>	
	<th class="font-face">Veiksmai</th>
	
</tr>
<%
	Pratimai pratimai   = new Pratimai();
	Pratimai pratimai2 = new Pratimai();
	try{	     
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");	
		
		
	} catch(Exception e) {}

	try{ 	
		String jdbcutf8 = "";
		connection = DriverManager.getConnection ( connectionUrl + dbName + jdbcutf8, userid, password );
		
		String add;		
		
		if ( ( ( add = request.getParameter("add")  ) != null ) && add.equals ( "papildyti" ) ) {
				
			pratimai.lygis_sunkumo = Integer.parseInt(request.getParameter("id_raumens"));	
			pratimai.id_kito_lygio = Integer.parseInt(request.getParameter("id_pratimai"));	
			pratimai.id = Integer.parseInt(request.getParameter("id"));
			
			String sql_ins ="";    
						
			if (pratimai.id !=0){	
			
				sql_ins=
					"UPDATE `pratimai_raumenys` SET `id`" 
					+ '=' + "'" + pratimai.id+ "'" 
					+ ","	+"`id_pratimai`"			+ '=' + "'" + pratimai.id_pratimai 			+ "'" 
					+ ","	+"`id_raumens`" 			+ '=' + "'" + pratimai.id_raumenys 		+ "'" 
					+ ","	+"WHERE 1;";
			} else {
			
				sql_ins = 
					"INSERT INTO `pratimai`"
					+ " ( `id`, `id_raumens`, `id_pratimai`)"
					+ " VALUES ( "			
					+ "'" 		+ pratimai.pav +"'"
					+ "," + "'" + pratimai.id_pratimai +"'"
					+ "," + "'" + pratimai.id_raumens +"'"
					
					+ " )";

			out.println ( sql_ins );

				statement_change = connection.createStatement();
				resultSetChange = statement_change.executeUpdate(sql_ins);			
			
			}  
		}
			statement=connection.createStatement();		
			String sql ="SELECT `pratimai_raumenys`.`id`,`pratimai`.`id` AS `id_pratimai`"
						+",`pratimai`.`pav` AS `pratimo_pavadinimas`,`raumenys`.`pav` AS `raumens_pavadinimas`						
						+"FROM `pratimai_raumenys`"
						+"JOIN `pratimai` ON ( `pratimai_raumenys`.`id_pratimai`=`pratimai`.`id` ) "
						+"JOIN `raumenys` ON ( `pratimai_raumenys`.`raumenys.id`= `raumenys`.`id` )"
						+" WHERE 1";

						
						
			resultSet = statement.executeQuery(sql);
			
			
			
			String remove= "";
			
			if  ( ( ( remove = request.getParameter("trinti")  ) != null ) && remove.equals ( "trinti" ) ){
				
				String sql_ins;
											
				String pratimai2_id=request.getParameter("pratimai2_idx");
				System.out.println(pratimai2_id);
					sql_ins=
						"DELETE FROM `pratimai` WHERE `pratimai`.`id` = "+ "'" + pratimai2_id + "'" +";";
						
				System.out.println(sql_ins);	
				statement=connection.createStatement();
				int istrinta=statement.executeUpdate(sql_ins);		
			
			 }	
			
			while( resultSet.next() ){
		
			pratimai2.lygis_sunkumo = Integer.parseInt(resultSet.getString ( "id_raumens" ));
			pratimai2.id_kito_lygio = Integer.parseInt(resultSet.getString ( "id_pratimai" ));
			pratimai2.id = Integer.parseInt(resultSet.getString("id"));
%>
<tr style="background-color: #DEB887" >
	<td style="color:#fff"><%=resultSet.getString ("id" ) %></td>
	<td style="color:#fff"><%=resultSet.getString ( "id_raumens" ) %></td>
	<td style="color:#fff"><%=resultSet.getString ( "id_pratimai" ) %></td>
	<td><input class="dialog-link button5 edit ui-corner-all ui-widget button redagavimas" data-pav="<%=pratimai2.pav%>" data-pastabos="<%=pratimai2.pastabos%>" data-lygis_sunkumo="<%=pratimai2.lygis_sunkumo%>" data-id_kito_lygio="<%=pratimai2.id_kito_lygio%>" data-id="" type="button" value="&#9881" id="keiciam">
		<input class="ui-corner-all ui-widget button button5 remove" data-id="<%=pratimai2.id%>" type="button" value="&#9747;">
</tr>

<% 		
		}
		}catch (Exception e) {
	
			e.printStackTrace();
			
		}	
		
		
%>

</table>
<div align="center">
<input class="button5 ui-corner-all ui-widget dialog-link button font-face" data-id="" type="button" value="Prideti">
</div>
<center>

<div id="dialog" title="Pavadinimas">
	<form method="post" action="">
	<table align="center" cellpadding="5" cellspacing="5" >
<tr>	
	<th>Pratimas</th>
	<th>Raumuo</th>
</tr>

<tr>
	<td>
		<input type="text" name="pav" id="pav" value="">
	</td>
	<td>
		<input type="text" name="pastabos" id="pastabos" value="">
	</td>	
	</tr>
	</table>
	<input type="hidden" name="add" value="papildyti" class="ui-button ui-corner-all ui-widget">
	<input type="hidden" class="edit" id="pratimai2_id" name="pratimai2_id" value="0">
	</form>
</div>


<form method="post" action="" id="remove">
<input type="hidden" class="edit" id="pratimai2_idx" name="pratimai2_idx" value="1">
<input type="hidden" name="trinti" id="trinti" value="trinti">
</form>
</center>
</body>