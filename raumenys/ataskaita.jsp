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

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script>

      String sql ="SELECT `raumenys`.`id_raumens`,`raumenys`.`pav`,`raumenys`.`id_raumenu_grupes`,"
      + "`raumenu_grupes`.`raumenu_grupe`,"
      + "COUNT( `pratimai`.`id` ) AS `pratimu_skaicius`"
      + "FROM `raumenys` "
      + "LEFT JOIN `raumenu_grupes` ON ( `raumenys`.`id_raumenu_grupes`=`raumenu_grupes`.`id` )"
      + "LEFT JOIN `pratimai_raumenys` ON ( `pratimai_raumenys`.`id_raumenys`=`raumenys`.`id` )";

      //sugrupuoti pagal sunkumo lygi group by pgl raumenis (id_raumens) paskui pagal sunkumo lygi
      //padaryt isrinkima pagal sunkumo lygi WHERE varrianas visi lygiai sunkumo ir kiekvienas atskirai.

      /*
      String sql="SELECT `raumenys`.`id_raumens`,`raumenys`.`pav`,`raumenys`.`id_raumenu_grupes`,`raumenu_grupes`.`raumenu_grupe`,`pratimai`.`id`,`pratimai`.`pav`"
      FROM `raumenys`, `raumenu_grupes`, `pratimai`
      WHERE `raumenu_grupes`.`raumenu_grupes_id`=`raumenu_grupe`.`id`
      AND `pratimai`.`pratimai_id`=`pratimai`.`id`
      */
      //count pratimai_id

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
