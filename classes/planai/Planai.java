package planai;

import pratimai.*;
import java.util.*;

public class Planas{
	
	private int id;
	private String pav;
	private List<Pratimai> pratimai;
	
	public Planas(){}
	
	public Planas(int id, String pav){
		this.id = id;
		this.pav = pav;
	}
	
	public Planas(int id, String pav, List<Pratimai> pratimai){
		this.id = id;
		this.pav = pav;
		this.pratimai = pratimai;
	}
	
	public int getId(){
		return this.id;
	}
	
	public String getPav(){
		return this.pav;
	}
	
	public void setId(){
		this.id = id;
	}
	
	public void setPav(){
		this.pav = pav;
	}
	
	public void setPratimai(List<Pratimai> pratimai){
		this.pratimai = pratimai;
	}
	
	public void addPratimas(Pratimai pratimas){
		this.pratimai.add(pratimas);
	}
	
	public List<Pratimai> getPratimai(){
		return this.pratimai;
	}
	
	public Pratimai getPratimas(int indeksas){
		return this.pratimai.get(indeksas);
	}
	
	public int getPratimaiLength(){
		return pratimai.size();
	}
}