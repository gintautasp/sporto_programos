<table align="center">
<tr>
</tr>
<tr>
	<th>Veiksmai</th>
	<th>Pavadinimas</th>
	<th>Trukme</th>
	<th>Aprasymas</th>
</tr>
<%
	try {

		String sql = crud_programos.select( "", "", "" );

		while( crud_programos.db_mysql.flag_got_rows ) {
		
			AssocArrayList lst_row_fields = crud_programos.db_mysql.giveSelectedRow();
%>
<tr>
	<td>
		<input type="button" class="record_edit"  id="toEdit_<%= lst_row_fields.giveMe (  "id" )  %>" <%= crud_programos.getDataList() %> value="&#9998;" onClick="iRedagavima( <%= lst_row_fields.giveMe (  "id" ) %> )">
		<input type="button" class="delete" value="&#10007;"   id="toDelete_<%= lst_row_fields.giveMe (  "id" )  %>" onClick="iTrinima( <%= lst_row_fields.giveMe (  "id" ) %> )">
	</td>
	<td>
		<%= crud_programos.htmlRecRow ( "</td><td>", lst_row_fields ) %>
	</td>
</tr>
<%
		}
		
	} catch ( Exception e ) {

		e.printStackTrace();
	}
%>
</table>