package enums;

/**
 * @author
 * by https://www.mkyong.com/java/java-enum-example/
 * by https://docs.oracle.com/javase/tutorial/java/javaOO/enum.html
 * by https://www.geeksforgeeks.org/enum-in-java/
 */
public enum Treniruociu_rusis {
	
	CARDIO("cardio")
	,JEGOS("jegos")
	,BFP("bfp")
	,ISTVERMES("ištvermes")
	,MASES_AUGIMAS("mases auginimas")
	,RAUMENU_RUSKINIMAS("raumenu ryškinimas")
	,ATSTATOMOJI("atstatomoji")
	,LANKSTUMO("lankstumo")
	,SVORIO_METIMO("svorio metimo")
	,KITA("kita");	
	
	private final String item;
	
	Treniruociu_rusis( String pav ) {
		this.item = pav;
	}
	
	public String item() {
		return this.item;
	}
}
