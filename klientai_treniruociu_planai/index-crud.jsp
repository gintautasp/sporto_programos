<!DOCTYPE html>
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page language="java" import="commons.*" %>
<%@page language="java" import="crud.*,java.text.*,java.util.*" %>
<%
	try {

		request.setCharacterEncoding ( "UTF-8" );
		response.setContentType ( "text/html; charset=UTF-8" );
		response.setCharacterEncoding ( "UTF-8" );

	} catch ( Exception e ) {

		e.printStackTrace();
	}

	String[] lent_klientai_treniruociu_planai= { "id", "id_kliento", "id_treniruotes_plano", "data", "rezultatai"};
	String[] lauk_klientai_treniruociu_planai = new String [ lent_klientai_treniruociu_planai.length ];

	DbMySql db_mysql = new DbMySql();

	CrudXYsimple crud_KlientaiTreniruociuPlanai = new CrudXYsimple ( db_mysql, "klientai_treniruociu_planai", lent_klientai_treniruociu_planai);
	try {

		QuerySaveResult qrs = new QuerySaveResult();
		String add = request.getParameter ( "add" );

		if ( ( ( add  ) != null ) && add.equals ( "saugoti" ) ) {

			String id = request.getParameter ( "id" );

			for ( int i = 1; i<lent_klientai_treniruociu_planai.length; i++ ) {

				lauk_klientai_treniruociu_planai [ i ] = request.getParameter ( lent_klientai_treniruociu_planai[ i ] );
			}
			lauk_klientai_treniruociu_planai[1]=request.getParameter("ik");
			qrs = crud_KlientaiTreniruociuPlanai.save ( id, lauk_klientai_treniruociu_planai );
		 }

		String del;

		if ( ( ( del = request.getParameter ( "del" )  ) != null ) && del.equals ( "del1rec" ) ) {

			String id = request.getParameter ( "p_del" );
			// out.println ( "id programos.: ." + id_raumens + "." );
			qrs = crud_KlientaiTreniruociuPlanai.delete ( id );
		}

	}  catch ( Exception e ) {

		e.printStackTrace();
	}
%>
<html>
	<head>
		<meta charset="utf-8">
		<style>
			table {
				border-collapse: collapse;
			}
			form {
				float: right;
			}
			input {
				width: 111px;
			}
			th, td {
				padding: 3px 4px;
				border: 1px solid black;
			}
			th {
				background-color: #A52A2A;
			}
			td {
				background-color: #DEB887;
			}
		</style>

		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		<script>
			<%= crud_KlientaiTreniruociuPlanai.jsRedagavimui ( "id" ) %>
			<%= crud_KlientaiTreniruociuPlanai.jsValymui() %>
			<%= crud_KlientaiTreniruociuPlanai.jsTrynimui ( "programos" ) %>
		</script>
	</head>
<body>
<form method="post" action="" id="ivedimoForm">
		<table style="border: 5px solid black" id="listKlientai">
		<!-- Apacia -->						
		<tr>		<th>Treniruotes plano ID</th>	
			<td>
				<select id="id_treniruotes_plano" name="id_treniruotes_plano" >
					<option value="0" selected disabled hidden>Pasirinkite treniruotės planą</option>
						<%= crud_KlientaiTreniruociuPlanai.getListAsOptions("treniruociu_planai","id","pav") %>
				</select>				
			</td>
		</tr>
		<% SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); %>
		<tr>		<th>Data					</th>	<td>	<input type="date" name="data" value="<%= sdf.format(new Date()) %>" id="data" class="text ui-widget-content ui-corner-all">									</td></tr>
		<tr>		<th>Rezultatai				</th>	<td>	<input type="text" name="rezultatai" value="rezultatas" id="rezultatai" class="text ui-widget-content ui-corner-all">							</td></tr>
		<tr>
			<td colspan="2">
				
				<input type="button" name="clear" value="valyti" onClick = "iValyma()"> 
				<input type="submit" name="add" value="saugoti">
			</td>
		</tr>
		</table>
		<input type="hidden" id="id" name="id" value="0">  
		<input type="hidden" name="add" value="Papildyti">
</form>
<table align="center">
<tr>
</tr>
<tr>
	<th>Veiksmai</th>
	<th>ID</th>
	<th>Kliento ID</th>
	<th>Treniruotes ID</th>
	<th>Data</th>
	<th>Rezultatai</th>
</tr>
<%
	try {

		String sql = crud_KlientaiTreniruociuPlanai.select( "" );

		while( crud_KlientaiTreniruociuPlanai.db_mysql.flag_got_rows ) {

			String rec_data = "";

			AssocArrayList lst_row_fields = crud_KlientaiTreniruociuPlanai.db_mysql.giveSelectedRow();

			for ( int i = 0; i < lauk_klientai_treniruociu_planai.length; i++ ) {
				rec_data += " data-"  + ( lent_klientai_treniruociu_planai[ i ] )   + "=\"" +  ( ( String ) lst_row_fields.giveMe (  lent_klientai_treniruociu_planai[ i ]  ) ) + "\"";
			}
			String id_rec =  ( String ) lst_row_fields.giveMe (   "id"  );
%>
<tr>
	<td>
		<input type="button" class="record_edit"  id="toEdit_<%= id_rec  %>" data-id_gal="<%= id_rec  %>"<%= rec_data %> value="&#9998;" onClick="iRedagavima( <%= id_rec %> )">
		<input type="button" class="delete"  id="toDelete_<%= id_rec  %>" data-id_gal="<%= id_rec %>" value="&#10007;" onClick="iTrinima( <%= id_rec %> )">
	</td>

<%
		for ( int i = 0; i < lauk_klientai_treniruociu_planai.length; i++ ) {
%>
	<td><%=  lst_row_fields.giveMe (  lent_klientai_treniruociu_planai [ i ]  ) %></td>
<%
		}
%>
</tr>
<%
		}
	} catch ( Exception e ) {

		e.printStackTrace();
	}
%>
</table>
</body>
</html>
