package member.model;

public class MemberVO {
	private int mnum;// number not null  -- 회원번호
	private String userid;//varchar2(100) not null  -- 회원아이디
	private String name;// varchar2(10)          not null  -- 회원명
	private String pwd;
	private String email;// varchar2(200)         not null  -- 이메일(AES256 암호화)
	private String phone;//varchar2(400)         not null  -- 휴대폰(AES256 암호화)
	//private String birthday;//date not null  -- 생년월일
	private String birthyyyy;   // 생년
	private String birthmm;     // 생월
	private String birthdd;     // 생일
	private String postnum;//varchar2                not null  -- 우편번호
	private String address1;//varchar2(200)         not null  -- 주소
	private String address2;// varchar2(200)         not null  -- 상세주소
	private int point;//number default 0      not null  -- 포인트
	private String registerdate;// date default sysdate  not null  -- 가입일자
	private String last_logindate;//date default sysdate  not null  -- 마지막로그인일자
	private String last_changepwdate;//  date default sysdate  not null  -- 비밀번호변경일자
	private int status;//number default 1      not null  -- 회원탈퇴유무 / 0:탈퇴 1:활동 2:휴면
	private int summoney;//           number default 0      not null  -- 누적구매금액
	private int fk_lvnum;//           number default 1      not null  -- 회원등급번호
	private String cpname;// my coupon 이름
	private int cpnum;// my coupon 번호
	private String cpexpiredate;// my coupon 날짜  
	private boolean requirePwdChange=false;
	//마지막으로 암호를 변경한 날짜가 현재시각으로부터 6개월 지났으면 true,
	//마지막으로 암호를 변경한 날짜가 현재시각으로부터 6개월 지지않았으면 false,
	private boolean lastlogingap = false;
	//마지막으로 로그인한 날짜가 현재시각으로부터  1년이 지났으면 true(휴면으로 지정),
	//마지막으로 로그인한 날짜가 현재시각으로부터  1년이 지나지않았으면 false,
	private int cpnumCount; // my coupon 갯수
	
	public MemberVO() {}
			
	



	public MemberVO(int mnum, String userid, String name, String pwd, String email, String phone, String birthyyyy,
			String birthmm, String birthdd, String postnum, String address1, String address2, int point,
			String registerdate, String last_logindate, String last_changepwdate, int status, int summoney,
			int fk_lvnum, String cpname, int cpnum, String cpexpiredate, boolean requirePwdChange, boolean lastlogingap,
			int cpnumCount) {
		super();
		this.mnum = mnum;
		this.userid = userid;
		this.name = name;
		this.pwd = pwd;
		this.email = email;
		this.phone = phone;
		this.birthyyyy = birthyyyy;
		this.birthmm = birthmm;
		this.birthdd = birthdd;
		this.postnum = postnum;
		this.address1 = address1;
		this.address2 = address2;
		this.point = point;
		this.registerdate = registerdate;
		this.last_logindate = last_logindate;
		this.last_changepwdate = last_changepwdate;
		this.status = status;
		this.summoney = summoney;
		this.fk_lvnum = fk_lvnum;
		this.cpname = cpname;
		this.cpnum = cpnum;
		this.cpexpiredate = cpexpiredate;
		this.requirePwdChange = requirePwdChange;
		this.lastlogingap = lastlogingap;
		this.cpnumCount = cpnumCount;
	}





	public int getMnum() {
		return mnum;
	}





	public void setMnum(int mnum) {
		this.mnum = mnum;
	}





	public String getUserid() {
		return userid;
	}





	public void setUserid(String userid) {
		this.userid = userid;
	}





	public String getName() {
		return name;
	}





	public void setName(String name) {
		this.name = name;
	}





	public String getPwd() {
		return pwd;
	}





	public void setPwd(String pwd) {
		this.pwd = pwd;
	}





	public String getEmail() {
		return email;
	}





	public void setEmail(String email) {
		this.email = email;
	}





	public String getPhone() {
		return phone;
	}





	public void setPhone(String phone) {
		this.phone = phone;
	}





	public String getBirthyyyy() {
		return birthyyyy;
	}





	public void setBirthyyyy(String birthyyyy) {
		this.birthyyyy = birthyyyy;
	}





	public String getBirthmm() {
		return birthmm;
	}





	public void setBirthmm(String birthmm) {
		this.birthmm = birthmm;
	}





	public String getBirthdd() {
		return birthdd;
	}





	public void setBirthdd(String birthdd) {
		this.birthdd = birthdd;
	}





	public String getPostnum() {
		return postnum;
	}





	public void setPostnum(String postnum) {
		this.postnum = postnum;
	}





	public String getAddress1() {
		return address1;
	}





	public void setAddress1(String address1) {
		this.address1 = address1;
	}





	public String getAddress2() {
		return address2;
	}





	public void setAddress2(String address2) {
		this.address2 = address2;
	}





	public int getPoint() {
		return point;
	}





	public void setPoint(int point) {
		this.point = point;
	}





	public String getRegisterdate() {
		return registerdate;
	}





	public void setRegisterdate(String registerdate) {
		this.registerdate = registerdate;
	}





	public String getLast_logindate() {
		return last_logindate;
	}





	public void setLast_logindate(String last_logindate) {
		this.last_logindate = last_logindate;
	}





	public String getLast_changepwdate() {
		return last_changepwdate;
	}





	public void setLast_changepwdate(String last_changepwdate) {
		this.last_changepwdate = last_changepwdate;
	}





	public int getStatus() {
		return status;
	}





	public void setStatus(int status) {
		this.status = status;
	}





	public int getSummoney() {
		return summoney;
	}





	public void setSummoney(int summoney) {
		this.summoney = summoney;
	}





	public int getFk_lvnum() {
		return fk_lvnum;
	}





	public void setFk_lvnum(int fk_lvnum) {
		this.fk_lvnum = fk_lvnum;
	}





	public String getCpname() {
		return cpname;
	}





	public void setCpname(String cpname) {
		this.cpname = cpname;
	}





	public int getCpnum() {
		return cpnum;
	}





	public void setCpnum(int cpnum) {
		this.cpnum = cpnum;
	}





	public String getCpexpiredate() {
		return cpexpiredate;
	}





	public void setCpexpiredate(String cpexpiredate) {
		this.cpexpiredate = cpexpiredate;
	}





	public boolean isRequirePwdChange() {
		return requirePwdChange;
	}





	public void setRequirePwdChange(boolean requirePwdChange) {
		this.requirePwdChange = requirePwdChange;
	}





	public boolean isLastlogingap() {
		return lastlogingap;
	}





	public void setLastlogingap(boolean lastlogingap) {
		this.lastlogingap = lastlogingap;
	}





	public int getCpnumCount() {
		return cpnumCount;
	}





	public void setCpnumCount(int cpnumCount) {
		this.cpnumCount = cpnumCount;
	}


	
}
