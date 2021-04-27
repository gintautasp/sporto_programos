package library;

import java.sql.*;
import java.util.*;

public class SqlRunner{
	
	public Connection connection = null;
	
	public SqlRunner(Connection conn){
		try{
			System.out.println( "Connecting to database..." );
			connection = conn;
		}catch ( SQLException se ) {
			se.printStackTrace();
		}
	}
	
	public List<PlayerCharacter> getCharactersFromDb() throws SQLException {
		List<PlayerCharacter> characters = new ArrayList<PlayerCharacter>();
		
		String sql = SqlQueries.getCharacters();

		try (
			PreparedStatement statement = this.connection.prepareStatement(sql);
			ResultSet resultSet = statement.executeQuery();
		) {
			while (resultSet.next()) {
				PlayerCharacter character = new PlayerCharacter();
				
				character.setId(resultSet.getInt("id"));
				character.setName(resultSet.getString("name"));
				character.setXp(resultSet.getDouble("experience"));
				
				characters.add(character);
			}
		}

		return characters;
	}
	
	public int insertCharacterIntoDb(String system ,String name, String xp) throws SQLException{
		String sql = SqlQueries.insertCharacterSheet(system, name, xp);
		System.out.println(sql);
		int result = 0;
		try (
			PreparedStatement statement = this.connection.prepareStatement(sql);
			
		){
			result = statement.executeUpdate();
		}
		
		return result;
	}
	
	public int updateCharacterSheet(String id, String system ,String name, String xp) throws SQLException{
		String sql = SqlQueries.updateCharacterSheet(id, system, name, xp);
		System.out.println(sql);
		int result = 0;
		try (
			PreparedStatement statement = this.connection.prepareStatement(sql);
			
		){
			result = statement.executeUpdate();
		}
		
		return result;
	}
}