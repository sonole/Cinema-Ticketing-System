/*
 * Source: https://stackoverflow.com/questions/20536566/creating-a-random-string-with-a-z-and-0-9-in-java
 */

package my.third.party;

import java.util.Random;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

@Path("RandomPass")
public class RandomPass {

	@GET
	@Path("/pass")
	@Produces("text/plain")
	public String getRandomString() {
		String SALTCHARS = "1234567890abcdefghijklmnopqrstuvwxyz";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 6) {
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String randStr = salt.toString();
        return randStr;
    }
	
}
