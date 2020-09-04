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

### 1 sep - made some changes in user model (all related java files) 
made changes in login and registration jsp
added html pages for both quiz. working on the evaluation logic. (will continue this).

one strange thing is cant acces the welcome page as direct link even.

this is the errors came 

2020-09-01 21:16:57.690  INFO 13016 --- [           main] org.hibernate.tool.hbm2ddl.SchemaExport  : HHH000227: Running hbm2ddl schema export
Hibernate: alter table user_role drop constraint FKa68196081fvovjhkek5m97n3y
2020-09-01 21:16:57.700 ERROR 13016 --- [           main] org.hibernate.tool.hbm2ddl.SchemaExport  : HHH000389: Unsuccessful: alter table user_role drop constraint FKa68196081fvovjhkek5m97n3y
2020-09-01 21:16:57.700 ERROR 13016 --- [           main] org.hibernate.tool.hbm2ddl.SchemaExport  : user lacks privilege or object not found: PUBLIC.USER_ROLE
Hibernate: alter table user_role drop constraint FK859n2jvi8ivhui0rl0esws6o
2020-09-01 21:16:57.701 ERROR 13016 --- [           main] org.hibernate.tool.hbm2ddl.SchemaExport  : HHH000389: Unsuccessful: alter table user_role drop constraint FK859n2jvi8ivhui0rl0esws6o
2020-09-01 21:16:57.701 ERROR 13016 --- [           main] org.hibernate.tool.hbm2ddl.SchemaExport  : user lacks privilege or object not found: PUBLIC.USER_ROLE
Hibernate: drop table role if exists

Hibernate: select user0_.id as id1_1_, user0_.firstname as firstnam2_1_, user0_.lastname as lastname3_1_, user0_.password as password4_1_, user0_.username as username5_1_ from user user0_ where user0_.username=?
2020-09-01 21:26:01.951 ERROR 13016 --- [nio-8080-exec-9] w.a.UsernamePasswordAuthenticationFilter : An internal error occurred while trying to authenticate the user.

	at java.lang.Thread.run(Unknown Source) [na:1.8.0_161]
Caused by: java.lang.NullPointerException: null
	at com.akjavadev.auth.service.UserDetailsServiceImpl.loadUserByUsername(UserDetailsServiceImpl.java:29) ~[classes/:na]
	at 

org.springframework.security.authentication.InternalAuthenticationServiceException: null

### comments

1)
Fixed the nullpointer issue in loadUserByUsername.
Issue was in the login page, username textbox name was changed to Email id.
But in the user object, attribute name its expecting was username. So, set the name of the text box to username, but still we can enter email id for login

2)
2 Roles and an admin user will be created while application starts
Refer: InitalDataLoaderService class
https://www.baeldung.com/role-and-privilege-for-spring-security-registration

Issues:
1) Admin user able to login but welcome page not loading
2) Registered users are not able to login from registeration page, bcoz of below issue.

org.springframework.security.authentication.BadCredentialsException: Bad credentials
	at org.springframework.security.authentication.dao.DaoAuthenticationProvider.additionalAuthenticationChecks(DaoAuthenticationProvider.java:98)
	at org.springframework.security.authentication.dao.AbstractUserDetailsAuthenticationProvider.authenticate(AbstractUserDetailsAuthenticationProvider.java:166)
	at org.springframework.security.authentication.ProviderManager.authenticate(ProviderManager.java:174)
	at com.akjavadev.auth.service.SecurityServiceImpl.autologin(SecurityServiceImpl.java:43)

I'll take a look at this tomorrow.

You continue with setting up the evaluation logic. I'll fix this.

###nothing to check in today. 
Looks like html only they wanted us to use for the assessment page.. 
So trying it as a separate project. I'll continue there and let's see how to merge in final.
Thymeleaf and jsp together view caused some more issue. 
So trying to work as separate to continue the atleast.


###Successs

Was able to set up complete end to end flow. included your pages too in the flow.
Refer screenshots_new doc.

Whole code was built on top of your code base. So, take the assessmentportal_updated.zip file and build on top of it.

I'm sorry i'm not able to fix the alignment. We will try to fix the allignment and finish setup based on the requirement.

Below 2 links were very useful in completing this
For base setup : https://mkyong.com/spring-boot/spring-boot-spring-security-thymeleaf-example/
For success handler: https://www.yawintutor.com/spring-boot-security-step-by-step-5/


