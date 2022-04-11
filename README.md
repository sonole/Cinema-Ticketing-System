<div>
  <p>Cinema Ticketing System using REST Web Services (JAX-RS)<br>Technologies used in this project JSP, HTML, JS, CSS, Bootstrap, JAVA 8, MySQL</p>
  <p>What will you find in this project:</p>
  <ul>
    <li><p>Working ticketing system with email receipt and admin dashboard to add or edit the theater schedule, movies and rooms</p></li>
    <li><p>Asynchronous chat between administrators and users</p></li>
    <li><p>Registration, Login, Contact us forms</p></li>
    <li><p>Dynamic pages for movie description</p></li>
  </ul>
</div>
<br><hr><br>

<div>
  <h3>The architecture used in the system</h3>
  <p>Service Oriented Architecture (SOA) was used in this system. The reason SOA was used is that it is given to us the ability to split the individual components of the system into different services, each of which performs a separate function.</p>
  <p>For all web services of the system we use REST architecture. Therefore all services are accessible via URI. Calling a Web Service using the HTTP protocol and GET / PUT / POST / DELETE methods make it possible to manipulate system resources.<br>The API used to develop all Web Services is JAXRS.<br>Specifically, Jersey *, the open-source framework for development of RESTful web services in Java.<br>
* Jersey 1.x has the JEE6 version of the JAX-RS</p>
  <p>At a glance the web-services and pages that appear to the end user:</p>
  <img src="https://github.com/sonole/sonole/blob/main/assets/cinethisio0.jpg?raw=true" alt="web_services">
  <ul>
    <li>my.db</li>
      <ul><li>MySQL.java | 1 private method, 2 public methods</li></ul>
    <li>my.objects</li>
      <ul><li>User.java | 14 public methods (get + set)</li></ul>
    <li>my.restful.web.services = 31 WEB SERVICES</li>
      <ul><li>Admin.java | 15 Web-Services</li>
      <li>Chat.java | 6 Web-Services, 1 private method</li>
      <li>Contact.java | 1 Web-Service</li>
      <li>Login.java | 1 Web-Service, 1 private method</li>
      <li>Profile.java | 4 Web-Services</li>
      <li>Register.java | 1 Web-Services</li>
      <li>Ticket.java | 3 Web-Services, 1 private method</li></ul>
    <li>my.third.party</li>
      <ul><li>RandomPas.java| 1 Web-Service</li>
      <li>SendEmail.java | 1 public method </li></ul>
  </ul>
</div>
<br><hr><br>

<div>
  <h3>Database</h3>
  <p>In MySQL has created database “cinethisio” which is the only one that interacts with it system. Subsequently a brief description will be printed for each table that have been created for the implementation of system endpoints.</p>
  <ul>
    <li><p><strong>DESC users;</strong> All system users are stored here<br>uid = unique user ID<br>password = MD5 (pass)<br>sysadmin = boolean</p></li>
    <li><p><strong>DESC logs;</strong> Logs are stored here after each successful login.</p></li>
    <li><p><strong>DESC chatrooms;</strong> This is where the asynchronous messages by user and administrator are stored.<br>chatID = the chat we want to we open every time and were to place messages<br>type = symbolizes who sent it (message U = user, A = admin)<br>user = username simple user<br>sysadmin = username admin<br>msg = the message sent<br>date = date msg send</p></li>
     <li><p><strong>DESC theater;</strong>This table represents the available rooms that the cinema has</p></li>
     <li><p><strong>DESC movie;</strong> This table represents the available movies that are displayed in the respective rooms</p></li>
     <li><p><strong>DESC schedule;</strong> In this table we save the movie program for a day.<br>sID = unique program id<br>theterID = projection room<br>movieID = the movie being played<br>dateOfAir = the date displayed<br>availableSpots = the available places<br>totalSpots = the total seats (of the room)<br>movieUP = Boolean control variable eg when the administrator wants to hide this program<br>(movie coming soon, or movie that the movie stops showing)</p></li>
     <li><p><strong>DESC booking;</strong>  In this table we have the tickets that the users have booked.<br>bID = booking number<br>uID = User ID<br>sID = program ID (schedule)<br>spots = number of reserved seats</p></li>
  </ol>
</div>
<br><hr><br>

<div>
<h3>How to run this project</h3>
<ol>
  <li><p>Download and install MySQL. When installing use root / root as username and password for the administration credentials. Otherwise they will need to be changed in MySQL.java</p></li>
  <li><p>Create a database named "cinethisio" and then import the sql file with the following command: <pre>mysql -u root -p cinethisio <PATH / cinethisio.sql</pre></p></li>
  <li><p>Install JDK 8 and 2018-09 JAVA EE version of Eclipse.</p></li>
  <li><p>Install Apache Tomcat v9 in Eclipse and at the installation folder of tomcat coppy the file my_jar\external\mysqlconnector-java-5.1.49 at lib folder.</p></li>
  <li><p>Coppy the project at Eclipse Worckspace. The projecct is at my_files\CINEThisio.</p></li>
  <li><p>Check build path of project. The following jar should be in build path:<br>javax.mail , jersey-bundle-1.19.4, jsr311-api-1.1.1, mysql-connector-java-5.1.49<br>Note that all externals jars can be found at my_jar\external\ but also at WebContent\WEB-INF\lib of project! In case you get an error, delete everything from the build path and add them again.</p></li>
  <li><p>Run Project from Eclipse at Apache server and then visit <a href="http://localhost:8080/CINEThisio" target="_blank">http://localhost:8080/CINEThisio</a></p></li>
