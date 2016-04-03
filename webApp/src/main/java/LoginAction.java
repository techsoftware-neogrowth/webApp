
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.apache.shiro.subject.Subject;


public class LoginAction {
	 private String username, password;
	    private boolean rememberMe;

	    public String getUsername() {
	        return username;
	    }

	    public void setUsername(String username) {
	        this.username = username;
	    }

	    public String getPassword() {
	        return password;
	    }

	    public void setPassword(String password) {
	        this.password = password;
	    }

	    public boolean isRememberMe() {
	        return rememberMe;
	    }

	    public void setRememberMe(boolean rememberMe) {
	        this.rememberMe = rememberMe;
	    }

	    public void login(){

	        try{
	        	
	        	System.out.println("akki   "+username+"  --  p   "+password);
	        	System.out.println("jknsajdnas   "+new Sha256Hash(password).toHex());

	            Subject currentUser         = SecurityUtils.getSubject();
	            UsernamePasswordToken token = new UsernamePasswordToken(username, new Sha256Hash(password).toHex());

	            token.setRememberMe(rememberMe);
	            currentUser.login(token);

	        } catch (UnknownAccountException uae ) {
	        	uae.printStackTrace();
	        } catch (IncorrectCredentialsException ice ) {
	        	ice.printStackTrace();
	        } catch (LockedAccountException lae ) {
	        	lae.printStackTrace();
	        } catch(AuthenticationException aex){
	        	aex.printStackTrace();
	        }

	    }
	    
	    public void logout() {
	    	
	    }
}
