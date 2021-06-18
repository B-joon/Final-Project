package com.ptsd.mvc.user;

public class UserDto {
	
	private int userseq;
	private String userid;
	private String userpw;
	private String email;
	private String address;
	private String phone;
	private String userrole;
	private String nickname;
	private String avatar;
	private String femail;
	private String bemail;
	private String proof;
	
	public UserDto() {
		// TODO Auto-generated constructor stub
	}

	public UserDto(int userseq, String userid, String userpw, String email, String address, String phone,
			String userrole, String nickname, String avatar, String femail, String bemail, String proof) {
		super();
		this.userseq = userseq;
		this.userid = userid;
		this.userpw = userpw;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.userrole = userrole;
		this.nickname = nickname;
		this.avatar = avatar;
		this.femail = femail;
		this.bemail = bemail;
		this.proof = proof;
	}

	public int getUserseq() {
		return userseq;
	}

	public void setUserseq(int userseq) {
		this.userseq = userseq;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUserrole() {
		return userrole;
	}

	public void setUserrole(String userrole) {
		this.userrole = userrole;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getFemail() {
		return femail;
	}

	public void setFemail(String femail) {
		this.femail = femail;
	}

	public String getBemail() {
		return bemail;
	}

	public void setBemail(String bemail) {
		this.bemail = bemail;
	}

	public String getProof() {
		return proof;
	}

	public void setProof(String proof) {
		this.proof = proof;
	}
	
	
}
