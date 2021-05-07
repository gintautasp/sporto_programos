<!DOCTYPE html>
<%@include file="../commons/start.jsp" %>
<%

	String[] lent_programos = { "id", "pav", "trukme", "aprasymas" };
	String[] lauk_programos = new String [ lent_programos.length ];

	CrudXYsimple crud_programos = new CrudXYsimple ( db_mysql, "programos", lent_programos );
%>
<%@include file="save.jsp" %>
<html>
	<head>
		<meta charset="utf-8">
		<title>Treniruočių programos </title>
		<style>
			<%@include file="../frontface/crud.css" %>
		</style>
		<script>
			<%= crud_programos.jsRedagavimui ( "id_programos" ) %>
			<%= crud_programos.jsValymui() %>
			<%= crud_programos.jsTrynimui ( "programos" ) %>
		</script>
	</head>
<body>
<%@include file="../commons/meniu.jsp" %>
<%@include file="programos_forma.html" %>
<%@include file="list.jsp" %>
</body>
</html>
