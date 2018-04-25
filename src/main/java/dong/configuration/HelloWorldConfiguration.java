package dong.configuration;

import org.hibernate.dialect.MySQLDialect;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.webflow.mvc.servlet.FlowHandlerAdapter;
import org.springframework.webflow.mvc.servlet.FlowHandlerMapping;

import javax.sql.DataSource;
import java.util.Properties;

@Configuration
@EnableWebMvc
@ComponentScan("dong")
public class HelloWorldConfiguration extends WebMvcConfigurerAdapter {
  @Bean
  public ViewResolver viewResolver() {
    InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
    viewResolver.setViewClass(JstlView.class);
    viewResolver.setPrefix("/WEB-INF/views/");
    viewResolver.setSuffix(".jsp");
    return viewResolver;
  }

  @Override
  public void addResourceHandlers(ResourceHandlerRegistry registry) {
    registry
        .addResourceHandler("/resources/**")
        .addResourceLocations("/WEB-INF/resources/");
  }

  @Bean
  public MessageSource messageSource() {
    ReloadableResourceBundleMessageSource source = new ReloadableResourceBundleMessageSource();
    source.setBasename("classpath:messages");
    source.setDefaultEncoding("utf-8");
    return source;
  }

  @Bean
  public LocalSessionFactoryBean sessionFactory() {
    LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
    sessionFactory.setDataSource(dataSource());
    Properties properties = new Properties();
    properties.put("hibernate.dialect",new MySQLDialect());
    properties.put("hibernate.hbm2ddl.auto","update");
    properties.put("hibernate.show_sql",true);
    properties.put("hibernate.format_sql",true);
    sessionFactory.setHibernateProperties(properties);
    sessionFactory.setPackagesToScan("dong");
    return sessionFactory;
  }

  @Bean
  HibernateTransactionManager transactionManager(){
    HibernateTransactionManager transactionManager = new HibernateTransactionManager();
    return transactionManager;
  }
  // upload file
  @Bean(name = "multipartResolver")
  public CommonsMultipartResolver commonsMultipartResolver(){
    CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
    multipartResolver.setMaxUploadSize(-1);
    return multipartResolver;
  }
  @Bean
  public FlowHandlerMapping flowHandlerMapping() {
    FlowHandlerMapping flowRegistry = new FlowHandlerMapping();
    return flowRegistry;
  }
  @Bean
  public FlowHandlerAdapter flowHandlerAdapter(){
    FlowHandlerAdapter flowExecutor = new FlowHandlerAdapter();
    return flowExecutor;
  }
  @Bean
  public DataSource dataSource() {
    DriverManagerDataSource dataSource = new DriverManagerDataSource();
    dataSource.setDriverClassName("com.mysql.jdbc.Driver");
    dataSource.setUrl("jdbc:mysql://localhost:3306/demospring");
    dataSource.setUsername("root");
    dataSource.setPassword("");
    return dataSource;
  }

  @Bean
  public JdbcTemplate jdbcTemplate() {
    return new JdbcTemplate(dataSource());
  }
}


