<!DOCTYPE html>
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.text.*,java.util.*,java.io.BufferedReader,java.io.IOException,java.io.FileReader, pratimai.*" %>
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
	
	String[] lent_programos = { "id", "pav" };
	String[] lauk_programos = new String [ lent_programos.length ];
	DbMySql db_mysql = new DbMySql();
	
	CrudXY crud_programos = new CrudXY ( db_mysql, "treniruociu_planai", lent_programos );
	try { 
	
		QuerySaveResult qrs = new QuerySaveResult();
		String add = request.getParameter ( "add" ); 		
		System.out.println("msg " + add);	
		if ( ( ( add  ) != null ) && add.equals ( "saugoti" ) ) {
		
			String id_planas = request.getParameter ( "id_planas" );
			System.out.println(id_planas);		
			
			for ( int i = 1; i<lent_programos.length; i++ ) {
			
				lauk_programos [ i ] = request.getParameter ( lent_programos [ i ] );
			}
			qrs = crud_programos.save ( id_planas, lauk_programos );	
		 } 
		 
		String del;
	
		if ( ( ( del = request.getParameter ( "del" )  ) != null ) && del.equals ( "del1rec" ) ) {
		
			String id_planas = request.getParameter ( "p_del" );
			// out.println ( "id programos.: ." + id_planas + "." );		
			qrs = crud_programos.delete ( id_planas );
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
		label, input { display:block; }
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
		#sortable1, #sortable2 {
			border: 1px solid #eee;
			width: 142px;
			min-height: 20px;
			list-style-type: none;
			margin: 0;
			padding: 5px 0 0 0;
			float: left;
			margin-right: 10px;
		}
		#sortable1 li, #sortable2 li {
			margin: 0 5px 5px 5px;
			padding: 5px;
			font-size: 1.2em;
			width: 120px;
		}
	</style>
	<script>
	$( function() {
	var dialog, form,

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

	dialog = $( "#dialog" ).dialog({
		autoOpen: false,
		height: 500,
		width: 500,
		modal: true,
		buttons: {
		"Patvirtinti": pridetiPratima,
		Cancel: function() {
			dialog.dialog( "close" );
		}
		},
		close: function() {
		form[ 0 ].reset();
		allFields.removeClass( "ui-state-error" );
		}
	});

	form = dialog.find( "form" );

	$( ".dialog-link" ).button().on( "click", function() {
		dialog.dialog( "open" );
		});
	} );

	</script>
	<script>
		$( function() {
			$( "#sortable1, #sortable2" ).sortable({
				connectWith: ".connectedSortable"
			}).disableSelection();
		} );
	</script>
	
	<script>
		<%= crud_programos.jsRedagavimui ( "id_planas" ) %> 
		<%= crud_programos.jsValymui() %>
		<%= crud_programos.jsTrynimui ( "pratimas" ) %>
	</script>
</head>
<body>
<div id="dialog" title="Create new user">
  <p class="validateTips">All form fields are required.</p>
 
	<form method="POST">
		<fieldset>
			<label for="pav">Pavadinimas</label>
			<input type="text" name="pav" id="pav" class="text ui-widget-content ui-corner-all">
			<input type="hidden" id="id_planas" name="id_planas" value="0">
			<input type="hidden" id="alert" name="alert" value="0">
			<input type="hidden" id="add" name="add" value="saugoti">
			
			<ul id="sortable1" class="connectedSortable">
				<li class="ui-state-default">Item 1</li>
				<li class="ui-state-default">Item 2</li>
				<li class="ui-state-default">Item 3</li>
				<li class="ui-state-default">Item 4</li>
				<li class="ui-state-default">Item 5</li>
			</ul>

			<ul id="sortable2" class="connectedSortable">
			</ul>
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

<h2 align="center" class="font-face" style="color: #fff;font-size:42px;"><strong>Pratimai</strong></h2>


<table align="center" cellpadding="4" cellspacing="2">
<tr>

</tr>
<tr>
	<th class="font-face">Id</th>
	<th class="font-face">Pavadinimas</th>
	<th class="font-face">Veiksmai</th>
</tr>
<%
	try {
	
		String sql = crud_programos.select( "" );
		 
		while( crud_programos.db_mysql.flag_got_rows ) {
		
			String rec_data = "";
			
			AssocArrayList lst_row_fields = crud_programos.db_mysql.giveSelectedRow();
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
	<td><input class="dialog-link edit ui-button ui-corner-all ui-widget button redagavimas" id="toEdit_<%= id_rec  %>" data-id_gal="<%= id_rec  %>" <%= rec_data %> type="button" value="&#9881">
		<input class="ui-button ui-corner-all ui-widget button" id="toDelete_<%= id_rec  %>" data-id_gal="<%= id_rec %>" type="button" value="X"></td>
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