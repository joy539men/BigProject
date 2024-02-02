//package com.example;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.http.HttpMethod;
//import org.springframework.security.authentication.AuthenticationManager;
//import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.provisioning.InMemoryUserDetailsManager;
//import org.springframework.security.web.SecurityFilterChain;
//
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.provisioning.InMemoryUserDetailsManager;
//import org.springframework.security.web.SecurityFilterChain;
//
//@Configuration
//@EnableWebSecurity
//public class SecurityConfig extends WebSecurityConfigurerAdapter {
//
//@Configuration
//@EnableWebSecurity
//public class SecurityConfig {
//	@Bean
//	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
//		security.authorizeRequests((requests) -> requests.antMatchers("/**").permitAll().antMatchers("/static/**", "/public/**").permitAll().antMatchers("/").permitAll().antMatchers("/account")
//				.hasRole("ADMIN").anyRequest().authenticated()).formLogin((login) -> login.loginPage("/login") // 登入頁面的URL
//						.permitAll())
//				.logout((logout) -> logout.logoutUrl("/logout") // 登出URL
//						.permitAll());
//
//		return http.build();
//	}
//
//
//	@Bean
//	public UserDetailsService userDetailsService() {
//		return new InMemoryUserDetailsManager(
//				User.builder().username("admin").password("password").roles("ADMIN").build());
//	}
//}
//	@Configuration
//	@EnableWebSecurity
//	public class SecurityConfig {
//
//		// 安全訪問
//		@Bean
//		public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
//			  http
//				.authorizeHttpRequests((authorize) -> authorize
//					.antMatchers("/account").hasAuthority("ADMIN")
//					.anyRequest().permitAll()
//				)
//			            .and()
//			            .formLogin()
//			            .and()
//			            .csrf().disable();
//			            .build()
//			            return http.build();
//		}
//
//		// 處理身份驗證
//		@Bean
//		public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration)
//				throws Exception {
//			return authenticationConfiguration.getAuthenticationManager();
//		}
//
//		// 使用spring security內建加密方法將密碼加密
//		@Bean
//		public BCryptPasswordEncoder passwordEncoder() {
//			return new BCryptPasswordEncoder();
//		}
//		
//			@Bean
//		public UserDetailsService userDetailsService() {
//			return new InMemoryUserDetailsManager(
//					User.builder().username("admin123").password("password").roles("ADMIN").build());
//		}
//
//	}
//
package com.example;
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;

@Configuration
public class SecurityConfig  {

    @Bean
    public FilterRegistrationBean<Filter> adminFilter() {
        FilterRegistrationBean<Filter> registrationBean = new FilterRegistrationBean<>();
        registrationBean.setFilter(new AdminFilter());
        registrationBean.addUrlPatterns("/admin/*"); // 設定要過濾的請求路徑
        registrationBean.setOrder(Ordered.HIGHEST_PRECEDENCE);
        return registrationBean;
    }

    private static class AdminFilter implements Filter {

        @Override
        public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
                throws IOException, ServletException {
            
        	HttpServletRequest httpRequest = (HttpServletRequest) request;
            boolean isAdmin = Boolean.TRUE.equals(httpRequest.getSession().getAttribute("isAdmin"));

            if (isAdmin) {
                chain.doFilter(request, response);
            } else {
            	 HttpServletResponse httpResponse = (HttpServletResponse) response;
                 httpResponse.sendRedirect("/pillowSurfing/login");
//                 RequestDispatcher dispatcher = request.getRequestDispatcher("/indexLogout");
//                 dispatcher.forward(request, response);
//                 
            }
        }

        @Override
        public void init(FilterConfig filterConfig) throws ServletException {
            // 初始化，可留空
        }

        @Override
        public void destroy() {
            // 銷毀，可留空
        }
    }
}
