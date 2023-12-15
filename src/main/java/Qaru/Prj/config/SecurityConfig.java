package Qaru.Prj.config;

//import Qaru.Prj.config.customSecurity.CustomAuthFailureHandler;
import Qaru.Prj.config.customSecurity.CustomAuthFailureHandler;
import Qaru.Prj.jwt.JwtAuthenticationFilter;
import Qaru.Prj.jwt.JwtTokenProvider;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AndRequestMatcher;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
//public class SecurityConfig extends WebSecurityConfigurerAdapter {
public class SecurityConfig{

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    private final JwtTokenProvider jwtTokenProvider;

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {

        return httpSecurity
                .httpBasic().disable()
                .csrf().disable()
                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                .and()
                .addFilterBefore(new JwtAuthenticationFilter(jwtTokenProvider), UsernamePasswordAuthenticationFilter.class)
                .authorizeRequests()
                .antMatchers("/tour/*").authenticated()
                .anyRequest().permitAll()
                .and()
                .formLogin()
                .loginPage("/user/login")
                .and()
                .build();
    }

//    protected void configure(HttpSecurity http) throws Exception {
//        http.csrf().disable()
//                    .authorizeRequests()
//                    .antMatchers("/tour/*").authenticated()
//                    .antMatchers("/order/*").authenticated()
//                    .antMatchers("/order/*/*").authenticated()
//                    .anyRequest().permitAll()
//                .and()
//                    .formLogin()
//                    .usernameParameter("userId")
//                    .passwordParameter("userPw")
//                    .loginPage("/user/login")
//                    .loginProcessingUrl("/login") // /login 주소가 호출이 되면 시큐리티가 낚아채서 대신 로그인을 진행해준다.
//                    .failureHandler(new CustomAuthFailureHandler())
//                    .defaultSuccessUrl("/")
//                .and()
//                    .logout()
//                    .logoutUrl("/user/logout")
//                    .logoutSuccessUrl("/");	// logout에 성공하면 /로 redirect
//    }
}
