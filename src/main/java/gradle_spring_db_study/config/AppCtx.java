package gradle_spring_db_study.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@ComponentScan(basePackages = {
		"gradle_spring_db_study.spring", 
		"gradle_spring_db_study.mapper"
		})
@Import({ContextDataSource.class, ContextSqlSession.class})
//@EnableTransactionManagement
public class AppCtx {
//    @Bean(destroyMethod = "close")
//    public DataSource dataSource() {
//        HikariDataSource dataSource = null;
//        try {
//            Properties prop = Resources.getResourceAsProperties("application.properties");
//            HikariConfig cfg = new HikariConfig(prop);
//            dataSource = new HikariDataSource(cfg);
//            dataSource.setMinimumIdle(10);
//            dataSource.setMaximumPoolSize(100);
//
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        return dataSource;
//    }
//    
//    @Bean
//    public PlatformTransactionManager transactionManager() {
//    	DataSourceTransactionManager tm = new DataSourceTransactionManager();
//    	tm.setDataSource(dataSource());
//    	return tm;
//    }

}
