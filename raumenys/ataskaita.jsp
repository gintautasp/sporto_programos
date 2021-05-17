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

    table {
      border-radius:6px;
    }

    td, th {
      text-align: center;
      font-weight: bold;
      border-radius:6px;
      background-color: #9370DB;
    }

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

  <script  src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>  <!-- Reikia kad veiktu 'reda' funkcija -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="../ext/jquery-ui-1.12.1.custom/jquery-ui.js"></script>

    <script>

    //sugrupuoti pagal sunkumo lygi group by pgl raumenis (id_raumens) paskui pagal sunkumo lygi
    //padaryt isrinkima pagal sunkumo lygi WHERE varianas visi lygiai sunkumo ir kiekvienas atskirai.

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
  <li><a class="font-face" href="http://localhost:8080/sporto_programos/raumenys/index.jsp">Raumenys</a></li>
  <li><a class="font-face" href="#mityba">Mityba</a></li>
  <li><a class="font-face" href="#naujienos">Naujienos</a></li>
  <li><a class="font-face" href="#kontaktai">Kontaktai</a></li>
  <li><a class="font-face" href="#apie">Apie</a></li>
</ul>

<div id="users-contain" class="ui-widget">
<table style="padding: 2px; margin: 10px; margin-left: auto; margin-right: auto" id="users" >


  <%
	PratimaiRaumenys raumenu_info = new PratimaiRaumenys ();

  try{

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

	} catch(Exception e) {}

	String id_raumens = request.getParameter ( "ir" );

  try{

		String jdbcutf8 = "";
		connection = DriverManager.getConnection ( connectionUrl + dbName + jdbcutf8, userId, password );

    statement=connection.createStatement();
    String sql =
    "SELECT `raumenys`.`id_raumens`,`raumenys`.`pav` AS `pav_praumens`,`raumenys`.`id_raumenu_grupes`,"
    + "COUNT(`pratimai`.`id`) AS `kiekis_pratimu`,`pratimai`.`lygis_sunkumo`,`pratimai`.`id_kito_lygio`"
    + " FROM `pratimai`"
    + "LEFT JOIN `pratimai_raumenys` ON `pratimai_raumenys`.`id_pratimai` = `pratimai`.`id`"
    + "LEFT JOIN `raumenys` ON `raumenys`.`id_raumens` = `pratimai_raumenys`.`id_raumenys`"
    + "GROUP BY `pratimai`.`lygis_sunkumo`,`raumenys`.`id_raumens`";

    resultSet = statement.executeQuery(sql);

    %>

    <tr>							<!-- Lentelės reikšmių pavadinimai -->
      <th class="font-face">Raumens pavadinimas</th>
      <th class="font-face">Pratimo pavadinimas</th>
      <th class="font-face">Sunkumo lygis</th>
    </tr>

  <%
  while( resultSet.next() ){				//užpildo lentelę

    PratimaiRaumenys.id_raumens         = resultSet.getString ( "id_raumens" );
    PratimaiRaumenys.pav_raumens        = resultSet.getString ( "pav_raumens" );
    PratimaiRaumenys.id_raumenu_grupes  = resultSet.getString ( "id_raumenu_grupes" ) ;
    PratimaiRaumenys.id_pratimo         = resultSet.getString ( "id_pratimo" );
    PratimaiRaumenys.pav_pratimo        = resultSet.getString ( "pav_pratimo" );
    PratimaiRaumenys.lygis_sunkumo      = resultSet.getString ( "lygis_sunkumo" );
    PratimaiRaumenys.id_kito_lygio      = resultSet.getString ( "id_kito_lygio" ) ;
  %>

  <tr style="background-color: ##DEB887; padding: 1px " >
    <td style="color:#fff"><%=PratimaiRaumenys.pav_raumens %></td>
    <td style="color:#fff"><%=PratimaiRaumenys.pav_pratimo %></td>
    <td style="color:#fff"><%=PratimaiRaumenys.lygis_sunkumo  %></td>
  </tr>

  <%
      }
    }
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

    <label for="lygis_sunkumo">Pasirinkti sunkumo lygi:</label>

    <select name="lygis_sunkumo" id="id_kito_lygio">
       <option value="1">Pirmas sunkumo lygis</option>
       <option value="2">Antras sunkumo lygis</option>
       <option value="3">Trecias sunkumo lygis</option>
       <option value="4">Visi sunkumo lygiai</option>
    </select>

  </table>
  <input type="hidden" id="id" name="id" value="0">
  <input type="submit" name="add" value="Pasirinkti" style="center">
  </form>
</fieldset>

</body>
