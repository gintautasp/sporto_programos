<!DOCTYPE html>
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.text.*,java.util.*,java.io.BufferedReader,java.io.IOException,java.io.FileReader,sarasas.Kliento_krit" %>
<html>
	<head>
		<meta charset="utf-8">
		<style>
			th {
				background-color: #EDE731
			}
			
			#listKlientai th, #listKlientai td {
				margin: 5px; 
				padding: 1px;
				border: 1px solid black;
			}
			#bendraLent th, #bendraLent td {
				margin: 5px; 
				padding: 5px;
				border: 1px solid black;
			}
			body {
				background-image: url("img/sportoPav.jpg");
				background-color: #cccccc;
				background-size: auto;
			}
		</style>  
		<script  src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>  <!-- Reikia kad veiktu 'reda' funkcija -->
		<script>
			$( document ).ready ( function() {
	
				kriterijai2 = { id: 0, pav: 0, amzius:0, ugis: 0, lytis: 0, svoris: 0 , pasiruosimas:0, traumos:0};
	
				$( '.reda' ).click ( function() {

					kriterijai2.id				= $( this ).data('id');
					kriterijai2.pav		  		= $( this ).data( 'pav' );
					kriterijai2.amzius  			= $( this ).data( 'amzius' );
					kriterijai2.ugis  				= $( this ).data( 'ugis' );
					kriterijai2.lytis  				= $( this ).data( 'lytis' );
					kriterijai2.svoris  			= $( this ).data( 'svoris' );			
					kriterijai2.pasiruosimas  		= $( this ).data( 'pasiruosimas' );			
					kriterijai2.traumos  			= $( this ).data( 'traumos' );			
					
					$( '#kliento_id' ).val ( kriterijai2.id );						//nurodom id iš ivedimo eilutes apacioje, kad pakeisti jo reikšmę
					$( '#pav' ).val ( kriterijai2.pav );
					$( '#amzius' ).val ( kriterijai2.amzius );
					$( '#ugis' ).val ( kriterijai2.ugis );
					$( '#lytis' ).val ( kriterijai2.lytis );			
					$( '#svoris' ).val ( kriterijai2.svoris );			
					$( '#pasiruosimas' ).val ( kriterijai2.pasiruosimas );			
					$( '#traumos' ).val ( kriterijai2.traumos );			
				});		
		
				$( '.trinti' ).click ( function() {
				
					r = confirm("Ar tikrai norite ištrinti?");
					
					if (r){
					
						id_kliento = $( this ).data('id');
						$('#kliento_idd').val (id_kliento);
						$('#salink').submit();
					}
				});	
				$( '.valyti' ).click ( function() {

					$( '#kliento_id' ).val ( "0" );						//nurodom id iš ivedimo eilutes apacioje, kad pakeisti jo reikšmę
					$( '#pav' ).val ( "Vardas Pavardė" );
					$( '#amzius' ).val ( "1" );
					$( '#ugis' ).val ( "1" );
					$( '#lytis' ).val ( "" );			
					$( '#svoris' ).val ( "1" );
					$( '#pasiruosimas' ).val ( "(val/sav) / pask. metus" );
					$( '#traumos' ).val ( "Atkreiptinos traumos/ligos" );
					
				});
			});
	
			 if ( window.history.replaceState ) {  							//perkrovus puslapį išmeta išsaugotą vedimo info 
				
				window.history.replaceState( null, null, window.location.href ); 
			}  
			
				 
		</script>
	</head>
<body>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
// String id = request.getParameter("userId");
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "sporto_programos";
	String userId = "root";
	String password = "";
	
	Connection connection = null;
	Statement statement = null, statement_change = null;
	ResultSet resultSet = null;
	int resultSetChange = 0;
