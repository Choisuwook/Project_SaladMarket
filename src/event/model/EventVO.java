package event.model;

public class EventVO {
	private int etnum; //number  not null  -- 이벤트번호 
	private String etname;//varchar2(100)     -- 이벤트명
	private String etimagefilename;// varchar2(200) -- 이벤트 이미지
	
	
	public EventVO() {};
	
	public EventVO(int etnum, String etname, String etimagefilename) {
		super();
		this.etnum = etnum;
		this.etname = etname;
		this.etimagefilename = etimagefilename;
	}
	
	public int getEtnum() {
		return etnum;
	}
	public void setEtnum(int etnum) {
		this.etnum = etnum;
	}
	public String getEtname() {
		return etname;
	}
	public void setEtname(String etname) {
		this.etname = etname;
	}
	public String getEtimagefilename() {
		return etimagefilename;
	}
	public void setEtimagefilename(String etimagefilename) {
		this.etimagefilename = etimagefilename;
	}
	
	
}
