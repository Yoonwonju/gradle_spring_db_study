package gradle_spring_db_study.spring;

import org.springframework.stereotype.Component;

@Component
public class MemberPrinter {
    public void print(Member member) {
        System.out.printf(
                "회원 정보: 아이디=%s,이메일=%s, 이름=%s, 등록일=%tF%n", 
                member.getId(), member.getEmail(), member.getName(),
                member.getRegisterDateTime());
    }
}
