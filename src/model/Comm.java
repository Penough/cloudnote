package model;

public class Comm {
	private String CommonId;
	private String CostomID;
	private String comcon;
	private String NoteID;
	private String puTime;
	
	public Comm(String commonId, String costomID, String comcon, String noteID,
			String puTime) {
		super();
		CommonId = commonId;
		CostomID = costomID;
		this.comcon = comcon;
		NoteID = noteID;
		this.puTime = puTime;
	}
	public String getCommonId() {
		return CommonId;
	}
	public void setCommonId(String commonId) {
		CommonId = commonId;
	}
	public String getCostomID() {
		return CostomID;
	}
	public void setCostomID(String costomID) {
		CostomID = costomID;
	}
	public String getComcon() {
		return comcon;
	}
	public void setComcon(String comcon) {
		this.comcon = comcon;
	}
	public String getNoteID() {
		return NoteID;
	}
	public void setNoteID(String noteID) {
		NoteID = noteID;
	}
	public String getPuTime() {
		return puTime;
	}
	public void setPuTime(String puTime) {
		this.puTime = puTime;
	}
	
}
