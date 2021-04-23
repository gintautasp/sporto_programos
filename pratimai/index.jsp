<!DOCTYPE html>
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.text.*,java.util.*,java.io.BufferedReader,java.io.IOException,java.io.FileReader,commons.Pratimai" %>
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
			.glow {
				font-size: 40px;
				font-family: arial;
				color: #fff;
				text-align: center;
				animation: glow 1s ease-in-out infinite alternate;
			}
			@-webkit-keyframes glow {
				from {
				text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #e60073, 0 0 40px #e60073, 0 0 50px #e60073, 0 0 60px #e60073, 0 0 70px #e60073;
				}to {
				text-shadow: 0 0 20px #fff, 0 0 30px #ff4da6, 0 0 40px #ff4da6, 0 0 50px #ff4da6, 0 0 60px #ff4da6, 0 0 70px #ff4da6, 0 0 80px #ff4da6;
				}
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
				padding: 7px 10px;
				text-align: center;
				text-decoration: none;
				display: inline-block;
				font-size: 20px;
				margin: 4px 2px;
			}
		</style>	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="../ext/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
	
	<script>
	$( document ).ready ( function() {
	
		pratimai = { pav: 0, pastabos: 0, lygis_sunkumo: 0, id_kito_lygio: 0, id: 0 };
	
		$( '.edit' ).click ( function() {
		
			pratimai.id 				= $( this ).data( 'id' );	
			pratimai.pav				= $( this ).data( 'pav' );
			pratimai.lygis_sunkumo 		= $( this ).data( 'lygis_sunkumo' );
			pratimai.id_kito_lygio 			= $( this ).data( 'id_kito_lygio' );
			pratimai.pastabos			= $( this ).data( 'pastabos' );
						
			$( '#pav' ).val ( pratimai.pav );
			$( '#pastabos' ).val ( pratimai.pastabos );
			$( '#lygis_sunkumo' ).val ( pratimai.lygis_sunkumo );
			$( '#id_kito_lygio' ).val ( pratimai.id_kito_lygio );
			$( '#id' ).val ( pratimai.id );			
		});
		
		$( '.remove' ).click( function() {
						
			pratimai.id  = $( this ).data ( 'id' );
								
			$( '#pratimai2_idx' ).val ( pratimai.id  );
			
			$( '#remove' ).submit();
			
		});
			
		$( "#dialog" ).dialog({
			autoOpen: false,
			width: 1010,
			buttons: [
			{
				text: "Ok",
				click: function() {
				$( this ).dialog( "close" );
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
<h2 class="glow" align="center"><strong>Pratimai</strong></h2>
<table align="center" cellpadding="4" cellspacing="2">
<tr>

</tr>
<tr>
	<th>Id</th>
	<th>Pratimas</th>
	<th>Pastabos</th>
	<th>Sunkumo lygis</th>
	<th>x</th>	
	<th>Veiksmai</th>
	
</tr>
<%
	Pratimai pratimai   = new Pratimai();
	//Pratimai pratimai2 = new Pratimai();
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
				
			pratimai.pav = request.getParameter("pav");
			pratimai.pastabos =request.getParameter("pastabos");
			pratimai.lygis_sunkumo = Integer.parseInt(request.getParameter("lygis_sunkumo"));	
			pratimai.id_kito_lygio = Integer.parseInt(request.getParameter("id_kito_lygio"));	
			pratimai.id = Integer.parseInt(request.getParameter("id"));
			
			String sql_ins ="";    
						
			if (pratimai.id !=0){	
			
				sql_ins=
					"UPDATE `pratimai` SET `id`" 
					+ '=' + "'" + pratimai.id+ "'" 
					+ ","	+"`pav`"					+ '=' + "'" + pratimai.pav 			+ "'" 
					+ ","	+"`pastabos`" 				+ '=' + "'" + pratimai.pastabos 		+ "'" 
					+ ","  +"`lygis_sunkumo`" 			+ '=' + "'" + pratimai.lygis_sunkumo 	+ "'" 
					+ ","	+"`id_kito_lygio`" 			+ '=' + "'" + pratimai.id_kito_lygio 	+ "'" 
					+ ","	+"WHERE 1;";
			} else {
			
				sql_ins = 
					"INSERT INTO `pratimai`"
					+ " ( `pav`, `pastabos`, `lygis_sunkumo`, `id_kito_lygio`)"
					+ " VALUES ( "			
					+ "'" 		+ pratimai.pav +"'"
					+ "," + "'" + pratimai.pastabos +"'"
					+ "," + "'" + pratimai.lygis_sunkumo +"'"
					+ "," + "'" + pratimai.id_kito_lygio +"'"
					+ " )";

			out.println ( sql_ins );

				statement_change = connection.createStatement();
				resultSetChange = statement_change.executeUpdate(sql_ins);			
			
			}  
		}
			statement=connection.createStatement();		
			String sql ="SELECT * FROM `pratimai`  WHERE 1";

			resultSet = statement.executeQuery(sql);
			
			
			
			String remove= "";
			
			if  ( ( ( remove = request.getParameter("trinti")  ) != null ) && remove.equals ( "trinti" ) ){
				
				String sql_ins;
											
				String pratimai2_id=request.getParameter("pratimai.id");
				//out.println (pratimai2_idx );
					sql_ins=
						"DELETE FROM `pratimai` WHERE `pratimai`.`id` = "+ "'" + pratimai2_id + "'" +";";
						
				System.out.println(sql_ins);	
				statement=connection.createStatement();
				int istrinta=statement.executeUpdate(sql_ins);		
			
			 }	
			Pratimai pratimai2 = new Pratimai();
			while( resultSet.next() ){
		
			pratimai2.pav = resultSet.getString ( "pav" );
			pratimai2.pastabos = resultSet.getString  ("pastabos");
			pratimai2.lygis_sunkumo = Integer.parseInt(resultSet.getString ( "lygis_sunkumo" ));
			pratimai2.id_kito_lygio = Integer.parseInt(resultSet.getString ( "id_kito_lygio" ));
			pratimai2.id = Integer.parseInt(resultSet.getString("id"));
%>
<tr style="background-color: #DEB887" >
	<td><%= resultSet.getString ( "id" ) %></td>
	<td><%= resultSet.getString ( "pav" ) %></td>
	<td><%= resultSet.getString ("pastabos" ) %></td>
	<td><%=resultSet.getString ( "lygis_sunkumo" ) %></td>
	<td><%=resultSet.getString ( "id_kito_lygio" ) %></td>
	<td><input class="dialog-link edit ui-button ui-corner-all ui-widget button redagavimas" data-pav="<%=pratimai2.pav%>" data-pastabos="<%=pratimai2.pastabos%>" data-lygis_sunkumo="<%=pratimai2.lygis_sunkumo%>" data-id_kito_lygio="<%=pratimai2.id_kito_lygio%>" data-id="" type="button" value="&#9881" id="keiciam">
		<input class="ui-button ui-corner-all ui-widget dialog-link button" data-id="<%=pratimai2.id%>" type="button" value="X">
		
</tr>
<% 		
		}
		}catch (Exception e) {
	
			e.printStackTrace();
			
		}	
		
		
%>

</table>
<center>

<div id="dialog" title="Pavadinimas">
	<form method="post" action="">
	<table align="center" cellpadding="5" cellspacing="5" >
<tr>	
	<th>Pratimas</th>
	<th>Pastabos</th>
	<th>Sunkumo lygis</th>
	<th>x</th>
</tr>

<tr>
	<td>
		<input type="text" name="pav" id="pav" value="">
	</td>
	<td>
		<input type="text" name="pastabos" id="pastabos" value="">
	</td>	
	<td>
		<input type="number" name="lygis_sunkumo" id="lygis_sunkumo" value="">
	</td>
	<td>
		<input type="number" name="id_kito_lygio" id="id_kito_lygio" value="">
	</td>
	<td> 
		<input type="submit" name="add" value="papildyti" class="ui-button ui-corner-all ui-widget">
	</td>	
	</tr>
	</table>
</div>


<input type="hidden" class="edit" id="pratimai2_id" name="pratimai2_id" value="0">
</form>
<form method="post" action="" id="remove">
<input type="hidden" class="edit" id="pratimai2_idx" name="pratimai2_id" value="1">
<input type="hidden" name="trinti" id="trinti" value="trinti">
</form>
</center>
</body>