/*
	2	pav	varchar(256)	utf8_lithuanian_ci
	3	gyv_sk	bigint(20)
	4	plotas	decimal(12,2)
	5	platuma	decimal(10,7)
	6	ilguma	decimal(10,7)	
	7	valstybe	char(3)	utf8_lithuanian_ci		
*/
%>
<h2 align="center"><strong>Klientų informacija</strong></h2>
<table style="border: 5px solid black; padding: 2px; margin: 10px; margin-left: auto; margin-right: auto;"  id="bendraLent"  >		<!--Lenteles parametrai-->
<tr >

</tr>
<tr >							<!-- Virsus -->
	<th >ID</th>
	<th>Pavadinimas</th>
	<th>Amžius</th>
	<th>Ūgis cm</th>
	<th>Lytis</th>
	<th>Svoris kg</th>
	<th>Pasiruošimo lygis</th>
	<th>Traumos bei ligos</th>
	<th>Redag. / Trinti</th>
</tr>
<%

	Kliento_krit kriterijai = new Kliento_krit ();
	Kliento_krit kriterijai2 = new Kliento_krit ();
	try{
	     
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");		
		
	} catch(Exception e) {}

	try{ 
	
		String jdbcutf8 = ""; //  "&useUnicode=true&characterEncoding=UTF-8";	
		connection = DriverManager.getConnection ( connectionUrl + dbName + jdbcutf8, userId, password );
		
		String add;	
		String trintis;

		String manoId = request.getParameter( "idd" );  
		
		if ( ( ( add = request.getParameter("add")  ) != null ) && add.equals ( "Papildyti" ) ) {
		
		kriterijai2.id =  request.getParameter( "id" );
		kriterijai.pav =  request.getParameter( "pav" );
		kriterijai.amzius =  request.getParameter( "amzius" );
		kriterijai.ugis =  request.getParameter( "ugis" );
		kriterijai.lytis =  request.getParameter( "lytis" );
		kriterijai.svoris =  request.getParameter( "svoris" );	
		kriterijai.pasiruosimas =  request.getParameter( "pasiruosimas" );	
		kriterijai.traumos =  request.getParameter( "traumos" );	
			
			String sql_ins ="";			
			if (Integer.parseInt(kriterijai2.id) !=0){
			
				sql_ins =
					"UPDATE `klientai` SET "
						+"`pav` ='"+ kriterijai.pav +"', "
						+"`amzius`='" + kriterijai.amzius +"', "
						+"`ugis`='"+ kriterijai.ugis +"', "
						+"`lytis`='"+ kriterijai.lytis +"', "
						+"`svoris` = '"+ kriterijai.svoris +"',"
						+"`pasiruosimo_lygis` = '"+ kriterijai.pasiruosimas +"',"
						+"`traumosLigos` = '"+ kriterijai.traumos +"'"
						+ " WHERE `klientai`.`id` = "+kriterijai2.id+";";
			
			}else{
			
				sql_ins = 
				"INSERT INTO `klientai`"
					+ " ( `id`,`pav`, `amzius`, `ugis`,`lytis`, `svoris`,`pasiruosimo_lygis`,`traumosLigos` )"
					+ " VALUES ( "	
						+"NULL"
						+ ", '" + kriterijai.pav + "' "
						+ ", '" + kriterijai.amzius + "' "
						+ ", '" + kriterijai.ugis + "' "
						+ ", '" + kriterijai.lytis + "' "
						+ ", '" + kriterijai.svoris + "' "
						+ ", '" + kriterijai.pasiruosimas + "' "
						+ ", '" + kriterijai.traumos + "' "
					+ " );";
			}
			out.println ( sql_ins );   //print ln pasitikrinimui inserto

			statement_change = connection.createStatement();
			resultSetChange = statement_change.executeUpdate(sql_ins);
		 } 
		 if (((trintis=request.getParameter("trinti"))!= null )&& trintis.equals (request.getParameter( "trinti" ))){
			
			if((Integer.parseInt(manoId))!=0){
			String sql_ins ="";
			sql_ins = "DELETE FROM `klientai` WHERE `klientai`.`Id` = "+manoId+";";
			
			out.println ( sql_ins );   //print ln pasitikrinimui inserto

			statement_change = connection.createStatement();
			resultSetChange = statement_change.executeUpdate(sql_ins);
			}			
		 }
		
		statement=connection.createStatement();		
		String sql ="SELECT * FROM `klientai`  WHERE 1";

		resultSet = statement.executeQuery(sql);
		 
		while( resultSet.next() ){
			
			kriterijai2.id = resultSet.getString ( "id" );
			kriterijai2.pav = resultSet.getString ( "pav" );
			kriterijai2.amzius = resultSet.getString ( "amzius" );
			kriterijai2.ugis = resultSet.getString ( "ugis" );
			kriterijai2.lytis = resultSet.getString  ("lytis" ) ;
			kriterijai2.svoris = resultSet.getString ( "svoris" );
			kriterijai2.pasiruosimas = resultSet.getString ( "pasiruosimo_lygis" );
			kriterijai2.traumos = resultSet.getString ( "traumosLigos" );
%>										
<tr style="background-color: #DEB887; padding: 1px ">    
	<td><%=kriterijai2.id %></td>
	<td><%=kriterijai2.pav %></td>
	<td><%=kriterijai2.amzius %></td>
	<td><%=kriterijai2.ugis  %></td>
	<td><%=kriterijai2.lytis%></td>
	<td><%=kriterijai2.svoris %></td>
	<td><%=kriterijai2.pasiruosimas %></td>
	<td><%=kriterijai2.traumos %></td>
	<td>
		<input data-id="<%=kriterijai2.id%>"data-pav="<%=kriterijai2.pav%>" data-amzius="<%=kriterijai2.amzius%>" data-ugis="<%=kriterijai2.ugis%>" data-lytis="<%=kriterijai2.lytis%>" data-svoris="<%=kriterijai2.svoris%>" data-pasiruosimas="<%=kriterijai2.pasiruosimas%>" data-traumos="<%=kriterijai2.traumos%>" type="button" value="Redaguoti" class="reda">
		<input data-id="<%=kriterijai2.id%>"type="button" value="X" class="trinti" >
	</td>
</tr>

<% 
		}

	} catch (Exception e) {
	
		e.printStackTrace();
	}
