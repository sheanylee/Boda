package room.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import boda.member.model.MemberBean;
import boda.member.model.MemberDao;
import room.model.RoomBean;
import room.model.RoomDao;

@ComponentScan({"room.*","member.*"})
@Controller
public class ChatRoomListController {
   private final String command = "chattingRoomList.room";
   private String getPage = "/chattingRoomList";
   
   private final String getRmNo = "getRoom_no.room";
   
   @Autowired RoomDao roomDao;
   @Autowired MemberDao memberDao;
   
   @RequestMapping(command)
   public String room(HttpSession session, Model model) {
      MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
      
      List<RoomBean> roomlist = new ArrayList<RoomBean>();
      System.out.println(mb.getNo());
      roomlist = roomDao.getAllRoomListByNo(mb.getNo());
      
      List<MemberBean> memList = new ArrayList<MemberBean>();
      
      model.addAttribute("memList",memList);
      model.addAttribute("roomlist",roomlist);
      model.addAttribute("mb",mb);
      return getPage;
   }
   
   @RequestMapping(value = getRmNo, method = RequestMethod.POST)
   public @ResponseBody String getRmNo(@RequestParam() String read_mno,HttpSession session) {
      
      MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
      String no = String.valueOf(mb.getNo());
      RoomBean rb = new RoomBean(no,read_mno);
      
      RoomBean room = roomDao.getRoomBymno(rb);//get roombean
      if(room==null) {
         roomDao.insertRoom(rb); //insert room
         room = roomDao.getRoomBymno(rb);//get roombean
      }
      String room_no  = room.getRoom_no(); 
      return room_no;
   }

}