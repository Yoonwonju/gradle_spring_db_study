package gradle_spring_db_study.spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
public class ChangePasswordService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Transactional
	public void changePassword(String email, String oldPwd, String newPwd) {

		try {
			Member member = memberDao.selectByEmail(email);
			
			member.changePassword(oldPwd, newPwd);
			
			memberDao.update(member);
//			if(member == null)
//				throw new MemberNotFoundException();
		}catch(EmptyResultDataAccessException e) {
			throw new MemberNotFoundException();
		}
	}

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
//	public void changePassword(String email, String oldPwd, String newPwd) {
//		Member member = memberDao.selectByEmail(email);
//		if(member == null)
//			throw new MemberNotFoundException();
//		
//		member.changePassword(oldPwd, newPwd);
//		
//		memberDao.update(member);
//	}
//	
//	public void setMemberDao(MemberDao memberDao) {
//		this.memberDao = memberDao;
//	}
	
}
