package gradle_spring_db_study.mapper;

import java.util.List;

import gradle_spring_db_study.spring.Member;

public interface MemberMapper {
	public List<Member> selectAll();
	
	public int insert(Member member);
	

//	public Member selectByEmail(String email);
	
//	public int count();


//	public void update(Member member);

//	public void delete(Member member);

}
