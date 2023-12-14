package Qaru.Prj.config;

//import Qaru.Prj.config.customSecurity.CustomAuthFailureHandler;
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
                // REST API이므로 basic auth 및 csrf 보안을 사용하지 않음
                .httpBasic().disable()
                .csrf().disable()
                // JWT를 사용하기 때문에 세션을 사용하지 않음
                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                .and()
//                .authorizeHttpRequests()
                .authorizeRequests()
                .antMatchers("/tour/*").authenticated()
//                // 해당 API에 대해서는 모든 요청을 허가
//                .requestMatchers(new AntPathRequestMatcher("/tour/*")).authenticated()
//                .requestMatchers(new AntPathRequestMatcher("/order/*")).authenticated()
//                .requestMatchers(new AntPathRequestMatcher("/order/*/*")).authenticated()
                .anyRequest().permitAll()
                .and()
                .formLogin()
//                    .usernameParameter("userId")
//                    .passwordParameter("userPw")
                    .loginPage("/user/login")
//                    .loginProcessingUrl("/login") // /login 주소가 호출이 되면 시큐리티가 낚아채서 대신 로그인을 진행해준다.
//                    .failureHandler(new CustomAuthFailureHandler())
//                    .defaultSuccessUrl("/")
//                .and()
//                    .logout()
//                    .logoutUrl("/user/logout")
//                .logoutSuccessUrl("/")
                // JWT 인증을 위하여 직접 구현한 필터를 UsernamePasswordAuthenticationFilter 전에 실행
                .and()
                .addFilterBefore(new JwtAuthenticationFilter(jwtTokenProvider), UsernamePasswordAuthenticationFilter.class).build();

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
