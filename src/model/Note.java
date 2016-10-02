package model;

public class Note {
	private String noteID;
	private String costomID;
	private String Content;
	private String create;
	private String change;
	private int statue;
	private String tag;
	private String title;
	public Note(String noteID,String costomID,String Content,String create,String change,int statue, String tag,String title){
		this.noteID=noteID;
		this.costomID=costomID;
		this.Content=Content;
		this.create=create;
		this.change=change;
		this.statue=statue;
		this.tag=tag;
		this.title=title;
	}
	public String getNoteID() {
		return noteID;
	}
	public void setNoteID(String noteID) {
		this.noteID = noteID;
	}
	public String getCostomID() {
		return costomID;
	}
	public void setCostomID(String costomID) {
		this.costomID = costomID;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public String getCreate() {
		return create;
	}
	public void setCreate(String create) {
		this.create = create;
	}
	public String getChange() {
		return change;
	}
	public void setChange(String change) {
		this.change = change;
	}
	public int getStatue() {
		return statue;
	}
	public void setStatue(int statue) {
		this.statue = statue;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
}
