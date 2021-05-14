<!DOCTYPE html>
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.text.*,java.util.*,java.io.BufferedReader,java.io.IOException,java.io.FileReader, pratimai.*" %>
<%@page language="java" import="commons.*" %>
<%@page language="java" import="crud.*" %>
<%@page language="java" import="planai.*" %>
<%@page language="java" import="enums.*" %>
<%
	try {
	     
		request.setCharacterEncoding ( "UTF-8" );
		response.setContentType ( "text/html; charset=UTF-8" );
		response.setCharacterEncoding ( "UTF-8" );		
		
	} catch ( Exception e ) { 
	
		e.printStackTrace();
	}
	
	String[] lent_programos = { "id", "pav", "rusis" };
	String[] lauk_programos = new String [ lent_programos.length ];
	
	String[] lent_plano_pratimai = { "id", "id_pratimai", "id_planai", "skaicius_pakartojimu", "skaicius_atlikimu", "poilsio_laikas_tarp_atlikimu"};
	String[] lauk_plano_pratimai = new String [ lent_plano_pratimai.length ];
	
	String[] lent_pratimai = { "id", "pav", "pastabos", "lygis_sunkumo", "id_kito_lygio"};
	String[] lauk_pratimai = new String [ lent_plano_pratimai.length ];
	
	DbMySql db_mysql = new DbMySql();
	DbMySql db_mysql2 = new DbMySql();
	
	CrudXYPlanai crud_planai = new CrudXYPlanai ( db_mysql, "treniruociu_planai", lent_programos );
	CrudXY crud_plano_pratimai  = new CrudXY ( db_mysql, "pratimai_treniruociu_planai", lent_plano_pratimai );
	CrudXY crud_pratimai  = new CrudXY ( db_mysql2, "pratimai", lent_pratimai );
	try { 
	
		QuerySaveResult qrs = new QuerySaveResult();
		String crud_action = request.getParameter ( "crud_action" ); 		
		System.out.println("msg " + crud_action);	
		if ( (crud_action != null ) && crud_action.equals ( "saugoti" ) ) {
		
			String id_planas = request.getParameter ( "id_planas" );
			System.out.println(id_planas);		
			
			for ( int i = 1; i<lent_programos.length; i++ ) {
			
				lauk_programos [ i ] = request.getParameter ( lent_programos [ i ] );
			}
			qrs = crud_planai.save ( id_planas, lauk_programos );	
		 } 
		 
		String del;
	
		if ( ( ( del = request.getParameter ( "del" )  ) != null ) && del.equals ( "del1rec" ) ) {
		
			String id_planas = request.getParameter ( "p_del" );
			// out.println ( "id programos.: ." + id_planas + "." );		
			qrs = crud_planai.delete ( id_planas );
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
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<title> Planai</title>
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
	<style><!--Display popup style-->
		
		input.text { margin-bottom:12px; width:95%; padding: .4em; }
		fieldset { padding:0; border:0; margin-top:25px; }
		h1 { font-size: 1.2em; margin: .6em 0; }
		div#sheets-contain { width: 350px; margin: 20px 0; }
		div#sheets-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
		div#sheets-contain table td, div#sheets-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
		.ui-dialog .ui-state-error { padding: .3em; }
		.validateTips { border: 1px solid transparent; padding: 0.3em; }
	</style>
	<style>
	#project-label {
		display: block;
		font-weight: bold;
		margin-bottom: 1em;
	}
	#project-description {
		margin: 0;
		padding: 0;
	}
	.ui-menu-item{
		width: 200px;
		float: none;
	}
	</style>
	<style><!--Dropdown menu-->
		fieldset {
			border: 0;
		}
		label {
			display: block;
			margin: 30px 0 0 0;
		}
		.overflow {
			height: 200px;
		}
	</style>
	<style> <!--sortable-->
		#sort { list-style-type: none; margin: 0; padding: 0; width: 60%; }
		#sort label {font-size: 12px; margin: 0; display: inline;}
		#sort input {width: 26px; height: 12px; font-size: 12px;}
		#sort button {width: 25px; height: 25px; font-size: 25px; padding: 0px;}
		#sort .sortable-div { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 10px; height: 50px; border: 2px solid #1C6EA4; border-radius: 11px;}
		#sort .sortable-div span { position: absolute; margin-left: -1.3em; }
		#sort img {display: block;height: 15px;  width: 20px; margin: auto;}
	</style>
	<script> <!-- Modal form to fill information
	$( function() {
	var form,

	// From http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.html#e-mail-state-%28type=email%29
	pav = $( "#pav" ),
	allFields = $( [] ).add( pav ),
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
			updateTips( "Length of " + n + " must be between " +
					min + " and " + max + "." );
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

	function pridetiPratima() {
		var valid = true;
		allFields.removeClass( "ui-state-error" );

		valid = valid && checkLength( pav, "pav", 3, 100 );

		valid = valid && checkRegexp( pav, /^[a-z]([0-9a-z_\s])+$/i, "Pavadinimas turi susidaryti iš raidžių, skaičių ir tarpų" );

		if ( valid ) {
			//console.log(form);
			form.submit();
			dialog.dialog( "close" );
		}
		return valid;
	}
	<%= crud_planai.jsRedagavimui () %>
	<%= crud_planai.jsTrynimui () %>
	form = dialog.find( "form" );
	
	} );

	</script>
	  <script>
	$( function() {
	var projects = [
	<%
		try {
		
			String sql = crud_pratimai.select( "" );
			String rec_data = "";
			String comma = "";
			while( crud_pratimai.db_mysql.flag_got_rows ) {
			
				rec_data += comma + "{";
				
				AssocArrayList lst_row_fields = crud_pratimai.db_mysql.giveSelectedRow();
				
				rec_data += "value: \"" + lst_row_fields.giveMe (  lent_pratimai [ 0 ]  ) + "\",";
				rec_data += "label: \"" + lst_row_fields.giveMe (  lent_pratimai [ 1 ]  ) + "\"";
				/*for ( int i = 0; i < lent_pratimai.length; i++ ) {
					
					
					rec_data += (lent_pratimai[i].equals("pav"))  + ": \"" + lst_row_fields.giveMe (  lent_pratimai [ i ]  ) + "\"";
					
					if(i != lent_pratimai.length-1) rec_data += ", ";
					else rec_data +="";
				}*/
				rec_data +="}";
				comma = ",\n";
			}
			out.println(rec_data);
			System.out.println(rec_data);
		} catch ( Exception e ) {
		
			e.printStackTrace();
		}
	%>
	
			
	];

	$( "#project" ).autocomplete({
		minLength: 0,
		source: projects,
		focus: function( event, ui ) {
			$( "#project" ).val( ui.item.label );
			return false;
		},
		select: function( event, ui ) {
			$( "#project" ).val( ui.item.label );
			$( "#project-id" ).val( ui.item.value );

			return false;
		}
	})
	.autocomplete( "instance" )._renderItem = function( ul, item ) {
		return $( "<li>" )
			.append( "<div>" + item.label  + "</div>" )
			.appendTo( ul );
		};
	} );
	</script>
	<script>
	$( function() {
		$( "#rusis" ).selectmenu();
	} );
	</script>
	<script>
		$( function() {			
			$(".moveup").on("click", function() {
				var elem = $(this).closest("div");
				elem.prev().before(elem);
			});

			$(".movedown").on("click", function() {
				var elem = $(this).closest("div");
				elem.next().after(elem);
			});

			$(".movetop").on("click", function() {
				var elem = $(this).closest("div");
				elem.siblings().first().before(elem);
			});

			$(".movebottom").on("click", function() {
				var elem = $(this).closest("div");
				elem.siblings().last().after(elem);
			});
		} );
	</script>
