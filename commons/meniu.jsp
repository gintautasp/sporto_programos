<nav>
<%
	
	for ( Meniu m : Meniu.values() ) {
%>
		<a href="<%= m.itemurl() %>"><%= m %></a>
<%
	}
%>
</nav>