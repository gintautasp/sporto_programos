<form method="post" action="">
	<table>
		<tr>
			<th>Pavadinimas</th>
			<td>
				<input id="pav" type="text" name="pav" required>
			</td>
		</tr>
		<tr>
			<th>Trukmė</th>
			<td>
				<input id="trukme" type="text" name="trukme" required>
			</td>
		</tr>
		<tr>
			<th>Aprašymas</th>
			<td>
				<input id="aprasymas" type="text" name="aprasymas" required>
			</td>
		</tr>
		<tr>
			<td>
			</td>
			<td>
				<input type="button" name="clear" value="valyti" onClick = "iValyma()">
				<input type="submit" name="add" value="saugoti">
			</td>
		</tr>
	</table>
	<input type="hidden" id="id_programos" name="id_programos" value="0">
	<input type="hidden" id="alert" name="alert" value="0">
</form>