</head>
<body>
<div id="dialog" title="Create new user">
  <p class="validateTips">All form fields are required.</p>
 
	<form method="POST">
		<fieldset>
			<label for="pav">Pavadinimas</label>
			<input type="text" name="pav" id="pav" class="text ui-widget-content ui-corner-all">
			
			<label for="rusis">Pasirinkti rusi</label>
			<select name="rusis" id="rusis">
				<%
					for (Treniruociu_rusis rusis : Treniruociu_rusis.values()) {
				%>
						<option><%= rusis.item() %></option>
				<%
					}
				%>
			</select>
			    
			<input type="hidden" id="id_planas" name="id_planas" value="0">
			<input type="hidden" id="alert" name="alert" value="0">
			<input type="hidden" id="crud_action" name="crud_action" value="saugoti">
			
			<div id="project-label">Pasirinkti treniruote</div>
			<input id="project">
			<input type="hidden" id="project-id">
			
			<div id="sort">
				<div class="sortable-div"  >
					<section class ="sortable-data" style ="float:left">
						<table style="width:100%">
							<tr>
								<td>
								<label for="pratimo-pavadinimas">Pav: </label>
								<input type="text" value="0" name="pratimo-pavadinimas" id="pratimo-pavadinimas" />
								</td>
								<td>
								<label for="pratimo-pavadinimas">Prat id: </label>
								<input type="text" value="0" name="pratimo-id" id="pratimo-pavadinimas" />
								</td>
								<td>
								<label for="pratimo-pavadinimas">Plano id: </label>
								<input type="text" value="0" name="plano-id" id="pratimo-pavadinimas" />
								</td>
							</tr>
							<tr>
								<td>
								<label for="pakartojimai">Pakartojimai: </label>
								<input type="text" maxlength="3" name="pakartojimai" id="pakartojimai"  />
								</td>
								<td>
								<label for="pakartojimai">Atlikimai: </label>
								<input type="text" maxlength="3" name="atlikimai" id="atlikimai" >
								</td>
								<td>
								<label for="pakartojimai">Poilsis (sek): </label>
								<input type="text" maxlength="3" name="atlikimai" id="atlikimai" >
								</td>
							</tr>
						</table>
					</section>
					
					<section class ="sortable-buttons" style ="float:right">
						<button type="button" class="updownbtn moveup fa fa-angle-up"><img src="commons/up_arrow.png"></button>
						<button type="button" class="updownbtn movetop fa fa-angle-double-up"><img src="commons/double_up_arrow.png"></button>
						<br>
						<button type="button" class="updownbtn movedown fa fa-angle-down"><img src="commons/down_arrow.png"></button>
						<button type="button" class="updownbtn movebottom fa fa-angle-double-down"><img src="commons/double_down_arrow.png"></button>
					</section>
				</div>
				<div class="sortable-div"  >
					<section class ="sortable-data" style ="float:left">
						<table style="width:100%">
							<tr>
								<td>
								<label for="pratimo-pavadinimas">Pav: </label>
								<input type="text" value="0" name="pratimo-pavadinimas" id="pratimo-pavadinimas" />
								</td>
								<td>
								<label for="pratimo-pavadinimas">Prat id: </label>
								<input type="text" value="0" name="pratimo-id" id="pratimo-pavadinimas" />
								</td>
								<td>
								<label for="pratimo-pavadinimas">Plano id: </label>
								<input type="text" value="0" name="plano-id" id="pratimo-pavadinimas" />
								</td>
							</tr>
							<tr>
								<td>
								<label for="pakartojimai">Pakartojimai: </label>
								<input type="text" maxlength="3" name="pakartojimai" id="pakartojimai"  />
								</td>
								<td>
								<label for="pakartojimai">Atlikimai: </label>
								<input type="text" maxlength="3" name="atlikimai" id="atlikimai" >
								</td>
								<td>
								<label for="pakartojimai">Poilsis (sek): </label>
								<input type="text" maxlength="3" name="atlikimai" id="atlikimai" >
								</td>
							</tr>
						</table>
					</section>
					
					<section class ="sortable-buttons" style ="float:right">
						<button type="button" class="updownbtn moveup fa fa-angle-up"><img src="commons/up_arrow.png"></button>
						<button type="button" class="updownbtn movetop fa fa-angle-double-up"><img src="commons/double_up_arrow.png"></button>
						<br>
						<button type="button" class="updownbtn movedown fa fa-angle-down"><img src="commons/down_arrow.png"></button>
						<button type="button" class="updownbtn movebottom fa fa-angle-double-down"><img src="commons/double_down_arrow.png"></button>
					</section>
				</div>
				<div class="sortable-div"  >
					<section class ="sortable-data" style ="float:left">
						<table style="width:100%">
							<tr>
								<td>
								<label for="pratimo-pavadinimas">Pav: </label>
								<input type="text" value="0" name="pratimo-pavadinimas" id="pratimo-pavadinimas" />
								</td>
								<td>
								<label for="pratimo-pavadinimas">Prat id: </label>
								<input type="text" value="0" name="pratimo-id" id="pratimo-pavadinimas" />
								</td>
								<td>
								<label for="pratimo-pavadinimas">Plano id: </label>
								<input type="text" value="0" name="plano-id" id="pratimo-pavadinimas" />
								</td>
							</tr>
							<tr>
								<td>
								<label for="pakartojimai">Pakartojimai: </label>
								<input type="text" maxlength="3" name="pakartojimai" id="pakartojimai"  />
								</td>
								<td>
								<label for="pakartojimai">Atlikimai: </label>
								<input type="text" maxlength="3" name="atlikimai" id="atlikimai" >
								</td>
								<td>
								<label for="pakartojimai">Poilsis (sek): </label>
								<input type="text" maxlength="3" name="atlikimai" id="atlikimai" >
								</td>
							</tr>
						</table>
					</section>
					
					<section class ="sortable-buttons" style ="float:right">
						<button type="button" class="updownbtn moveup fa fa-angle-up"><img src="commons/up_arrow.png"></button>
						<button type="button" class="updownbtn movetop fa fa-angle-double-up"><img src="commons/double_up_arrow.png"></button>
						<br>
						<button type="button" class="updownbtn movedown fa fa-angle-down"><img src="commons/down_arrow.png"></button>
						<button type="button" class="updownbtn movebottom fa fa-angle-double-down"><img src="commons/double_down_arrow.png"></button>
					</section>
				</div>
			</div>
			<!-- Allow form submission with keyboard without duplicating the dialog button -->
			<input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
		</fieldset>
	</form>
