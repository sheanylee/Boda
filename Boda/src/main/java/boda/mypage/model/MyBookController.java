package boda.mypage.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import book.model.BookBean;
import book.model.BookDao;
import movie.model.MovieDao;

@Controller
@ComponentScan({"book.*","movie.*"})
public class MyBookController { 
   private final String command="mybooklist.bd";
   private final String getPage="/mypage/mybooklist";
   
   @Autowired
   BookDao bdao;
   
   @Autowired
   MovieDao mdao;
   
   @RequestMapping(command)
   public String mybooklist(@RequestParam(required = false) String userId,
                  //   @RequestParam(required = false) String mname, 
                     Model model) {
      System.out.println("id="+userId);
   
      List<BookBean> movieLists = bdao.getMyBookingList(userId);
      List<BookBean> indeLists = bdao.GetMyIndeBookingList(userId);
      System.out.println("lists.size="+movieLists.size());
      System.out.println("lists.size="+indeLists.size());
      
      String m_name ="";
      if(movieLists.size()!=0) {
            for(int i=0;i<1;i++) {
               BookBean bb = movieLists.get(i);
               m_name = bb.getR_mname();
               System.out.println(m_name);
            }
         }
      //jh add 
      if(indeLists.size()!=0) {
         for(int i=0;i<1;i++) {
            BookBean bb = indeLists.get(i);
            m_name = bb.getR_mname();
            System.out.println(m_name);
         }
      }
      
      String moiveNum = mdao.getMovieNum(m_name);
      model.addAttribute("moiveNum",moiveNum);
      
      //jh add 
      model.addAttribute("movieLists",movieLists);
      model.addAttribute("indeLists",indeLists);
      System.out.println("상업영화:"+movieLists.size());
      System.out.println("독립영화:"+indeLists.size());
      return getPage;
   }
}