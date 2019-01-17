package product.model;

public class ProductVO {
	 
	private int rnum;
	private int pnum;			//number  not null                -- 상품번호 
	private int pacnum;
	private String fk_pacname; 	//varchar2(100)  not null                -- 상품패키지명
	private String fk_sdname; 	//varchar2(100)  not null                -- 소분류상세명 
<<<<<<< HEAD
	private String sdname; 	//varchar2(100)  not null                -- 소분류상세명 
	private String fk_ctname; 	//varchar2(100)  not null                -- 카테고리태그명 
	private String fk_stname;	//varchar2(100)  not null                -- 스펙태그명 
	private String fk_etname;	//varchar2(100)  not null      -- 이벤트태그명
	private String ctname; 	//varchar2(100)  not null                -- 카테고리태그명 
	private String stname;	//varchar2(100)  not null                -- 스펙태그명 
	private String etname;
	
	private String pname;   	//varchar2(100)  not null         -- 상품명 
	private int price;     		//number default 0  not null      -- 원가 
	private int saleprice;		//number default 0  not null      -- 판매가 
	private int point;  		//number default 0  not null      -- 포인트 
	private int pqty;			//number default 0  not null      -- 재고량 
	private String pcontents; 	//clob                            -- 상품설명 
	private String pcompanyname;//varchar2(100)  not null         -- 상품회사명 
	private String pexpiredate;	//varchar2(200) default '상세내용참조'  not null -- 유통기한 
	private String allergy;		//clob                            -- 알레르기정보 
	private int weight; 		//number default 0  not null      -- 용량
	private int salecount;//default 0  not null      -- 판매량 
	private int plike; 			//number default 0  not null      -- 상품좋아요 
	private String pdate;		//date default sysdate  not null  -- 상품등록일자
	private String pacimage;
	private String pacname;
	private String paccontents;
	private int pimgnum;
	private String pimgfilename;
	
	private int etnum; 
	private int stnum;
	private int sdnum;
	private int ctnum;
	
	public ProductVO() {}

	
	public ProductVO(int rnum, int pnum, int pacnum, String fk_pacname, String fk_sdname, String sdname,
			String fk_ctname, String fk_stname, String fk_etname, String ctname, String stname, String etname,
			String pname, int price, int saleprice, int point, int pqty, String pcontents, String pcompanyname,
			String pexpiredate, String allergy, int weight, int salecount, int plike, String pdate, String pacimage,
			String pacname, String paccontents, int pimgnum, String pimgfilename, int etnum, int stnum, int sdnum,
			int ctnum) {
		super();
		this.rnum = rnum;
		this.pnum = pnum;
		this.pacnum = pacnum;
		this.fk_pacname = fk_pacname;
		this.fk_sdname = fk_sdname;
		this.sdname = sdname;
		this.fk_ctname = fk_ctname;
		this.fk_stname = fk_stname;
		this.fk_etname = fk_etname;
		this.ctname = ctname;
		this.stname = stname;
		this.etname = etname;
		this.pname = pname;
		this.price = price;
		this.saleprice = saleprice;
		this.point = point;
		this.pqty = pqty;
		this.pcontents = pcontents;
		this.pcompanyname = pcompanyname;
		this.pexpiredate = pexpiredate;
		this.allergy = allergy;
		this.weight = weight;
		this.salecount = salecount;
		this.plike = plike;
		this.pdate = pdate;
		this.pacimage = pacimage;
		this.pacname = pacname;
		this.paccontents = paccontents;
		this.pimgnum = pimgnum;
		this.pimgfilename = pimgfilename;
		this.etnum = etnum;
		this.stnum = stnum;
		this.sdnum = sdnum;
		this.ctnum = ctnum;
	}


	public String getSdname() {	return sdname;	}
	public void setSdname(String sdname) { this.sdname = sdname; }




	public String getCtname() {
		return ctname;
	}


	public void setCtname(String ctname) {
		this.ctname = ctname;
	}


	public String getStname() {
		return stname;
	}


	public void setStname(String stname) {
		this.stname = stname;
	}


	public String getEtname() {
		return etname;
	}


	public void setEtname(String etname) {
		this.etname = etname;
	}


	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getFk_pacname() {
		return fk_pacname;
	}
	public void setFk_pacname(String fk_pacname) {
		this.fk_pacname = fk_pacname;
	}
	
