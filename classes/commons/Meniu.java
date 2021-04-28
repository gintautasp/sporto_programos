package commons;

/**
 * @author
 * by https://www.mkyong.com/java/java-enum-example/
 * by https://docs.oracle.com/javase/tutorial/java/javaOO/enum.html
 * by https://www.geeksforgeeks.org/enum-in-java/
 */
public enum Meniu {
	
	Raumenys("/sporto_programos/raumenys")
	, Pratimai("/sporto_programos/pratimai")
	, Planai("/sporto_programos/trenyruociu-planai")
	, Klientai("/sporto_programos/klientai")
	, Programos("/sporto_programos/programos");
	
	
	private final String itemurl;
	
	Meniu( String url ) {
		this.itemurl = url;
	}
	
	public String itemurl() {
		return this.itemurl;
	}
}