</div>

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

<h2 align="center" class="font-face" style="color: #fff;font-size:42px;"><strong>Planai</strong></h2>


<table align="center" cellpadding="4" cellspacing="2">
<tr>

</tr>
<tr>
	<th class="font-face">Id</th>
	<th class="font-face">Pavadinimas</th>
	<th class="font-face">Rusis</th>
	<th class="font-face">Veiksmai</th>
	
</tr>
<%
	try {
	
		String sql = crud_planai.select( "" );
		 
		while( crud_planai.db_mysql.flag_got_rows ) {
		
			String rec_data = "";
			
			AssocArrayList lst_row_fields = crud_planai.db_mysql.giveSelectedRow();
			for ( int i = 1; i < lauk_programos.length; i++ ) {
				rec_data += " data-"  + ( lent_programos [ i ] )   + "=\"" +  ( ( String ) lst_row_fields.giveMe (  lent_programos [ i ]  ) ) + "\"";
			}
			String id_rec =  ( String ) lst_row_fields.giveMe (   "id"  );
%>
<tr>
<%
		for ( int i = 0; i < lent_programos.length; i++ ) {
%>
	<td class="font-face" style="color:#fff"><%=  lst_row_fields.giveMe (  lent_programos [ i ]  ) %></td>
<%
		}
%>
	<td><input class="dialog-link edit ui-button ui-corner-all ui-widget button redagavimas" id="toEdit_<%= id_rec  %>" data-id="<%= id_rec  %>" <%= rec_data %> type="button" value="&#9881">
		<input class="ui-button ui-corner-all ui-widget button dialog_confirm" id="toDelete_<%= id_rec  %>" data-id="<%= id_rec %>" <%= rec_data %> type="button" value="X"></td>
</tr>
<% 
		}
	} catch ( Exception e ) {
	
		e.printStackTrace();
	}
%>
</table>
	<div align="center">
	<input class="ui-button ui-corner-all ui-widget dialog-link button font-face" data-id="" type="button" value="Prideti">
</div>

</body>
</html>