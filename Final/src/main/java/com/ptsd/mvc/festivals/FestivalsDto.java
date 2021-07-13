package com.ptsd.mvc.festivals;

public class FestivalsDto {
	
	private String addr1;
	private int areacode;
	private String cat1;
	private String cat2;
	private String cat3;
	private int contentid;
	private int contenttypeid;
	private String createdtime;
	private String eventenddate;
	private String eventstartdate;
	private String firstimage;
	private String firstimage2;
	private float mapx;
	private float mapy;
	private int mlevel;
	private String modifiedtime;
	private int readcount;
	private int sigungucode;
	private String tel;
	private String title;
	private String addr2;
	
	
	public FestivalsDto() {
		
	}
	
	public FestivalsDto(String addr1, String firstimage, String tel, String title) {
		this.addr1 = addr1;
		this.firstimage = firstimage;
		this.tel = tel;
		this.title = title;
	}

	public FestivalsDto(String addr1, int areacode, String cat1, String cat2, String cat3, int contentid,
			int contenttypeid, String createdtime, String eventenddate, String eventstartdate, String firstimage,
			String firstimage2, float mapx, float mapy, int mlevel, String modifiedtime, int readcount, int sigungucode,
			String tel, String title, String addr2) {
		super();
		this.addr1 = addr1;
		this.areacode = areacode;
		this.cat1 = cat1;
		this.cat2 = cat2;
		this.cat3 = cat3;
		this.contentid = contentid;
		this.contenttypeid = contenttypeid;
		this.createdtime = createdtime;
		this.eventenddate = eventenddate;
		this.eventstartdate = eventstartdate;
		this.firstimage = firstimage;
		this.firstimage2 = firstimage2;
		this.mapx = mapx;
		this.mapy = mapy;
		this.mlevel = mlevel;
		this.modifiedtime = modifiedtime;
		this.readcount = readcount;
		this.sigungucode = sigungucode;
		this.tel = tel;
		this.title = title;
		this.addr2 = addr2;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public int getAreacode() {
		return areacode;
	}

	public void setAreacode(int areacode) {
		this.areacode = areacode;
	}

	public String getCat1() {
		return cat1;
	}

	public void setCat1(String cat1) {
		this.cat1 = cat1;
	}

	public String getCat2() {
		return cat2;
	}

	public void setCat2(String cat2) {
		this.cat2 = cat2;
	}

	public String getCat3() {
		return cat3;
	}

	public void setCat3(String cat3) {
		this.cat3 = cat3;
	}

	public int getContentid() {
		return contentid;
	}

	public void setContentid(int contentid) {
		this.contentid = contentid;
	}

	public int getContenttypeid() {
		return contenttypeid;
	}

	public void setContenttypeid(int contenttypeid) {
		this.contenttypeid = contenttypeid;
	}

	public String getCreatedtime() {
		return createdtime;
	}

	public void setCreatedtime(String createdtime) {
		this.createdtime = createdtime;
	}

	public String getEventenddate() {
		return eventenddate;
	}

	public void setEventenddate(String eventenddate) {
		this.eventenddate = eventenddate;
	}

	public String getEventstartdate() {
		return eventstartdate;
	}

	public void setEventstartdate(String eventstartdate) {
		this.eventstartdate = eventstartdate;
	}

	public String getFirstimage() {
		return firstimage;
	}

	public void setFirstimage(String firstimage) {
		this.firstimage = firstimage;
	}

	public String getFirstimage2() {
		return firstimage2;
	}

	public void setFirstimage2(String firstimage2) {
		this.firstimage2 = firstimage2;
	}

	public float getMapx() {
		return mapx;
	}

	public void setMapx(float mapx) {
		this.mapx = mapx;
	}

	public float getMapy() {
		return mapy;
	}

	public void setMapy(float mapy) {
		this.mapy = mapy;
	}

	public int getMlevel() {
		return mlevel;
	}

	public void setMlevel(int mlevel) {
		this.mlevel = mlevel;
	}

	public String getModifiedtime() {
		return modifiedtime;
	}

	public void setModifiedtime(String modifiedtime) {
		this.modifiedtime = modifiedtime;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getSigungucode() {
		return sigungucode;
	}

	public void setSigungucode(int sigungucode) {
		this.sigungucode = sigungucode;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

}
