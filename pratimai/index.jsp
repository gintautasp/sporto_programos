<!DOCTYPE html>
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.text.*,java.util.*,java.io.BufferedReader,java.io.IOException,java.io.FileReader,commons.Pratimai" %>
<html>
	<head>
		<meta charset="utf-8">
		<style>
			th {
				background-color: #A40A3A
			}
		</style>	
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="	crossorigin="anonymous">
	</script>
	
	<script>
	$( document ).ready ( function() {
	
		pratimai = { pav: 0, pastabos: 0, lygis_sunkumo: 0, id_kito_lygio: 0, id: 0 };
	
		$( '.edit' ).click ( function() {
		
			pratimai.id 				= $( this ).data( 'id' );	
			pratimai.pav				= $( this ).data( 'pav' );
			pratimai.lygis_sunkumo 		= $( this ).data( 'lygis_sunkumo' );
			pratimai.id_kito_lygio 			= $( this ).data( 'id_kito_lygio' );
			pratimai.pastabos			= $( this ).data( 'pastabos' );
						
			$( '#pav' ).val ( pratimai.pav );
			$( '#pastabos' ).val ( pratimai.pastabos );
			$( '#lygis_sunkumo' ).val ( pratimai.lygis_sunkumo );
			$( '#id_kito_lygio' ).val ( pratimai.id_kito_lygio );
			$( '#id' ).val ( pratimai.id );			
		});
		
		$( '.remove' ).click( function() {
						
			pratimai.id  = $( this ).data ( 'id' );
								
			$( '#pratimai2_idx' ).val ( pratimai.id  );
			
			$( '#remove' ).submit();
			
		});
	});
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
<h2 align="center"><strong>Pratimai</strong></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr>
	<th>Id</th>
	<th>Pratimas</th>
	<th>Pastabos</th>
	<th>Sunkumo lygis</th>
	<th>x</th>	
	<th>Veiksmai</th>
	
</tr>
<%
	Pratimai pratimai   = new Pratimai();
	//Pratimai pratimai2 = new Pratimai();
	try{	     
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");		
		
	} catch(Exception e) {}

	try{ 	
		String jdbcutf8 = "";
		connection = DriverManager.getConnection ( connectionUrl + dbName + jdbcutf8, userid, password );
		
		String add;		
		
		if ( ( ( add = request.getParameter("add")  ) != null ) && add.equals ( "papildyti" ) ) {
				
			pratimai.pav = request.getParameter("pav");
			pratimai.pastabos =request.getParameter("pastabos");
			pratimai.lygis_sunkumo = Integer.parseInt(request.getParameter("lygis_sunkumo"));	
			pratimai.id_kito_lygio = Integer.parseInt(request.getParameter("id_kito_lygio"));	
			pratimai.id = Integer.parseInt(request.getParameter("id"));
			
			String sql_ins ="";    
						
			if (pratimai.id !=0){	
			
				sql_ins=
					"UPDATE `pratimai` SET `id`" 
					+ '=' + "'" + pratimai.id+ "'" 
					+ ","	+"`pav`"					+ '=' + "'" + pratimai.pav 			+ "'" 
					+ ","	+"`pastabos`" 				+ '=' + "'" + pratimai.pastabos 		+ "'" 
					+ ","  +"`lygis_sunkumo`" 			+ '=' + "'" + pratimai.lygis_sunkumo 	+ "'" 
					+ ","	+"`id_kito_lygio`" 			+ '=' + "'" + pratimai.id_kito_lygio 	+ "'" 
					+ ","	+"WHERE 1;";
			} else {
			
				sql_ins = 
					"INSERT INTO `pratimai`"
					+ " ( `pav`, `pastabos`, `lygis_sunkumo`, `id_kito_lygio`)"
					+ " VALUES ( "			
					+ "'" 		+ pratimai.pav +"'"
					+ "," + "'" + pratimai.pastabos +"'"
					+ "," + "'" + pratimai.lygis_sunkumo +"'"
					+ "," + "'" + pratimai.id_kito_lygio +"'"
					+ " )";

			out.println ( sql_ins );

				statement_change = connection.createStatement();
				resultSetChange = statement_change.executeUpdate(sql_ins);			
			
			}  
		}
			statement=connection.createStatement();		
			String sql ="SELECT * FROM `pratimai`  WHERE 1";

			resultSet = statement.executeQuery(sql);
			
			
			
			String remove= "";
			
			if  ( ( ( remove = request.getParameter("trinti")  ) != null ) && remove.equals ( "trinti" ) ){
				
				String sql_ins;
											
				String pratimai2_id=request.getParameter("pratimai2_idx");
				out.println (pratimai2_idx );
					sql_ins=
						"DELETE FROM `pratimai` WHERE `pratimai`.`id` = "+ "'" + pratimai2_id + "'" +";";
						
				System.out.println(sql_ins);	
				statement=connection.createStatement();
				int istrinta=statement.executeUpdate(sql_ins);		
			
			 }	
			Pratimai pratimai2 = new Pratimai();
			while( resultSet.next() ){
		
			pratimai2.pav = resultSet.getString ( "pav" );
			pratimai2.pastabos = resultSet.getString  ("pastabos");
			pratimai2.lygis_sunkumo = Integer.parseInt(resultSet.getString ( "lygis_sunkumo" ));
			pratimai2.id_kito_lygio = Integer.parseInt(resultSet.getString ( "id_kito_lygio" ));
			pratimai2.id = Integer.parseInt(resultSet.getString("id"));
%>
<tr style="background-color: #DEB887">
	<td><%= resultSet.getString ( "id" ) %></td>
	<td><%= resultSet.getString ( "pav" ) %></td>
	<td><%= resultSet.getString ("pastabos" ) %></td>
	<td><%=resultSet.getString ( "lygis_sunkumo" ) %></td>
	<td><%=resultSet.getString ( "id_kito_lygio" ) %></td>
	<td><input class="edit" data-pav="<%=pratimai2.pav%>" data-pastabos="<%=pratimai2.pastabos%>" data-lygis_sunkumo="<%=pratimai2.lygis_sunkumo%>" data-id_kito_lygio="<%=pratimai2.id_kito_lygio%>" data-id="" type="button" value="Keisti" id="keiciam">
		<input class="remove" data-id="<%=pratimai2.id%>" type="button" value="X" ></td>
</tr>
<% 		
		}
		}catch (Exception e) {
	
			e.printStackTrace();
			
		}	
		
		
%>

</table>
<center>
<form method="post" action="">
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>	
	<th>Pratimas</th>
	<th>Pastabos</th>
	<th>Sunkumo lygis</th>
	<th>x</th>
</tr>

<tr>
	<td>
		<input type="text" name="pav" id="pav" value="">
	</td>
	<td>
		<input type="text" name="pastabos" id="pastabos" value="">
	</td>
	<td>
		<input type="number" name="lygis_sunkumo" id="lygis_sunkumo" value="">
	</td>
	<td>
		<input type="number" name="id_kito_lygio" id="id_kito_lygio" value="">
	</td>
	<td> 
		<input type="submit" name="add" value="papildyti">
	</td>
	
</tr>
</table>
<input type="hidden" class="edit" id="pratimai2_id" name="pratimai2_id" value="0">
</form>
<form method="post" action="" id="remove">
<input type="hidden" class="edit" id="pratimai2_idx" name="pratimai2_id" value="1">
<input type="hidden" name="trinti" id="trinti" value="trinti">
</form>
</center>
</body>