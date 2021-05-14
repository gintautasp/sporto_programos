package planai;

public class PlanoPratimas{
	
	private int id;
	private int id_pratimai;
	private int id_planai;
	private int skaicius_pakartojimu;
	private int skaicius_atlikimu;
	private int poilsio_laikas_tarp_atlikimu;
	
	public PlanoPratimas(){}
	
	public PlanoPratimas(int id, int id_pratimai, int id_planai, int skaicius_pakartojimu, int skaicius_atlikimu, int poilsio_laikas_tarp_atlikimu){
		this.id = id;
		this.id_pratimai = id_pratimai;
		this.id_planai = id_planai;
		this.skaicius_pakartojimu = skaicius_pakartojimu;
		this.skaicius_atlikimu = skaicius_atlikimu;
		this.poilsio_laikas_tarp_atlikimu = poilsio_laikas_tarp_atlikimu;
	}
	
	//gets
	public int getId(){
		return this.id;
	}
	
	public int getIdPratimai(){
		return this.id_pratimai;
	}
	
	public int getIdPlanai(){
		return this.id_planai;
	}
	
	public int getPakartojimai(){
		return this.skaicius_pakartojimu;
	}
	
	public int getAtlikimai(){
		return this.skaicius_atlikimu;
	}
	
	public int getPoilsis(){
		return this.poilsio_laikas_tarp_atlikimu;
	}
	
	//sets
	public void setId(int sk){
		this.id = sk;
	}
	
	public void setIdPratimai(int sk){
		this.id_pratimai  = sk;
	}
	
	public void setIdPlanai(int sk){
		this.id_planai  = sk;
	}
	
	public void setPakartojimai(int sk){
		this.skaicius_pakartojimu  = sk;
	}
	
	public void setAtlikimai(int sk){
		this.skaicius_atlikimu  = sk;
	}
	
	public void setPoilsis(int sk){
		this.poilsio_laikas_tarp_atlikimu  = sk;
	}
}