%>
</table >  <!-- Ivedimo lenteles parametrai-->
<form method="post" action="">
<table align="center" style="border: 5px solid black" id="listKlientai">
<tr>
	<!-- Apacia -->
<th>Kliento vardas</th>
<th>Amžius</th>
<th>Ūgis cm</th>
<th>Lytis</th>
<th>Svoris kg</th>
<th>Pasiruošimo lygis</th>
<th>Traumos bei ligos</th>
<th>
	<input type="button" class="valyti" value=" Išvalyti ">
</th>
</tr>

<tr>

		<td>
			<input type="text" name="pav" value="Vardas Pavardė" id="pav">
		</td>
		<td>
			<input type="number" name="amzius" value="1" id="amzius">
		</td>	
		<td>
			<input type="number" name="ugis" value="1" id="ugis">
		</td>
		<td>
			<select name="lytis" id="lytis">
			<option value="" selected disabled hidden>Pasirinkite lytį</option>
			<option value="Vyras">Vyras</option>
			<option value="Moteris">Moteris</option>
		</td>
		<td >
			<input type="number" name="svoris" value="1" id="svoris">
		</td>
		<td >
			<input type="text" name="pasiruosimas" value="(val/sav) / pask. metus" id="pasiruosimas">
		</td>
		<td >
			<input type="text" name="traumos" value="Atkreiptinos traumos/ligos" id="traumos">
		</td>
		
		<td>
			<input type="submit" name="add" value="Papildyti">
		</td>
</tr>
</table>
		<input type="hidden" id="kliento_id" name="id" value="0">  
</form>
<form id="salink" method="POST" action="">
	<input type="hidden" id="kliento_idd" name="idd" value="0">
	<input type="hidden" name="trinti" id="trinti" value="trinti">
</form>
</body>