</ol>
  <br>
  <strong>Login credentials</strong>
  <ul>
    <li><p>Admin<br>&nbsp;username: alex@gmail.com<br>&nbsp;password: 1234</p></li>
    <li><p>User<br>&nbsp;username: john@gmail.com<br>&nbsp;password: 1234</p></li>
  </ul>
</div>
<br><hr><br>

<div>
<h3>Showcase</h3>
  <p>Signup form</p>
  <img src="https://github.com/sonole/sonole/blob/main/assets/cinethisio9.jpg?raw=true">
  <p>Login form</p>
  <img src="https://github.com/sonole/sonole/blob/main/assets/cinethisio10.jpg?raw=true">
  <img src="https://github.com/sonole/sonole/blob/main/assets/cinethisio11.jpg?raw=true">
  <p>Admin Dashboard</p>
  <img src="https://github.com/sonole/sonole/blob/main/assets/cinethisio12.jpg?raw=true">
  <p>User menu</p>
  <img src="https://github.com/sonole/sonole/blob/main/assets/cinethisio13.jpg?raw=true">
  <p>User login logs and account info change</p>
  <img src="https://github.com/sonole/sonole/blob/main/assets/cinethisio14.jpg?raw=true">
  <p>Contact usform</p>
  <img src="https://github.com/sonole/sonole/blob/main/assets/cinethisio15.jpg?raw=true">
  <img src="https://github.com/sonole/sonole/blob/main/assets/cinethisio16.jpg?raw=true">
  <p>Chat with administrators</p>
  <img src="https://github.com/sonole/sonole/blob/main/assets/cinethisio17.jpg?raw=true">
  <img src="https://github.com/sonole/sonole/blob/main/assets/cinethisio18.jpg?raw=true">
  <img src="https://github.com/sonole/sonole/blob/main/assets/cinethisio19.jpg?raw=true">
  <p>When a user sends messages to an administrator, the admin can reply from his dashboard</p>
  <img src="https://github.com/sonole/sonole/blob/main/assets/cinethisio20.jpg?raw=true">
  <img src="https://github.com/sonole/sonole/blob/main/assets/cinethisio21.jpg?raw=true">
  <p>Final chat from admin and user side</p>
  <img src="https://github.com/sonole/sonole/blob/main/assets/cinethisio22.jpg?raw=true">
  <p>The chat at db</p>
  <img src="https://github.com/sonole/sonole/blob/main/assets/cinethisio23.jpg?raw=true">
  <p>Ticketing system</p>
  <img src="https://github.com/sonole/sonole/blob/main/assets/cinethisio24.jpg?raw=true">
  <img src="https://github.com/sonole/sonole/blob/main/assets/cinethisio25.jpg?raw=true">
  <img src="https://github.com/sonole/sonole/blob/main/assets/cinethisio26.jpg?raw=true">
  <p>Dynamic page for the selected movie</p>
  <img src="https://github.com/sonole/sonole/blob/main/assets/cinethisio27.jpg?raw=true">
  <p>Book a ticket</p>
  <img src="https://github.com/sonole/sonole/blob/main/assets/cinethisio28.jpg?raw=true">
  <p>Email receipt</p>
  <img src="https://github.com/sonole/sonole/blob/main/assets/cinethisio29.jpg?raw=true">
  <p>Admin dashboard to edit or add movies,theaters, schedules</p>
  <img src="https://github.com/sonole/sonole/blob/main/assets/cinethisio30.jpg?raw=true">
  <img src="https://github.com/sonole/sonole/blob/main/assets/cinethisio31.jpg?raw=true">
  <img src="https://github.com/sonole/sonole/blob/main/assets/cinethisio32.jpg?raw=true">
  <img src="https://github.com/sonole/sonole/blob/main/assets/cinethisio33.jpg?raw=true">
  <img src="https://github.com/sonole/sonole/blob/main/assets/cinethisio34.jpg?raw=true">
  <img src="https://github.com/sonole/sonole/blob/main/assets/cinethisio35.jpg?raw=true">
  <img src="https://github.com/sonole/sonole/blob/main/assets/cinethisio36.jpg?raw=true">
  <img src="https://github.com/sonole/sonole/blob/main/assets/cinethisio37.jpg?raw=true">
  <img src="https://github.com/sonole/sonole/blob/main/assets/cinethisio38.jpg?raw=true">
</div>
