
package book.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import book.model.BookBean;
import book.model.BookDao;
import utility.Paging;

@Controller
public class AdminBookListController {
   private final String command = "admin_bookList.bk";
   private String getPage = "/admin_bookList";
   
   @Autowired BookDao bookDao;
   
   @RequestMapping(value=command)
   public String admin_bookList(@RequestParam(value="keyword", required=false) String keyword,
                  @RequestParam(value="whatColumn", required=false) String whatColumn,
                  @RequestParam(value="pageNumber", required=false) String pageNumber,
                     Model model, HttpServletRequest request){
      
      System.out.println("keyword/whatColunm : " + keyword +"/"+ whatColumn);
      Map<String, String> map = new HashMap<String, String>();
      map.put("keyword", "%"+keyword+"%");
      map.put("whatColumn", whatColumn);
      
      //예매내역 가져오기 위한 레코드 총 개수
      int totalCount = bookDao.getAllBookingListTotalCount(map);
      System.out.println("totalcount : " + totalCount);
      String url = request.getContextPath() + "/" + command;
      System.out.println("url : " + url);
      Paging pageInfo = new Paging(pageNumber, null, totalCount, url, whatColumn, keyword, null);

      //모든 사용자의 예매내역 가져오기
      List<BookBean> bookLists = new ArrayList<BookBean>();
      bookLists = bookDao.getAllBookingList(map,pageInfo);
      System.out.println("bookLists size : " + bookLists.size());
      model.addAttribute("pageInfo",pageInfo);
      model.addAttribute("bookLists",bookLists);
      return getPage;
   }
   
   
}