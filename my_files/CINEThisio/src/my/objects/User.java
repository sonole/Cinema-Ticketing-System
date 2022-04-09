package my.objects;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="User")
public class User 
{
	int uid;
	String username;
	String password;
	String firstname;
	String lastname;
	String email;
	int sysadmin;

	//GETers..
	public int getUid()			{ return uid; 	   }
	public String getUsername() { return username; }
	public String getPassword() { return password; }
	public String getFirstname(){ return firstname;}
	public String getLastname() { return lastname; }
	public String getEmail() 	{ return email;    }
	public int getSysadmin()	{ return sysadmin; }
	
	//SETers
	public void setUid(int uid)	  			  { this.uid = uid;			 }
	public void setUsername(String username)  { this.username=username;  }
	public void setPassword(String password)  { this.password=password;	 }
	public void setFirstname(String firstname){ this.firstname=firstname;}
	public void setLastname(String lastname)  { this.lastname=lastname;	 }
	public void setEmail(String email) 	      { this.email=email; 		 }
	public void setSysadmin(int sysadmin)	  { this.sysadmin=sysadmin;  }
	
	
}