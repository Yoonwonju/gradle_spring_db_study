package gradle_spring_db_study;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import gradle_spring_db_study.config.AppCtx;
import gradle_spring_db_study.spring.Member;
import gradle_spring_db_study.spring.MemberDao;

public class MainForDataSource {
	
   private static MemberDao memberDao;
   
   public static void main(String[] args) {
      try (AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(AppCtx.class);) {
         DataSource ds = ctx.getBean(DataSource.class);
         System.out.println(ds);
         
         memberDao = ctx.getBean(MemberDao.class);
         selectByEmail();
         selectAll();
         selectCount();
      }
   }

   private static void selectByEmail() {
      System.out.println("selectByEmail()");
      Member findMember = memberDao.selectByEmail("TEST@TEST.CO.KR");
      System.out.printf("%d : %s : %s%n", findMember.getId(), findMember.getEmail(), findMember.getName());
      
   }
   
   private static void selectAll() {
	   System.out.println("selectAll()");
	   List<Member> list = memberDao.selectAll();
	   list.stream().forEach(System.out::println);
   }
   
   private static void selectCount() {
	   System.out.println("selectCount()");
	   int count = memberDao.count();
	   System.out.println("Count >>> " + count);
   }
}