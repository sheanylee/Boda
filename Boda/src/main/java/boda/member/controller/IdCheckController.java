package boda.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import boda.member.model.MemberDao;

@Controller
public class IdCheckController {
	private final String command="id_check_proc.bd";
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(command)
	@ResponseBody
	public String id_check(@RequestParam("userid") String userid) {
		int cnt=-1;
		cnt=memberDao.idCheck(userid);
		System.out.println("userid:"+userid);
		System.out.println("cnt:"+cnt);
		if(cnt==0) {
			return "YES";
		}
		else {
			return "NO";
		}
	}
}
