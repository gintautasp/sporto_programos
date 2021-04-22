<!DOCTYPE html>
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.text.*,java.util.*,java.io.BufferedReader,java.io.IOException,java.io.FileReader,commons.*" %>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<title> Planai</title>
	<style> <!--Page style-->
		html {
			min-height: 100%;
			height:100%;
		}
		body{
			padding: 0;
			margin: 0;
			width: 100%;
			height:100%;
		}
		#main {
			display: flex;
			height:100%;
			width:100%;
		}
		#mainContent {
			flex: 60%;
			background-color: #f9fbdc;
		}
		#leftSide {
			flex: 20%;
			margin-left: px;
			background-color: #FFC33C;
		}
		#rightSide {
			flex: 20%;
			margin-left: px;
			background-color: #FFC33C;
		}
		#title{
			margin: auto;
			width: 95%;
			border: 3px solid #000000;
			padding: 20px;
			text-align: center;
		}
		#footer
		{
			clear: both;
			border: 1px groove #aaaaaa;
			background: #06B2F8;
			color: White;
			padding: 0;
			text-align: center;
			vertical-align: middle;
			line-height: normal;
			margin: 0;
			position: fixed;
			bottom: 0px;
			width: 100%;
		}
		.modify-excersise {
			width: 100%;
		}
	</style>
	<style> <!--Navigation style-->
		#navbar a:hover {
			background-color: #ddd;
			color: black;
		}

		#navbar a.active {
			background-color: #4CAF50;
			color: white;
		}
		#navbar a {
			float: left;
			display: block;
			color:  #201c1c;
			text-align: center;
			padding: 20px 16px;
			text-decoration: none;
			font-size: 17px;
		}
		#navbar {
			position: -webkit-sticky;
			position: sticky;
			top: 0;
			overflow: hidden;
			background-color: #FFC33C;
			border-collapse: collapse;
			border: 3px solid black;
		}

		#navbar a {
			position: -webkit-sticky;
			position: sticky;
			float: left;
			display: block;
			color: #201c1c;
			text-align: center;
			padding: 14px 16px;
			text-decoration: none;
			font-size: 17px;
			margin-left: -3px
		}

		#navbar a:hover {
			background-color: #06B2F8;
			color: black;
			margin-left: -3px
		}

		#navbar a.active {
			background-color: #FF4C65;
			color: #201c1c;
			margin-left: -3px
		}
		
	</style>
	<style> <!--Table style-->
		table{
			border-collapse: collapse;
		}
		#navtable td{
			border-collapse: collapse;
			border-right: 3px solid black;
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
	emailRegex = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/,
	name = $( "#name" ),
	email = $( "#email" ),
	password = $( "#password" ),
	allFields = $( [] ).add( name ).add( email ).add( password ),
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

	function addUser() {
		var valid = true;
		allFields.removeClass( "ui-state-error" );

		valid = valid && checkLength( name, "username", 3, 16 );
		valid = valid && checkLength( email, "email", 6, 80 );
		valid = valid && checkLength( password, "password", 5, 16 );

		valid = valid && checkRegexp( name, /^[a-z]([0-9a-z_\s])+$/i, "Username may consist of a-z, 0-9, underscores, spaces and must begin with a letter." );
		valid = valid && checkRegexp( email, emailRegex, "eg. ui@jquery.com" );
		valid = valid && checkRegexp( password, /^([0-9a-zA-Z])+$/, "Password field only allow : a-z 0-9" );

		if ( valid ) {
			$( "#users tbody" ).append( "<tr>" +
			"<td>" + name.val() + "</td>" +
			"<td>" + email.val() + "</td>" +
			"<td>" + password.val() + "</td>" +
			"</tr>" );
			dialog.dialog( "close" );
		}
		return valid;
	}

	dialog = $( "#dialog-form" ).dialog({
		autoOpen: false,
		height: 500,
		width: 500,
		modal: true,
		buttons: {
		"Create an account": addUser,
		Cancel: function() {
			dialog.dialog( "close" );
		}
		},
		close: function() {
		form[ 0 ].reset();
		allFields.removeClass( "ui-state-error" );
		}
	});

	form = dialog.find( "form" ).on( "submit", function( event ) {
		event.preventDefault();
		addUser();
	});

	$( ".modify-excersise" ).button().on( "click", function() {
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
</head>
<body>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost/";
	String dbName = "sporto_programos";
	String userId = "root";
	String password = "";
	String jdbcutf8 = "";
	
	Connection connection = null;
	Statement statement = null, statement_change = null;
	ResultSet resultSet = null;
	int resultSetChange = 0;
	
	Pratimai pratimai   = new Pratimai();
	
	try {
	     
		request.setCharacterEncoding ( "UTF-8" );
		response.setContentType ( "text/html; charset=UTF-8" );
		response.setCharacterEncoding ( "UTF-8" );		
		
	} catch ( Exception e ) { 
	
		e.printStackTrace();
	}
	
	try { 
	
		connection = DriverManager.getConnection ( connectionUrl + dbName + jdbcutf8, userId, password );		
	
		
		statement=connection.createStatement();		
		String sql ="SELECT * FROM `klientai_treniruociu_planai` `ktp` "
			      + "LEFT JOIN `treniruociu_planai` `tp` on `ktp`.`id_treniruotes_plano`=`tp`.`id` "
			      + "WHERE `ktp`.`id_kliento` = 1 ";

		resultSet = statement.executeQuery(sql);
		 
	}  catch ( Exception e ) {
	
		e.printStackTrace();
	}
%>
<div id="dialog-form" title="Create new user">
  <p class="validateTips">All form fields are required.</p>
 
	<form>
		<fieldset>
			<label for="name">Data</label>
			<input type="date" name="date" id="date" class="text ui-widget-content ui-corner-all">
			<label for="email">Rezultatai</label>
			<input type="text" name="Result" id="Result" class="text ui-widget-content ui-corner-all">
			
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



<div id="main">
	<div id="leftSide">
	</div>
	<div id="mainContent">
		<div id="title">
			<h1>Sporto programa<h1>
		</div>
		<div id="navbar">
			<table id = "navtable">
				<tr>
					<td><a class="active" href="javascript:void(0)">Pagrindinis</a></td>
					<td><a href="javascript:void(0)">Planas</a></td>
					<td><a href="javascript:void(0)">Pratimai</a></td>
				<tr>
			</table>
		</div>
		
		<table align="center" cellpadding="5" cellspacing="5" border="5">
		<tr>	
			<th >Id</th>
			<th>Data</th>
			<th>Rezultatai</th>
			<th>Trenyruotės pavadininas</th>
			<td> <button type="button" class="modify-excersise" >New</button> </td>
		</tr>
		<%
		try{ 
			
			while( resultSet.next() ){
			String id = resultSet.getString ( "ktp.id" );
			String data = resultSet.getString ( "data" );
			String resultatai = resultSet.getString ( "rezultatai" );
			String pav = resultSet.getString ( "pav" );
			
		%>
		<tr>
			<td><%= id %></td>
			<td><%= data %></td>
			<td><%= resultatai %></td>
			<td><%= pav %></td>
			<td> <button type="button" class="modify-excersise" >Select</button> </td>
			
		</tr>
		<%
			}
		} catch (Exception e) {									
			e.printStackTrace();
		}
		%>
		</table>
		
	</div>
	
	<div id="rightSide">
	</div>
</div>
</body>
</html>