package gradle_spring_db_study.spring;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class MemberDao {

	private JdbcTemplate jdbcTemplate;
	
	//preparestatement 와 같은것?
	@Autowired
	public MemberDao(DataSource dataSource) {
		super();
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	
	/* 결과가 1개인 경우 */
	public Member selectByEmail(String email) {
		String sql = "SELECT ID, EMAIL, PASSWORD, NAME, REGDATE FROM MEMBER WHERE EMAIL = ?";
		Member member = jdbcTemplate.queryForObject(sql, new MemberRowMapper(), email);
		return member;
	}

	public void insert(Member member) {
	}

	public void update(Member member) {
	}

	/* 결과가 1개 이상인 경우 */
	public List<Member> selectAll() {
		return jdbcTemplate.query("SELECT ID, EMAIL, PASSWORD, NAME, REGDATE FROM MEMBER", new MemberRowMapper());
	}
	
	/* 결과가 1개 인 경우 */
	public int count() {
		return jdbcTemplate.queryForObject("SELECT COUNT(*) FROM MEMBER", Integer.class);
	}

	/*
	 * private static long nextid = 0;
	 * 
	 * private Map<String, Member> map = new HashMap<>();
	 * 
	 * public Member selectByEmail(String email) { return map.get(email); }
	 * 
	 * public void insert(Member member) { member.setId(++nextid);
	 * map.put(member.getEmail(), member); }
	 * 
	 * public void update(Member member) { map.put(member.getEmail(), member); }
	 * 
	 * public Collection<Member> selectAll(){ return map.values(); }
	 */
}