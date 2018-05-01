package dong.configuration;

import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;
import java.util.Properties;

@Configuration
@EnableWebMvc
@EnableTransactionManagement
@ComponentScan("dong")
@PropertySource("classpath:application.properties")
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
    LocalSessionFactoryBean sessionFactoryBean = new LocalSessionFactoryBean();
    sessionFactoryBean.setDataSource(dataSource());
    sessionFactoryBean.setPackagesToScan(env.getProperty("entitymanager.packagesToScan"));
    Properties hibernateProperties = new Properties();
    hibernateProperties.put("hibernate.dialect",env.getProperty("hibernate.dialect"));
    hibernateProperties.put("hibernate.show_sql", "true");
    hibernateProperties.put("hibernate.hbm2ddl.auto",env.getProperty("hibernate.hbm2ddl.auto"));
    sessionFactoryBean.setHibernateProperties(hibernateProperties);
    return sessionFactoryBean;
  }

  @Bean
  public FactoryBean<EntityManagerFactory> entityManagerFactory(){
    LocalContainerEntityManagerFactoryBean containerEntityManagerFactoryBean = new LocalContainerEntityManagerFactoryBean();
    containerEntityManagerFactoryBean.setDataSource(dataSource());
    HibernateJpaVendorAdapter adaptor = new HibernateJpaVendorAdapter();
    containerEntityManagerFactoryBean.setJpaVendorAdapter(adaptor);
    containerEntityManagerFactoryBean.setPackagesToScan(env.getProperty("entitymanager.packagesToScan"));
    Properties props = new Properties();
    props.setProperty("hibernate.dialect", env.getProperty("hibernate.dialect"));
    props.setProperty("hibernate.show_sql", "true");
    props.setProperty("hibernate.hbm2ddl.auto",env.getProperty("hibernate.hbm2ddl.auto"));
    containerEntityManagerFactoryBean.setJpaProperties(props);
    return containerEntityManagerFactoryBean;
  }

  @Bean
  public PlatformTransactionManager transactionManager(EntityManagerFactory entityManagerFactory){

    JpaTransactionManager jpaTransactionManager = new JpaTransactionManager();
    jpaTransactionManager.setDataSource(dataSource());
    jpaTransactionManager.setEntityManagerFactory(entityManagerFactory);
    return jpaTransactionManager;
  }

  // upload file
  @Bean(name = "multipartResolver")
  public CommonsMultipartResolver commonsMultipartResolver(){
    CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
    multipartResolver.setMaxUploadSize((Integer.valueOf(env.getProperty("size.upload"))));
    return multipartResolver;
  }
//  @Bean
//  public FlowHandlerMapping flowHandlerMapping() {
//    FlowHandlerMapping flowRegistry = new FlowHandlerMapping();
//    return flowRegistry;
//  }
//  @Bean
//  public FlowHandlerAdapter flowHandlerAdapter(){
//    FlowHandlerAdapter flowExecutor = new FlowHandlerAdapter();
//    return flowExecutor;
//  }
  @Bean
  public DataSource dataSource() {
    DriverManagerDataSource dataSource = new DriverManagerDataSource();
    dataSource.setDriverClassName(env.getProperty("db.driver"));
    dataSource.setUrl(env.getProperty("db.jdbc"));
    dataSource.setUsername(env.getProperty("db.username"));
    dataSource.setPassword(env.getProperty("db.password"));
    return dataSource;
  }
  @Bean
  public JdbcTemplate jdbcTemplate() {
    return new JdbcTemplate(dataSource());
  }

  // Bean Application Properties
  @Bean
  public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
    return new PropertySourcesPlaceholderConfigurer();
  }
  @Autowired
  private Environment env;
}


