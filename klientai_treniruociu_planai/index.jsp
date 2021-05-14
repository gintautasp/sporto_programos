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
			
			
			$( function() {
			
				$( '.trinti' ).click ( function() {
				
					r = confirm("Ar tikrai norite ištrinti?");
					
					if (r){
					
						id_kliento = $( this ).data('id');
						$('#klientu_idd').val (id_kliento);
						$('#salink').submit();
					}
				});
			
				var dialog, form,
				 
				id = $( "#id" ),
				id_kliento = $( "#id_kliento" ),
				pav_treniruotes_plano = $( "#pav_treniruotes_plano" ),
				data = $( "#data" ),
				rezultatai = $( "#rezultatai" ),
				
				allFields = $( [] ).add( id ).add( id_kliento ).add( pav_treniruotes_plano ).add( data ).add( rezultatai ),
				tips = $( ".validateTips" );
				 
				function updateTips( t ) {
					tips
					.text( t )
					.addClass( "ui-state-highlight" );
					setTimeout(function() {
						tips.removeClass( "ui-state-highlight", 1500 );
					}, 500 );
				}
				 
				function checkLength( o, n, min, max ) {
					if ( o.val().length > max || o.val().length < min ) {
						o.addClass( "ui-state-error" );
						updateTips( "Kriterijaus " + n + " ilgumas turi būti nuo " +
						min + " iki " + max + "." );
						return false;
					} else {
					return true;
					}
				}
				 
				function checkRegexp( o, regexp, n ) {
					if ( !( regexp.test( o.val() ) ) ) {
						o.addClass( "ui-state-error" );
						updateTips( n );
						return false;
					} else {
					return true;
					}
				}
				 
				function addUser() {					<!-- atidaro ivedimo langa -->
					var valid = true;
					allFields.removeClass( "ui-state-error" );
					 
					valid = valid && checkLength( rezultatai, "rezultaitai", 3, 30 );
				 
					//valid = valid && checkRegexp( lytis, /^[a-ząčęėįšųūž]([0-9a-ząčęėįšųūž_\s])+$/i, "Vardą gali sudaryti tik raidės" );
				 
					if ( valid ) {
					$("#ivedimoForm").submit();
					}
					return valid;
					
				}
				 
				dialog = $( "#dialog-form" ).dialog({                     <!--  ivedimo lango struktura  -->
					autoOpen: false,
					height: 450,
					width: 400,
					modal: true,
					buttons: {
						"Įvesti": addUser,
						Cancel: function() {
						dialog.dialog( "close" );
						}
					},
					close: function() {
					allFields.removeClass( "ui-state-error" );
					
					$( '#id' ).val ( 0 );						//nurodom id iš ivedimo eilutes apacioje, kad pakeisti jo reikšmę
					$( '#pav_treniruotes_plano' ).val ( 0 );
					$( '#data' ).val ( "2021-04-30" );
					$( '#rezultatai' ).val ( "rezultatas" );	
					}
				});
				 
				$( "#create-user" ).button().on( "click", function() {             <!-- atidaro ivedimo langa -->
				      dialog.dialog( "open" );
				});
				
				$( '.reda' ).click ( function() {
				
					kriterijai2 = { id: 0, pav_treniruotes_plano:0,id_treniruotes_plano:0, data: 0, rezultatai: 0};
					
					kriterijai2.id				= $( this ).data('id');
					
					kriterijai2.id_treniruotes_plano	= $( this ).data( 'id_treniruotes_plano' );
					kriterijai2.data  				= $( this ).data( 'data' );
					kriterijai2.rezultatai  			= $( this ).data( 'rezultatai' );			
					
					$( '#id' ).val ( kriterijai2.id );						//nurodom id iš ivedimo eilutes apacioje, kad pakeisti jo reikšmę
					
					$( '#id_treniruotes_plano' ).val ( kriterijai2.id_treniruotes_plano );
					$( '#data' ).val ( kriterijai2.data );
					$( '#rezultatai' ).val ( kriterijai2.rezultatai );			

				
					dialog.dialog( "open" );
				
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
/*
	2	pav	varchar(256)	utf8_lithuanian_ci
	3	gyv_sk	bigint(20)
	4	plotas	decimal(12,2)
	5	platuma	decimal(10,7)
	6	ilguma	decimal(10,7)	
	7	valstybe	char(3)	utf8_lithuanian_ci		
*/
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
<tr>							<!-- Virsus -->
	<th class="font-face">Treniruotes planas</th>
	<th class="font-face">Data</th>
	<th class="font-face">Rezultatai</th>
	<th class="font-face">Veiksmai</th>
	
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
	
		String jdbcutf8 = ""; //  "&useUnicode=true&characterEncoding=UTF-8";	
		connection = DriverManager.getConnection ( connectionUrl + dbName + jdbcutf8, userId, password );
		
		String add;	
		String trintis;		

		String manoId = request.getParameter( "idd" );  
		
		if ( ( ( add = request.getParameter("add")  ) != null ) && add.equals ( "Papildyti" ) ) {
		
		kriterijai2.id =  request.getParameter( "id" );
		kriterijai.pav_treniruotes_plano =  request.getParameter( "pav_treniruotes_plano" );
		kriterijai.data =  request.getParameter( "data" );
		kriterijai.rezultatai =  request.getParameter( "rezultatai" );
		kriterijai.id_treniruotes_plano =  request.getParameter( "id_treniruotes_plano" );

			
			String sql_ins ="";			
			if (Integer.parseInt(kriterijai2.id) !=0){
			
				sql_ins =
					"UPDATE `klientai_treniruociu_planai` SET "
						+"`id_kliento` ='"+ id_asmens+"', "
						+"`id_treniruotes_plano`='" + kriterijai.id_treniruotes_plano +"', "
						+"`data`='"+ kriterijai.data +"', "
						+"`rezultatai`='"+ kriterijai.rezultatai +"'"
						+ " WHERE `klientai_treniruociu_planai`.`id` = "+kriterijai2.id+";";
			
			}else{
			
				sql_ins = 
				"INSERT INTO `klientai_treniruociu_planai`"
					+ " ( `id`,`id_kliento`, `id_treniruotes_plano`, `data`,`rezultatai` )"
					+ " VALUES ( "	
						+"NULL"
						+ ", '" + id_asmens + "' "
						+ ", '" + kriterijai.id_treniruotes_plano + "' "
						+ ", '" + kriterijai.data + "' "
						+ ", '" + kriterijai.rezultatai + "' "
					+ " );";
			}
			out.println ( sql_ins );   //print ln pasitikrinimui inserto

			statement_change = connection.createStatement();
			resultSetChange = statement_change.executeUpdate(sql_ins);
		 } 
		 if (((trintis=request.getParameter("trinti"))!= null )&& trintis.equals (request.getParameter( "trinti" ))){
			
			if((Integer.parseInt(manoId))!=0){
			String sql_ins ="";
			sql_ins = "DELETE FROM `klientai_treniruociu_planai` WHERE `klientai_treniruociu_planai`.`id` = "+manoId+";";
			
			out.println ( sql_ins );   //print ln pasitikrinimui inserto

			statement_change = connection.createStatement();
			resultSetChange = statement_change.executeUpdate(sql_ins);
			}			
		 }
		statement=connection.createStatement();		
		String sql =
		"SELECT `klientai_treniruociu_planai`.`id`,`klientai`.`id` AS `id_kliento`"
			+", `klientai`.`pav` AS `vardas` ,`treniruociu_planai`.`pav` AS `pav_treniruotes_plano`, `klientai_treniruociu_planai`.`id_treniruotes_plano` AS `id_treniruotes_plano` "
			+",`klientai_treniruociu_planai`.`data` ,`klientai_treniruociu_planai`.`rezultatai` "
			+"FROM `klientai_treniruociu_planai` "
			+"JOIN `klientai` ON ( `klientai_treniruociu_planai`.`id_kliento`=`klientai`.`id` ) "
			+"JOIN `treniruociu_planai` ON ( `klientai_treniruociu_planai`.`id_treniruotes_plano`= `treniruociu_planai`.`id` )"
			+" WHERE id_kliento='"+id_asmens+"'";

		resultSet = statement.executeQuery(sql);
		


		while( resultSet.next() ){
			
			kriterijai2.id = resultSet.getString ( "id" );
			kriterijai2.id_kliento = resultSet.getString ( "id_kliento" );
			kriterijai2.pav_treniruotes_plano = resultSet.getString ( "pav_treniruotes_plano" );
			kriterijai2.data = resultSet.getString ( "data" );
			kriterijai2.rezultatai = resultSet.getString  ("rezultatai" ) ;
			kriterijai2.vardas = resultSet.getString  ( "vardas" ) ;
			kriterijai2.id_treniruotes_plano = resultSet.getString  ("id_treniruotes_plano" ) ;
%>	
<tr style="background-color: ##DEB887; padding: 1px " >  
	<td style="color:#fff"><%=kriterijai2.pav_treniruotes_plano %></td>
	<td style="color:#fff"><%=kriterijai2.data  %></td>
	<td style="color:#fff"><%=kriterijai2.rezultatai%></td>
	<td>
		<input data-id="<%=kriterijai2.id%>"data-id_kliento="<%=kriterijai2.id_kliento%>"data-id_treniruotes_plano="<%=kriterijai2.id_treniruotes_plano%>" data-pav_treniruotes_plano="<%=kriterijai2.pav_treniruotes_plano%>" data-data="<%=kriterijai2.data%>" data-rezultatai="<%=kriterijai2.rezultatai%>" type="button" value="&#9881" class="reda">
		<input data-id="<%=kriterijai2.id%>"type="button" value="X" class="trinti" >
	</td>
</tr>

<% 
		}
		 %>
			<h2 align="center" class="font-face" style="color: #fff;font-size:42px;"><strong><a href="/sporto_programos/klientai_treniruociu_planai/ataskaita.jsp?ik=<%= kriterijai2.id_kliento %>"><%=kriterijai2.vardas%></a></strong></h2>
		<%
	} catch (Exception e) {
	
		e.printStackTrace();
	}
%>
</table >  <!-- Ivedimo lenteles parametrai-->
</div > 
<div style="text-align: center;"> 
<button id="create-user" class="ui-button ui-corner-all ui-widget dialog-link button font-face"><strong>Priskirti programa klientui</strong></button>
</div>
<div id="dialog-form" title="Naujas klientas" >
	<p class="validateTips">Užpildykite visus laukus</p>
	<fieldset>
		<form method="post" action="" id="ivedimoForm">
		<table style="border: 5px solid black" id="listKlientai">
		<!-- Apacia -->						
		<tr>		<th>Treniruotes plano ID</th>	
			<td>
				<select id="id_treniruotes_plano" name="id_treniruotes_plano" >
					<option value="0" selected disabled hidden>Pasirinkite treniruotės planą</option>
						<%
							try{ 	
								String sql ="SELECT * FROM `treniruociu_planai`  WHERE 1";

								resultSet = statement.executeQuery(sql);
								while( resultSet.next() ){
									kriterijai2.id = resultSet.getString ( "id" );
									kriterijai2.pav_treniruotes_plano = resultSet.getString ( "pav" );%>
											
									<option value="<%=kriterijai2.id %>"> <%=kriterijai2.id %> - <%=kriterijai2.pav_treniruotes_plano %></option>
											
									<%	} }catch (Exception e) { e.printStackTrace(); }	%>
				</select>				
			</td>
		</tr>
		<% SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); %>
		<tr>		<th>Data					</th>	<td>	<input type="date" name="data" value="<%= sdf.format(new Date()) %>" id="data" class="text ui-widget-content ui-corner-all">									</td></tr>
		<tr>		<th>Rezultatai				</th>	<td>	<input type="text" name="rezultatai" value="rezultatas" id="rezultatai" class="text ui-widget-content ui-corner-all">							</td></tr>

		</table>
		<input type="hidden" id="id" name="id" value="0">  
		<input type="hidden" name="add" value="Papildyti">
</form>
</fieldset>
</div>
<form id="salink" method="POST" action="">
	<input type="hidden" id="klientu_idd" name="idd" value="0">
	<input type="hidden" name="trinti" id="trinti" value="trinti">
</form>
</body>