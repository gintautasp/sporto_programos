<!DOCTYPE html>
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.text.*,java.util.*,java.io.BufferedReader,java.io.IOException,java.io.FileReader,pratimai.Pratimai" %>
<html>
	<head>
		<meta charset="utf-8">
		<link href="../ext/jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet">
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
				padding: 5px 15px;
				text-align: center;
				text-decoration: none;
				display: inline-block;
				font-size: 20px;
				margin: 0px 0px;
				transition-duration: 0.4s;
			
			}
			.button:hover {
				background-color: #555555;
				color: white;
			}
			.dialog-link{
				color: black;
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="../ext/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
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
	Statement statement2 = null, statement_change2 = null;
	ResultSet resultSet = null;
	ResultSet resultSet2 = null;
	int resultSetChange = 0;

%>

<ul>
  <li><a class="font-face" href="#pagrindinis">Pagrindinis</a></li>
  <li><a class="font-face" href="http://localhost:8080/sporto_programos/klientai/index.jsp">Vartotojas</a></li>
  <li><a class="font-face" href="http://localhost:8080/sporto_programos/trenyruociu-planai/index.jsp">Planai</a></li>
  <li><a class="font-face" href="http://localhost:8080/sporto_programos/pratimai/index.jsp">Pratimai</a></li>
  <li><a class="font-face" href="#mityba">Mityba</a></li>
  <li><a class="font-face" href="#naujienos">Naujienos</a></li>
  <li><a class="font-face" href="#kontaktai">Kontaktai</a></li>
  <li><a class="font-face" href="#apie">Apie</a></li>
</ul>

<h2 align="center" class="font-face" style="color: #fff;font-size:42px;"><strong>Pratimai</strong></h2>

<form method="post" action="">
	<table>
			<td>Sunkumo lygis</td>
			<td>
				<input id="sunkumas" type="number" min="0" name="sunkumas" value = '0'>
			</td>
			<td>
				<input type="submit" name="add" value="Ieškoti">
			</td>
	</table>
</form>

<table align="center" cellpadding="4" cellspacing="2">
<tr>
</tr>
<tr>
	<th class="font-face">Treniruotes rusis</th>
	<th class="font-face">Pratimas</th>
	<th class="font-face">I kiek planu ieina</th>
</tr>
<%
	try{	     
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");	
		
		
	} catch(Exception e) {}

	try { 	
		String jdbcutf8 = "";
		connection = DriverManager.getConnection ( connectionUrl + dbName + jdbcutf8, userid, password );
		
		String sunkumas = request.getParameter ( "sunkumas" ); 	
			 
		statement=connection.createStatement();		
		String sql ="SELECT `p`.`pav`,`tp`.`rusis`, COUNT(*) as `count` FROM `treniruociu_planai` `tp` RIGHT JOIN `pratimai_treniruociu_planai` `ptp` on `ptp`.`id_planai` = `tp`.`id` LEFT JOIN `pratimai` `p` on `p`.`id` = `ptp`.`id_pratimai`";
		if(sunkumas != null  && !sunkumas.equals("0")){
			sql += "WHERE `p`.`lygis_sunkumo` = '" + sunkumas + "'";
		}
		sql += "GROUP by `rusis` ORDER BY `rusis` DESC";
		System.out.println(sql );
		resultSet = statement.executeQuery(sql);
		
		statement2=connection.createStatement();	
		sql ="SELECT `p`.`pav`,`tp`.`rusis`, COUNT(*) as `count` FROM `treniruociu_planai` `tp` RIGHT JOIN `pratimai_treniruociu_planai` `ptp` on `ptp`.`id_planai` = `tp`.`id` LEFT JOIN `pratimai` `p` on `p`.`id` = `ptp`.`id_pratimai` ";
		if(sunkumas != null  && !sunkumas.equals("0")){
			sql += "WHERE `p`.`lygis_sunkumo` = '" + sunkumas + "'";
		}
		sql += "GROUP by `pav` ORDER BY `rusis` DESC";
		
		resultSet2 = statement2.executeQuery(sql);
		resultSet2.next();
		
		while( resultSet.next() ){
%>
<tr>
	<td class="font-face" style="color:#fff"><%= resultSet.getString ( "rusis" ) %></td>
	<td></td>
	<td class="font-face" style="color:#fff"><%= resultSet.getString ( "count" ) %></td>
</tr>

<% 			do {
				
				if(resultSet2.getString ( "rusis" ).equals(resultSet.getString ( "rusis" ))){
%>
<tr>
	<td> </td>
	<td class="font-face" style="color:#fff"><%= resultSet2.getString ( "pav" ) %></td>
	<td class="font-face" style="color:#fff"><%= resultSet2.getString ( "count" ) %></td>
<tr>
<%
					
				}else{
					break;
				}
			}
			while(resultSet2.next());
		}
		}catch (Exception e) {
	
			e.printStackTrace();
			
		}	
		
		
%>
%>
</body>