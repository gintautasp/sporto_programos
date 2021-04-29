<!DOCTYPE html>
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.text.*,java.util.*,java.io.BufferedReader,java.io.IOException,java.io.FileReader,raumenys.RaumenysIrGrupes" %>

<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Dialog - Modal form</title>
  <link rel="stylesheet" href="https:/code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">

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

    /*
    body {
    font-family: Arial, Helvetica, sans-serif;
    }

    table {
    font-size: 1em;
    }

    .ui-draggable, .ui-droppable {
    background-position: top;
    }
    */

    label, input { display:block; }
    input.text { margin-bottom:12px; width:95%; padding: .4em; }
    fieldset { padding:0; border:0; margin-top:25px; }
    h1 { font-size: 1.2em; margin: .6em 0; }
    div#users-contain { width: 350px; margin: 20px 0; }
    div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
    div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
    .ui-dialog .ui-state-error { padding: .3em; }
    .validateTips { border: 1px solid transparent; padding: 0.3em; }
</style>

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>

  $( function() {
    var dialog,

    raumenu_grupe = $( "#raumenu_grupe" ),
    raumens_pav = $( "#raumens_pav" ),
    allFields = $( [] ).add( raumenu_grupe ).add( raumens_pav ),
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

    function PridetiRaumeni() {
      var valid = true;
      allFields.removeClass( "ui-state-error" );

      valid = valid && checkLength( raumenu_grupe, "raumenu grupe", 3, 16 );
      valid = valid && checkLength( raumens_pav, "raumens pav", 6, 80 );

      valid = valid && checkRegexp( raumenu_grupe, /^[a-z]([0-9a-z_\s])+$/i, "" );
      valid = valid && checkRegexp( raumens_pav, /^[a-z]([0-9a-z_\s])+$/i, "" );

      /*if ( valid ) {
        $( "#users tbody" ).append( "<tr>" +
          "<td>" + raumenu_grupe.val() + "</td>" +
          "<td>" + raumens_pav.val() + "</td>" +
        	"</tr>" );
        	dialog.dialog( "close" );
      }
      return valid;
    }
    */
    if ( valid ) {
      $( "#raumenu_sarasas" ).submit();
    }
    return valid;
  }


    dialog = $( "#dialog-form" ).dialog({
      autoOpen: false,
      height: 400,
      width: 350,
      modal: true,
      buttons: {
        "Raumens_pridejimas": PridetiRaumeni,
        Cancel: function() {
          dialog.dialog( "close" );
        }
      },
      close: function() {
        //form[ 0 ].reset();
        allFields.removeClass( "ui-state-error" );
      }
    });

    /*form = dialog.find( "form" ).on( "submit", function( event ) {
      event.preventDefault();
      PridetiRaumeni();

    });
    */

    $( "#create-user" ).button().on( "click", function() {
      dialog.dialog( "open" );
    });

    /*  $.ajax({
      url: "file:///darbai.csv",
      }).done(function(data) {
        alert(data);
      });
    */
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
  	String connectionUrl = "jdbc:mysql://localhost:3306/";
  	String dbName = "sporto_programos";
  	String userid = "root";
  	String password = "";
  	Connection connection = null;
  	Statement statement = null, statement_change = null;
  	ResultSet resultSet = null;
  	int resultSetChange = 0;

	try{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

	} catch(Exception e) {}

	try{
		String jdbcutf8 = "";
		connection = DriverManager.getConnection ( connectionUrl + dbName + jdbcutf8, userid, password );

		// cia keliam irasyma i duomenu baze

		RaumenysIrGrupes raumenys = new RaumenysIrGrupes();

		    String add;

		      if ( ( ( add = request.getParameter("add")  ) != null ) && add.equals ( "papildyti" ) ) {

			raumenys.pav = request.getParameter("pav");
			raumenys.id_raumens = Integer.parseInt ( request.getParameter("id_raumens") );
			raumenys.id_raumenu_grupes = Integer.parseInt(request.getParameter("id_raumenu_grupes"));

			String sql_ins ="";

			  if (raumenys.id_raumens !=0){

			    sql_ins=
			      "UPDATE `raumenys` SET "
				+ "`pav`"					+ '=' + "'" + raumenys.pav 			          + "'"
			      + ","	+ "`pastabos`" 		+ '=' + "'" + raumenys.id_raumenu_grupes 	+ "'"
			      + ","	+ "WHERE `id_raumens`=" + raumenys.id_raumens ;
			  } else {

			    sql_ins =
			      "INSERT INTO `raumenys`"
			      + " ( `pav`, `id_raumens`, `id_raumenu_grupes`)"
			      + " VALUES ( "
			      + "'" 	   	+ raumenys.pav               +"'"
			      + "," + "'" + raumenys.id_raumens        +"'"
			      + "," + "'" + raumenys.id_raumenu_grupes +"'"
			      + " )";
			  out.println ( sql_ins );
			    statement_change = connection.createStatement();
			    resultSetChange = statement_change.executeUpdate(sql_ins);

			  }
		      }

        statement=connection.createStatement();
        String sql ="SELECT * FROM `raumenys`  WHERE 1";
        resultSet = statement.executeQuery(sql);

        String remove= "";

        if  ( ( ( remove = request.getParameter("trinti")  ) != null ) && remove.equals ( "trinti" ) ){

          String sql_ins;

          String raumenys2_id=request.getParameter("raumenys.id");

            sql_ins=
              "DELETE FROM `raumenys` WHERE `raumenys`.`id` = "+ "'" + raumenys2_id+ "'" +";";

          System.out.println(sql_ins);
          statement=connection.createStatement();
          int istrinta=statement.executeUpdate(sql_ins);

        }

	statement=connection.createStatement();
		sql ="SELECT `raumenys`.`id_raumens`,`raumenys`.`pav`,`raumenys`.`id_raumenu_grupes`,`raumenu_grupes`.`raumenu_grupe`"
		+ "FROM `raumenys` LEFT JOIN `raumenu_grupes` ON ( `raumenys`.`id_raumenu_grupes`=`raumenu_grupes`.`id` ) WHERE 1";
		resultSet = statement.executeQuery(sql);
  %>

<div id="dialog-form" title="prideti nauja raumeni">
  <p class="validateTips">Privalu užpildyti visus laukelius</p>

  <form id="raumenu_sarasas" method="POST" action="">
    <fieldset>
      <label for="raumenu_grupe">raumenu grupe</label>
      <input type="text" name="raumenu_grupe" id="raumenu_grupe" value="" class="text ui-widget-content ui-corner-all">
      <label for="raumens_pav">raumens pav</label>
      <input type="text" name="raumens_pav" id="raumens_pav" value="" class="text ui-widget-content ui-corner-all">
	//<!-- prisideti input type="hidden" name="add" value=" .. ".. !>
      <input type="hidden" class="edit" id="raumenys2_id" name="raumenys2_id" value="0">
      <input type="hidden" name="trinti" id="trinti" value="trinti">
      <!-- Allow form submission with keyboard without duplicating the dialog button -->
      <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
    </fieldset>
  </form>
</div>


<div id="users-contain" class="ui-widget">
  <h1>Esamos raumenu grupes</h1>
  <table id="users" class="ui-widget ui-widget-content">
    <thead>
      <tr class="ui-widget-header ">
        <th>raumenu grupe</th>
        <th>raumens pav</th>
      </tr>
    </thead>
    <tbody>
    <%
		RaumenysIrGrupes raumenys2 = new RaumenysIrGrupes();

		while( resultSet.next() ) {

			raumenys2.pav = resultSet.getString ( "pav" );
			raumenys2.raumenu_grupe = resultSet.getString  ("raumenu_grupe");
			raumenys2.id_raumens = Integer.parseInt(resultSet.getString("id_raumens"));
			raumenys2.id_raumenu_grupes = Integer.parseInt(resultSet.getString("id_raumenu_grupes"));
%>
<tr style="background-color: #DEB887" >
	//<td><%= raumenys2.id_raumens %></td>
	<td><%= raumenys2.pav %></td>
	//<td><%= raumenys2.id_raumenu_grupes %></td>
	<td><%= raumenys2.raumenu_grupe %></td>
	<td><input class="dialog-link edit ui-button ui-corner-all ui-widget button redagavimas" data-pav="<%= raumenys2.pav %>" data-id_raumens="<%= raumenys2.id_raumens %>" data-id_raumenu_grupes="<%= raumenys2.id_raumenu_grupes %>" data-raumenu_grupe="<%= raumenys2.raumenu_grupe %>" data-id="" type="button" value="&#9881" id="keiciam">
		<input class="ui-button ui-corner-all ui-widget dialog-link button" data-id="<%= raumenys2.id_raumens %>" type="button" value="X">

</tr>
<%
		}

	} catch (Exception e) {

		e.printStackTrace();

	}


%>
      <tr>
      </tr>
    </tbody>
  </table>
</div>
<button id="create-user">prideti nauja raumeni</button>


</body>
</html>
