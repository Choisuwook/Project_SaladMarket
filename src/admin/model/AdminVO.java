package admin.model;

public class AdminVO {
	private String adminId;
	private String adminPasswd;
	
	public AdminVO() {};
	public AdminVO(String adminId, String adminPasswd) {
		super();
		this.adminId = adminId;
		this.adminPasswd = adminPasswd;
	}
	
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminPasswd() {
		return adminPasswd;
	}
	public void setAdminPasswd(String adminPasswd) {
		this.adminPasswd = adminPasswd;
	}
	
	
}
