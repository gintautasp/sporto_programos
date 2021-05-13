<!DOCTYPE html>
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.text.*,java.util.*,java.io.BufferedReader,java.io.IOException,java.io.FileReader,klientai_treniruociu_planai.KlientaiTreniruociuPlanai" %>
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
		<script  src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>  <!-- Reikia kad veiktu 'reda' funkcija -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="../ext/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
		<script>
		
			 if ( window.history.replaceState ) {  							//perkrovus puslapį išmeta išsaugotą vedimo info 
				
				window.history.replaceState( null, null, window.location.href ); 
			}  
	
				$( '.add' ).click ( function() {
				
					kriterijai2 = { nuo: 0, iki:0};
					
					kriterijai2.nuo	= $( this ).data('nuo');
					kriterijai2.iki	= $( this ).data( 'iki' );
					
					$( '#nuo' ).val ( kriterijai2.nuo );						//nurodom id iš ivedimo eilutes apacioje, kad pakeisti jo reikšmę
					$( '#iki' ).val ( kriterijai2.iki );
				
				});
			} );	 
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

%>
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

<div id="users-contain" class="ui-widget"> 
<table style="padding: 2px; margin: 10px; margin-left: auto; margin-right: auto" id="users" >		<!--Lenteles parametrai-->
<tr >

</tr>

<%

	KlientaiTreniruociuPlanai kriterijai = new KlientaiTreniruociuPlanai ();
	KlientaiTreniruociuPlanai kriterijai2 = new KlientaiTreniruociuPlanai ();
	
	try{
	     
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");		
		
	} catch(Exception e) {}
	
	String id_asmens = request.getParameter ( "ik" );

	try{ 
	
		String jdbcutf8 = ""; 
		connection = DriverManager.getConnection ( connectionUrl + dbName + jdbcutf8, userId, password );
		
		String add;			

		String manoId = request.getParameter( "idd" );  
		
		if ( ( ( add = request.getParameter("add")  ) != null ) && add.equals ( "Pasirinkti" ) ) {
		
			String tas_nuo = request.getParameter ( "nuo" );
			String tas_iki  = request.getParameter ( "iki" );
			out.println(tas_nuo +"    "+tas_iki);						//pasitikrinimui
			
			/*String[] splitted_tas_nuo = tas_nuo.split("-W");
			String[] splitted_tas_iki = tas_iki.split("-W");*/
			
			String[] splitted_tas_nuo = tas_nuo.split("-");
			String[] splitted_tas_iki = tas_iki.split("-");
			
			for (int i=0 ; i < splitted_tas_nuo.length-1 ; i++) {
					splitted_tas_nuo[i]=splitted_tas_nuo[i];
					splitted_tas_iki[i]=splitted_tas_iki[i];
				}
			String splitted_tas_nuo_final = splitted_tas_nuo[0] +splitted_tas_nuo[1];
			String splitted_tas_iki_final = splitted_tas_iki[0] +splitted_tas_iki[1];
			
			out.println(splitted_tas_nuo_final+"   "+splitted_tas_iki_final);			//pasitikrinimui

			statement=connection.createStatement();		
			String sql =
			"SELECT `klientai_treniruociu_planai`.`id`,`klientai`.`id` AS `id_kliento` , `klientai`.`pav` AS `vardas` "
				+",`treniruociu_planai`.`pav` AS `pav_treniruotes_plano`,`treniruociu_planai`.`rusis` "
				+",`klientai_treniruociu_planai`.`data` "
				+",YEAR(`data`)*100 + MONTH(`data`)*1  AS `datos_reiksme` "
				+",`klientai_treniruociu_planai`.`rezultatai` "
				+"FROM `klientai_treniruociu_planai` "
				+"JOIN `klientai` ON ( `klientai_treniruociu_planai`.`id_kliento`=`klientai`.`id` ) "
				+"JOIN `treniruociu_planai` ON ( `klientai_treniruociu_planai`.`id_treniruotes_plano`= `treniruociu_planai`.`id` ) "
				+"WHERE `id_kliento`= '"+id_asmens+"' "
				+"HAVING `datos_reiksme` BETWEEN '"+splitted_tas_nuo_final+"' AND '"+splitted_tas_iki_final+"'";

			resultSet = statement.executeQuery(sql);
			

			%>
			<tr>							<!-- Lentelės reikšmių pavadinimai -->
				<th class="font-face">Treniruotes planas</th>
				<th class="font-face">Rusis</th>
				<th class="font-face">Data</th>
				<th class="font-face">Rezultatai</th>
			</tr>
			<%
			while( resultSet.next() ){				//užpildo lentelę
				
				kriterijai2.id = resultSet.getString ( "id" );
				kriterijai2.id_kliento = resultSet.getString ( "id_kliento" );
				kriterijai2.pav_treniruotes_plano = resultSet.getString  ("pav_treniruotes_plano" ) ;
				kriterijai2.rusis = resultSet.getString ( "rusis" );
				kriterijai2.data = resultSet.getString ( "data" );
				kriterijai2.datos_reiksme = resultSet.getString ( "datos_reiksme" );
				kriterijai2.rezultatai = resultSet.getString  ("rezultatai" ) ;
			%>	
			<tr style="background-color: ##DEB887; padding: 1px " >  
				<td style="color:#fff"><%=kriterijai2.pav_treniruotes_plano %></td>
				<td style="color:#fff"><%=kriterijai2.rusis %></td>
				<td style="color:#fff"><%=kriterijai2.data  %></td>
				<td style="color:#fff"><%=kriterijai2.rezultatai%></td>
			</tr>
			<% 
			}
		}
		statement=connection.createStatement();										//Parodo "(kliento vardas) ataskaita"	
		String sql ="SELECT `klientai`.`pav` FROM `klientai` WHERE `klientai`.`id`='"+id_asmens+"'";
		resultSet = statement.executeQuery(sql);
		
		while( resultSet.next() ){
			kriterijai.vardas= resultSet.getString("pav");
		}
		 %>
			<h2 align="center" class="font-face" style="color: #fff;font-size:42px;"><strong><%=kriterijai.vardas %> ataskaita</strong></h2>
		<%
	} catch (Exception e) {
	
		e.printStackTrace();
	}
%>
</table >  <!-- Ivedimo lenteles parametrai-->
</div > 

	<fieldset >
		<form method="post" action="" id="ivedimoForm" align="center">
		<table style="border: 5px solid black" id="listKlientai" align="center">
		<!-- Apacia -->			
		<% SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM"); %>
		<tr>		<th>Nuo			</th>	<td>	<input type="month" name="nuo" value="2019-01" id="nuo" class="text ui-widget-content ui-corner-all">	</td>
				<th>Iki			</th>	<td>	<input type="month" name="iki" value="<%= sdf.format(new Date()) %>" id="iki" class="text ui-widget-content ui-corner-all">	</td></tr>

		</table>
		<!-- <%// SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); %>
		<tr>		<th>Nuo			</th>	<td>	<input type="week" name="nuo" value="2019-01-01" id="nuo" class="text ui-widget-content ui-corner-all">	</td>
				<th>Iki			</th>	<td>	<input type="week" name="iki" value="<%= sdf.format(new Date()) %>" id="iki" class="text ui-widget-content ui-corner-all">	</td></tr>

		</table> -->
		<input type="hidden" id="id" name="id" value="0">  
		<input type="submit" name="add" value="Pasirinkti" style="center">
		</form>
	</fieldset>
</body>