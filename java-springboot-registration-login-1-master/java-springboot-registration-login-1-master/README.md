# Simple Java Spring Boot Registration and Login Example
================================
* Still in development. Very simple concept to try out using Spring Boot, Data JPA, in-memory (hibernate) db with persistent SQL option.

#### Application Requires/Java Dependencies:
- Java JDK 1.8
- Maven 3.5.0
- Spring Boot (spring-boot-starter-parent - 1.4.7.RELEASE)
- Spring Security
- Spring Data JPA
- HSQLDB / MySQL 5.6+

#### Other libraries:
- Bootstrap 3.3.7
- jQuery 2.2.4

#### Build + Run:
- `$ mvn install`
- `$ mvn clean spring-boot:run`

#### Other details:
Existing user on persistent MySQL:
- PW: admintest
- UN: admintest

Run the -war / -jar from target:
- `$ java -jar target/name-of-SNAPSHOT.jar`

Make sure to use java 1.8
- `java -version`
- `$ export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"`

#### Resources:
- [Spring.io](https://spring.io/)
- [Spring Boot guides](https://spring.io/guides/gs/spring-boot/)
- [Spring Boot docs](https://docs.spring.io/spring-boot/docs/current/reference/html/)
- [Maven](https://maven.apache.org/)
- [Bootstrap 3](http://getbootstrap.com)
- [sdkman.io](http://sdkman.io/)
 this
For base setup : https://mkyong.com/spring-boot/spring-boot-spring-security-thymeleaf-example/
For success handler: https://www.yawintutor.com/spring-boot-security-step-by-step-5/

### this is totally marvelous job. How come just in half a day ..
 
Just like access denied handler , need to setup authentication failure
Handler. I'm not able to figure out how though.
Trick is in routing to diff pages for invalid user and Invalid pwd

Failure handler did not set yet, made other changes.
Just that issue alone left. 
Check the new admins entered in initial data loader  
###
Thankfully I was able to find out...

Updated code with failure handlers. we handle this using ExceptionMappingAuthenticationFailureHandler and set it as a failureHandler in websecurity config.

It will handle two exceptions, and redirect to pages based on exception
1) UsernameNotFoundException - to redirect to a page when user is not found. I have updated UserDetailsServiceImpl, to throw this exception if username is not found in DB
2) BadCredentialsException - handles bad password.

Note: By default BadCredentialsException handles both user not found and bad password. To make it handle only bad password, we had to updated our authentication provider. (check WebSecurityConfig class)

Below provides details about how to use failure handler
https://www.baeldung.com/spring-security-custom-authentication-failure-handler

Example to use ExceptionMappingAuthenticationFailureHandler is in below link
https://www.programcreek.com/java-api-examples/?code=helloworldtang%2Fspring-boot-cookbook%2Fspring-boot-cookbook-master%2Fapp%2Fsrc%2Fmain%2Fjava%2Fcom%2Ftangcheng%2Fapp%2Fapi%2Frest%2Fconfig%2FSecurityConfig.java#

to handle badcredential exception, reference is below
https://stackoverflow.com/questions/17439628/spring-security-custom-exception-message-from-userdetailsservice
