package dong.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter{
  @Autowired
  DataSource dataSource;

  @Override
  protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//    super.configure(auth);
    auth.jdbcAuthentication().dataSource(dataSource)
        .usersByUsernameQuery("SELECT username, password, enabled FROM users WHERE username = ?")
        .authoritiesByUsernameQuery("SELECT username, authority From authorities WHERE username = ?");
  }

  @Override
  protected void configure(HttpSecurity http) throws Exception {
//    super.configure(http);
    http.csrf().disable().authorizeRequests().antMatchers("/admin/**").hasRole("ROLE_ADMIN")
        .and().authorizeRequests().antMatchers("/customer/**").hasRole("ROLE_USER")
        .anyRequest().permitAll()
        .and().formLogin().loginPage("/login").loginProcessingUrl("/login")
        .usernameParameter("username").passwordParameter("password").defaultSuccessUrl("/product/productList/all")
        .failureUrl("/login?error=failed").and().exceptionHandling().accessDeniedPage("/login?error=deny");
  }

  @Override
  public void configure(WebSecurity web) throws Exception {
//    super.configure(web);
    web.ignoring().antMatchers("/resources/**");
  }
}
