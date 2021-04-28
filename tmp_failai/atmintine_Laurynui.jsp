
	/sporto_programos/klientai
	
		id	Vardas Pavarde
		------------------------	
								<%
									// sukasi ciklas kur pasiimam klientų įrašų eilutes 
									
									while ( resultset_select.next() ) { 
									// ..
								%>
		11	Jonas Jonaitis 			
		12	Antanas Petraitis   <- spaudziam   <a href="/sporto_programos/klientai_treniruociu_planai?ik=<%= resultset_select.getString ( "id" ) %>"><%= resultset_select.getString ( "pav" ) %></a>
		14	Onute Onaite
								<%
									}
								%>
		------------------------
					
	atsidaro kitas puslapis
	
	/sporto_programos/klientai_treniruociu_planai/?ik=12
	
	
		kodas
		
		<%
			...
			
			id_kliento = resquest.getParameter ( "ik" );
			...
			
			"SELECT * FROM `klientai_treniruociu_planai` WHERE `id_kliento`='" + id_kliento + "'"
			