package Qaru.Prj.config;

//import Qaru.Prj.config.customSecurity.CustomAuthFailureHandler;
//import Qaru.Prj.jwt.JwtAuthenticationFilter;
import Qaru.Prj.config.customSecurity.CustomAuthFailureHandler;
import Qaru.Prj.jwt.JwtAuthenticationFilter;
import Qaru.Prj.jwt.JwtTokenProvider;
import lombok.RequiredArgsConstructor;
        import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    private final JwtTokenProvider jwtTokenProvider;

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/js/**", "/css/**", "/favicon.ico", "/error", "/WEB-INF/views/error.jsp");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        // ============== Sesseion Security 설정

        http.csrf().disable()
                    .authorizeRequests()
                    .antMatchers("/tour/*").authenticated()
                    .antMatchers("/order/*").authenticated()
                    .antMatchers("/order/*/*").authenticated()
                    .anyRequest().permitAll()
                .and()
                    .formLogin()
                    .usernameParameter("userId")
                    .passwordParameter("userPw")
                    .loginPage("/user/login")
                    .loginProcessingUrl("/login") // /login 주소가 호출이 되면 시큐리티가 낚아채서 대신 로그인을 진행해준다.
                    .failureHandler(new CustomAuthFailureHandler())
                    .defaultSuccessUrl("/")
                .and()
                    .logout()
                    .logoutUrl("/user/logout");
//                    .logoutSuccessUrl("/");	// logout에 성공하면 /로 redirect


//         =============== JWT Security 설정
//         http
//                .csrf().disable()
//                .httpBasic().disable()
//                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
//                .and()
//                .authorizeRequests()
//                .antMatchers("/tour/*").hasRole("USER")
//                .anyRequest().permitAll()
//                .and()
//                 .formLogin()
//                 .loginPage("/user/login")
//                 .and()
//                .addFilterBefore(new JwtAuthenticationFilter(jwtTokenProvider), UsernamePasswordAuthenticationFilter.class);
    }

    @Bean
    public CorsFilter corsFilter() {
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        CorsConfiguration config = new CorsConfiguration();
        config.setAllowCredentials(true);
        config.addAllowedOriginPattern("*");
        config.addAllowedHeader("*");
        config.addAllowedMethod("*");
        source.registerCorsConfiguration("/**", config);
        return new CorsFilter(source);
    }

}
