package gradle_spring_db_study.mapper;

import java.util.List;

import gradle_spring_db_study.spring.Member;

public interface MemberMapper {
    List<Member> selectAll();
    int insert(Member member);
}
