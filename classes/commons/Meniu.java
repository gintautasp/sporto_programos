package commons;

/**
 * @author
 * by https://www.mkyong.com/java/java-enum-example/
 * by https://docs.oracle.com/javase/tutorial/java/javaOO/enum.html
 * by https://www.geeksforgeeks.org/enum-in-java/
 */
public enum Meniu {
	
	Raumenys("/raumenys")
	, Pratimai("/pratimai")
	, Planai("/trenyruociu-planai")
	, Klientai("/klientai")
	, Programos("/programos");
	
	
	private final String itemurl;
	
	Meniu( String url ) {
		this.itemurl = url;
	}
	
	public String itemurl() {
		return this.itemurl;
	}
}
