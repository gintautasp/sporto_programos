<!DOCTYPE html>
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.text.*,java.util.*,java.io.BufferedReader,java.io.IOException,java.io.FileReader,klientai.Kliento_krit" %>
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

			
			#listKlientai th, #listKlientai td {
				margin: 5px; 
				padding: 1px;
				border: 1px solid black;
			}
			#users th, #users td {
				margin: 5px; 
				padding: 5px;
				border: 1px solid black;
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
				pav = $( "#pav" ),
				amzius = $( "#amzius" ),
				ugis = $( "#ugis" ),
				lytis = $( "#lytis" ),
				svoris = $( "#svoris" ),
				pasiruosimo_lygis = $( "#pasiruosimo_lygis" ),
				traumos_ligos = $( "#traumos_ligos" ),
				
				allFields = $( [] ).add( id ).add( pav ).add( amzius ).add( ugis ).add( lytis ).add( svoris ).add( pasiruosimo_lygis ).add( traumos_ligos ),
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
					 
					valid = valid && checkLength( pav, "Vardas", 3, 30 );
					valid = valid && checkLength( amzius, "Amžius", 1, 2 );
					valid = valid && checkLength( ugis, "Ūgis", 1, 3 );
					valid = valid && checkLength( svoris, "Svoris", 1, 3 );
					valid = valid && checkLength( pasiruosimo_lygis, "Pasiruosimo lygis", 5, 80 );
					valid = valid && checkLength( traumos_ligos, "Traumos / Ligos", 5, 30);
				 
					valid = valid && checkRegexp( pav, /^[a-ząčęėįšųūž]([0-9a-ząčęėįšųūž_\s])+$/i, "Vardą gali sudaryti tik raidės" );
				 
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
					}
				});
				 
				$( "#create-user" ).button().on( "click", function() {             <!-- atidaro ivedimo langa -->
				      dialog.dialog( "open" );
				});
				
				$( '.reda' ).click ( function() {
				
					kriterijai2 = { id: 0, pav: 0, amzius:0, ugis: 0, lytis: 0, svoris: 0 , pasiruosimas:0, traumos:0};
					
					kriterijai2.id				= $( this ).data('id');
					kriterijai2.pav		  		= $( this ).data( 'pav' );
					kriterijai2.amzius  			= $( this ).data( 'amzius' );
					kriterijai2.ugis  				= $( this ).data( 'ugis' );
					kriterijai2.lytis  				= $( this ).data( 'lytis' );
					kriterijai2.svoris  			= $( this ).data( 'svoris' );			
					kriterijai2.pasiruosimas  		= $( this ).data( 'pasiruosimo_lygis' );			
					kriterijai2.traumos  			= $( this ).data( 'traumos_ligos' );			
					
					$( '#kliento_id' ).val ( kriterijai2.id );						//nurodom id iš ivedimo eilutes apacioje, kad pakeisti jo reikšmę
					$( '#pav' ).val ( kriterijai2.pav );
					$( '#amzius' ).val ( kriterijai2.amzius );
					$( '#ugis' ).val ( kriterijai2.ugis );
					$( '#lytis' ).val ( kriterijai2.lytis );			
					$( '#svoris' ).val ( kriterijai2.svoris );			
					$( '#pasiruosimo_lygis' ).val ( kriterijai2.pasiruosimas );			
					$( '#traumos_ligos' ).val ( kriterijai2.traumos );
				
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
<h2 align="center" class="font-face" style="color: #fff;font-size:42px;"><strong>Klientų informacija</strong></h2>
<div id="users-contain" class="ui-widget"> 
<table style="padding: 2px; margin: 10px; margin-left: auto; margin-right: auto" id="users" >		<!--Lenteles parametrai-->
<tr >

</tr>
<tr>							<!-- Virsus -->
	<th class="font-face">ID</th>
	<th class="font-face">Pavadinimas</th>
	<th class="font-face">Amžius</th>
	<th class="font-face">Ūgis cm</th>
	<th class="font-face">Lytis</th>
	<th class="font-face">Svoris kg</th>
	<th class="font-face">Pasiruošimo lygis</th>
	<th class="font-face">Traumos bei ligos</th>
	<th class="font-face">Redag. / Trinti</th>
	
</tr></strong>
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
		kriterijai.pasiruosimas =  request.getParameter( "pasiruosimo_lygis" );	
		kriterijai.traumos =  request.getParameter( "traumos_ligos" );	
			
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
						+"`traumos_ligos` = '"+ kriterijai.traumos +"'"
						+ " WHERE `klientai`.`id` = "+kriterijai2.id+";";
			
			}else{
			
				sql_ins = 
				"INSERT INTO `klientai`"
					+ " ( `id`,`pav`, `amzius`, `ugis`,`lytis`, `svoris`,`pasiruosimo_lygis`,`traumos_ligos` )"
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
			sql_ins = "DELETE FROM `klientai` WHERE `klientai`.`id` = "+manoId+";";
			
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
			kriterijai2.traumos = resultSet.getString ( "traumos_ligos" );
%>										
<tr style="background-color: ##DEB887; padding: 1px " >    
	<td class="font-face" style="color:#fff"><%=kriterijai2.id %></td>
	<td class="font-face" style="color:#fff"><a href=""><%=kriterijai2.pav %></a></td>
	<td class="font-face" style="color:#fff"><%=kriterijai2.amzius %></td>
	<td class="font-face" style="color:#fff"><%=kriterijai2.ugis  %></td>
	<td class="font-face" style="color:#fff"><%=kriterijai2.lytis%></td>
	<td class="font-face" style="color:#fff"><%=kriterijai2.svoris %></td>
	<td class="font-face" style="color:#fff"><%=kriterijai2.pasiruosimas %></td>
	<td class="font-face" style="color:#fff"><%=kriterijai2.traumos %></td>
	<td>
		<input data-id="<%=kriterijai2.id%>"data-pav="<%=kriterijai2.pav%>" data-amzius="<%=kriterijai2.amzius%>" data-ugis="<%=kriterijai2.ugis%>" data-lytis="<%=kriterijai2.lytis%>" data-svoris="<%=kriterijai2.svoris%>" data-pasiruosimo_lygis="<%=kriterijai2.pasiruosimas%>" data-traumos_ligos="<%=kriterijai2.traumos%>" type="button" value="Redaguoti" class="reda">
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
</div > 
<div style="text-align: center;"> 
<button id="create-user" class="ui-button ui-corner-all ui-widget dialog-link button font-face"><strong>Sukurti naują klientą</strong></button>
</div>
<div id="dialog-form" title="Naujas klientas" >
	<p class="validateTips">Užpildykite visus laukus</p>
	<fieldset>
		<form method="post" action="" id="ivedimoForm">
		<table style="border: 5px solid black" id="listKlientai">
		<!-- Apacia -->	
		<tr>		<th>Kliento vardas	</th>	<td>	<input type="text" name="pav" value="Vardas Pavardė" id="pav" class="text ui-widget-content ui-corner-all">							</td></tr>
		<tr>		<th>Amžius		</th>	<td>	<input type="number" name="amzius" value="1" id="amzius" class="text ui-widget-content ui-corner-all">								</td></tr>
		<tr>		<th>Ūgis cm		</th>	<td>	<input type="number" name="ugis" value="1" id="ugis" class="text ui-widget-content ui-corner-all">									</td></tr>
		<tr>		<th>Lytis			</th>	<td>	<select name="lytis" id="lytis" class="text ui-widget-content ui-corner-all">
												<option value="" selected disabled hidden>Pasirinkite lytį</option>
												<option value="Vyras">Vyras</option>
												<option value="Moteris">Moteris</option> </select>																		</td></tr>
		<tr>		<th>Svoris kg		</th>	<td ><input type="number" name="svoris" value="1" id="svoris" class="text ui-widget-content ui-corner-all">									</td></tr>
		<tr>		<th>Pasiruošimo lygis	</th>	<td ><input type="text" name="pasiruosimo_lygis" value="(val/sav) / pask. metus" id="pasiruosimo_lygis" class="text ui-widget-content ui-corner-all">		</td></tr>
		<tr>		<th>Traumos bei ligos	</th>	<td ><input type="text" name="traumos_ligos" value="Atkreiptinos traumos/ligos" id="traumos_ligos" class="text ui-widget-content ui-corner-all">			</td></tr>
		</table>
		<input type="hidden" id="kliento_id" name="id" value="0">  
		<input type="hidden" name="add" value="Papildyti">
</form>
</fieldset>
</div>
<form id="salink" method="POST" action="">
	<input type="hidden" id="klientu_idd" name="idd" value="0">
	<input type="hidden" name="trinti" id="trinti" value="trinti">
</form>
</body>