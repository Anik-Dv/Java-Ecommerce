package entitys;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Users {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int usarId;
	@Column(length = 300)
	private String userName;
	@Column(length = 400)
	private String userEmail;
	@Column(length = 100)
	private String userPassword;
	@Column(length = 12)
	private String userPhone;
	private String userImage;
	@Column(length = 1200)
	private String userAddress;
	private String userGender;
	private String userType;


	public Users() {
		super();
	}

	public Users(int usarId, String userName, String userEmail, String userPassword, String userPhone, String userImage,
			String userAddress, String userGender, String userType) {
		super();
		this.usarId = usarId;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userPhone = userPhone;
		this.userImage = userImage;
		this.userAddress = userAddress;
		this.userGender = userGender;
		this.userType = userType;
	}

	public Users(String userName, String userEmail, String userPassword, String userPhone, String userImage,
			String userAddress, String userGender, String userType) {
		super();
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userPhone = userPhone;
		this.userImage = userImage;
		this.userAddress = userAddress;
		this.userGender = userGender;
		this.userType = userType;
	}

	public int getUsarId() {
		return usarId;
	}

	public void setUsarId(int usarId) {
		this.usarId = usarId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserImage() {
		return userImage;
	}

	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

}
