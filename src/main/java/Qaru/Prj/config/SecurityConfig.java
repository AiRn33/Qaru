package Qaru.Prj.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable()
                .authorizeRequests()
                .antMatchers("/tour/*").authenticated()
                .anyRequest().permitAll()
                .and()
                .formLogin()
                .usernameParameter("loginId")
                .passwordParameter("password")
                .loginPage("/user/login")
                .defaultSuccessUrl("/")
//                .failureUrl("/security-login/login")
                .and()
                .logout()
                .logoutUrl("/security-login/logout")
                .invalidateHttpSession(true).deleteCookies("JSESSIONID");
    }
}