	public int getPacnum() {
		return pacnum;
	}


	public void setPacnum(int pacnum) {
		this.pacnum = pacnum;
	}


	public String getFk_sdname() {
		return fk_sdname;
	}
	public void setFk_sdname(String fk_sdname) {
		this.fk_sdname = fk_sdname;
	}
	public String getFk_ctname() {
		return fk_ctname;
	}
	public void setFk_ctname(String fk_ctname) {
		this.fk_ctname = fk_ctname;
	}
	public String getFk_stname() {
		return fk_stname;
	}
	public void setFk_stname(String fk_stname) {
		this.fk_stname = fk_stname;
	}
	public String getFk_etname() {
		return fk_etname;
	}
	public void setFk_etname(String fk_etname) {
		this.fk_etname = fk_etname;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSaleprice() {
		return saleprice;
	}
	public void setSaleprice(int saleprice) {
		this.saleprice = saleprice;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getPqty() {
		return pqty;
	}
	public void setPqty(int pqty) {
		this.pqty = pqty;
	}
	public String getPcontents() {
		return pcontents;
	}
	public void setPcontents(String pcontents) {
		this.pcontents = pcontents;
	}
	public String getPcompanyname() {
		return pcompanyname;
	}
	public void setPcompanyname(String pcompanyname) {
		this.pcompanyname = pcompanyname;
	}
	public String getPexpiredate() {
		return pexpiredate;
	}
	public void setPexpiredate(String pexpiredate) {
		this.pexpiredate = pexpiredate;
	}
	public String getAllergy() {
		return allergy;
	}
	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	
	public int getSalecount() {
		return salecount;
	}
	public void setSalecount(int salecount) {
		this.salecount = salecount;
	}

	public int getPlike() {
		return plike;
	}
	public void setPlike(int plike) {
		this.plike = plike;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getPacimage() {
		return pacimage;
	}
	public void setPacimage(String pacimage) {
		this.pacimage = pacimage;
	}

	public String getPacname() {
		return pacname;
	}

	public void setPacname(String pacname) {
		this.pacname = pacname;
	}

	public String getPaccontents() {
		return paccontents;
	}

	public void setPaccontents(String paccontents) {
		this.paccontents = paccontents;
	}



	public int getPimgnum() {
		return pimgnum;
	}



	public void setPimgnum(int pimgnum) {
		this.pimgnum = pimgnum;
	}



	public String getPimgfilename() {
		return pimgfilename;
	}



	public void setPimgfilename(String pimgfilename) {
		this.pimgfilename = pimgfilename;
	}


	public int getEtnum() {
		return etnum;
	}


	public void setEtnum(int etnum) {
		this.etnum = etnum;
	}


	public int getStnum() {
		return stnum;
	}


	public void setStnum(int stnum) {
		this.stnum = stnum;
	}


	public int getSdnum() {
		return sdnum;
	}


	public void setSdnum(int sdnum) {
		this.sdnum = sdnum;
	}


	public int getCtnum() {
		return ctnum;
	}


	public void setCtnum(int ctnum) {
		this.ctnum = ctnum;
=======
	private String fk_ctname; 	//varchar2(100)  not null                -- 카테고리태그명 
	private String fk_stname;	//varchar2(100)  not null                -- 스펙태그명 
	private String fk_etname;	//varchar2(100)  not null      -- 이벤트태그명
	private String pname;   	//varchar2(100)  not null         -- 상품명 
	private int price;     		//number default 0  not null      -- 원가 
	private int saleprice;		//number default 0  not null      -- 판매가 
	private int point;  		//number default 0  not null      -- 포인트 
	private int pqty;			//number default 0  not null      -- 재고량 
	private String pcontents; 	//clob                            -- 상품설명 
	private String pcompanyname;//varchar2(100)  not null         -- 상품회사명 
	private String pexpiredate;	//varchar2(200) default '상세내용참조'  not null -- 유통기한 
	private String allergy;		//clob                            -- 알레르기정보 
	private int weight; 		//number default 0  not null      -- 용량
	private int salecount;//default 0  not null      -- 판매량 
	private int plike; 			//number default 0  not null      -- 상품좋아요 
	private String pdate;		//date default sysdate  not null  -- 상품등록일자
	private String pacimage;
	private String pacname;
	private String paccontents;
	private int pimgnum;
	private String pimgfilename;
	
	
	public ProductVO() {}
	


	public ProductVO(int rnum, int pnum, int pacnum, String fk_pacname, String fk_sdname, String fk_ctname,
			String fk_stname, String fk_etname, String pname, int price, int saleprice, int point, int pqty,
			String pcontents, String pcompanyname, String pexpiredate, String allergy, int weight, int salecount,
			int plike, String pdate, String pacimage, String pacname, String paccontents, int pimgnum,
			String pimgfilename) {
		super();
		this.rnum = rnum;
		this.pnum = pnum;
		this.pacnum = pacnum;
		this.fk_pacname = fk_pacname;
		this.fk_sdname = fk_sdname;
		this.fk_ctname = fk_ctname;
		this.fk_stname = fk_stname;
		this.fk_etname = fk_etname;
		this.pname = pname;
		this.price = price;
		this.saleprice = saleprice;
		this.point = point;
		this.pqty = pqty;
		this.pcontents = pcontents;
		this.pcompanyname = pcompanyname;
		this.pexpiredate = pexpiredate;
		this.allergy = allergy;
		this.weight = weight;
		this.salecount = salecount;
		this.plike = plike;
		this.pdate = pdate;
		this.pacimage = pacimage;
		this.pacname = pacname;
		this.paccontents = paccontents;
		this.pimgnum = pimgnum;
		this.pimgfilename = pimgfilename;
	}



	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getFk_pacname() {
		return fk_pacname;
	}
	public void setFk_pacname(String fk_pacname) {
		this.fk_pacname = fk_pacname;
	}
	
	public int getPacnum() {
		return pacnum;
	}


	public void setPacnum(int pacnum) {
		this.pacnum = pacnum;
	}


	public String getFk_sdname() {
		return fk_sdname;
	}
	public void setFk_sdname(String fk_sdname) {
		this.fk_sdname = fk_sdname;
	}
	public String getFk_ctname() {
		return fk_ctname;
	}
	public void setFk_ctname(String fk_ctname) {
		this.fk_ctname = fk_ctname;
	}
	public String getFk_stname() {
		return fk_stname;
	}
	public void setFk_stname(String fk_stname) {
		this.fk_stname = fk_stname;
	}
	public String getFk_etname() {
		return fk_etname;
	}
	public void setFk_etname(String fk_etname) {
		this.fk_etname = fk_etname;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSaleprice() {
		return saleprice;
	}
	public void setSaleprice(int saleprice) {
		this.saleprice = saleprice;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getPqty() {
		return pqty;
	}
	public void setPqty(int pqty) {
		this.pqty = pqty;
	}
	public String getPcontents() {
		return pcontents;
	}
	public void setPcontents(String pcontents) {
		this.pcontents = pcontents;
	}
	public String getPcompanyname() {
		return pcompanyname;
	}
	public void setPcompanyname(String pcompanyname) {
		this.pcompanyname = pcompanyname;
	}
	public String getPexpiredate() {
		return pexpiredate;
	}
	public void setPexpiredate(String pexpiredate) {
		this.pexpiredate = pexpiredate;
	}
	public String getAllergy() {
		return allergy;
	}
	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	
	public int getSalecount() {
		return salecount;
	}
	public void setSalecount(int salecount) {
		this.salecount = salecount;
	}

	public int getPlike() {
		return plike;
	}
	public void setPlike(int plike) {
		this.plike = plike;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getPacimage() {
		return pacimage;
	}
	public void setPacimage(String pacimage) {
		this.pacimage = pacimage;
	}

	public String getPacname() {
		return pacname;
	}

	public void setPacname(String pacname) {
		this.pacname = pacname;
	}

	public String getPaccontents() {
		return paccontents;
	}

	public void setPaccontents(String paccontents) {
		this.paccontents = paccontents;
	}



	public int getPimgnum() {
		return pimgnum;
	}



	public void setPimgnum(int pimgnum) {
		this.pimgnum = pimgnum;
	}



	public String getPimgfilename() {
		return pimgfilename;
	}



	public void setPimgfilename(String pimgfilename) {
		this.pimgfilename = pimgfilename;
>>>>>>> branch 'master' of http://github.com/Choisuwook/Project_saladMarket.git
	}
	
	
	
	
}
