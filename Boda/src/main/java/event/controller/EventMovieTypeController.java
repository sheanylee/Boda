package event.controller;

import java.util.ArrayList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import movie.model.IndeMovieBean;
import movie.model.MovieBean;
import movie.model.MovieDao;

@ComponentScan("movie.*")
@Controller
public class EventMovieTypeController {
   private final String command = "movieType.et";
   private String getMainPage = "/movieType";
   
   private final String test1 = "movieTest_1.et";
   private final String getTestPage1 = "/movieTest_1";
   
   private final String test2 = "movieTest_2.et";
   private final String getTestPage2 = "/movieTest_2";
   
   private final String test3 = "movieTest_3.et";
   private final String getTestPage3 = "/movieTest_3";
   
   private final String test4 = "movieTest_4.et";
   private final String getTestPage4 = "/movieTest_4";
   
   
   private final String test5 = "movieTest_5.et";
   private final String getTestPage5 = "/movieTest_5";
   
   private final String Result = "movieTypeResult.et";
   private String getResultPage = "/movieTypeResult";
   
   String mt_a;
   String mt_b;
   String mt_c;
   String mt_d;
   String mt_e;
   
   @Autowired
   MovieDao movieDao;
   
   @RequestMapping(command)
   public String movietype() {
      return getMainPage;
   }
   
   @RequestMapping(test1)
   public String testPage1() {

      return getTestPage1;
   }
   
   @RequestMapping(test2)
   public String testPage2(@RequestParam(value="a") String a) {

      mt_a = a;
      System.out.println("mt_a : " + mt_a);
      
      return getTestPage2;
   }
   
   @RequestMapping(test3)
   public String testPage3(@RequestParam(value="b") String b) {

      mt_b = b;
      System.out.println("mt_b : " + mt_b);
      
      return getTestPage3;
   }
   
   @RequestMapping(test4)
   public String testPage4(@RequestParam(value="c") String c) {

      mt_c = c;
      System.out.println("mt_c : " + mt_c);
      
      return getTestPage4;
   }
   
   @RequestMapping(test5)
   public String testPage5(@RequestParam(value="d") String d) {

      mt_d = d;
      System.out.println("mt_d : " + mt_d);
      
      return getTestPage5;
   }
   
   @RequestMapping(Result)
   public String testResult(@RequestParam(value="e") String e,
                     Model model) {
      
      mt_e = e;
      System.out.println("mt_e : " + mt_e);
      System.out.println("result : " + mt_a + "/" + mt_b + "/" + mt_c + "/" + mt_d + "/" + mt_e);
      
      //1
      List<MovieBean> mb_aList = new ArrayList<MovieBean>();
      List<IndeMovieBean> imb_aList = new ArrayList<IndeMovieBean>();
      if(mt_a.equals("a1")) {
    	 mb_aList = movieDao.selectGenre("드라마, 액션");
         model.addAttribute("mb_aList", mb_aList);
      }
      else if(mt_a.equals("a2")) {
         imb_aList = movieDao.selectIndeMovieByGenre("Fiction");
         model.addAttribute("imb_aList", imb_aList);
      }
      
      //2
      List<MovieBean> mb_bList = new ArrayList<MovieBean>();
      if(mt_b.equals("b1")) {
    	 mb_bList = movieDao.selectGenre("액션, 코미디");
         model.addAttribute("mb_bList", mb_bList);
      }
      else if(mt_b.equals("b2")) {
    	 mb_bList = movieDao.selectGenre("공포(호러), 미스터리");
         model.addAttribute("mb_bList", mb_bList);
      }
      
      //3
      List<MovieBean> mb_cList = new ArrayList<MovieBean>();
      List<IndeMovieBean> imb_cList = new ArrayList<IndeMovieBean>();
      if(mt_c.equals("c1")) {
         imb_cList = movieDao.selectIndeMovieByGenre("Documentary");
         model.addAttribute("imb_cList", imb_cList);
      }
      else if(mt_c.equals("c2")) {
    	 mb_cList = movieDao.selectGenre("드라마, 코미디");
         model.addAttribute("mb_cList", mb_cList);
      }   
      
      //4
      List<MovieBean> mb_dList = new ArrayList<MovieBean>();
      if(mt_d.equals("d1")) {
    	 mb_dList = movieDao.selectGenre("뮤지컬");
         model.addAttribute("mb_dList", mb_dList);
      }
      else if(mt_d.equals("d2")) {
    	 mb_dList = movieDao.selectGenre("드라마, 전쟁");
         model.addAttribute("mb_dList", mb_dList);
      }   
      
      //5
      List<IndeMovieBean> imb_eList = new ArrayList<IndeMovieBean>();
      if(mt_e.equals("e1")) {
         imb_eList = movieDao.selectIndeMovieByGenre("Fiction");
         model.addAttribute("imb_eList", imb_eList);
      }
      else if(mt_e.equals("e2")) {
         imb_eList = movieDao.selectIndeMovieByGenre("Documentary");
         model.addAttribute("imb_eList", imb_eList);
      }   
      
      return getResultPage;
   }
}