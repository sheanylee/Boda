package store.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import order.model.OrderBean;
import order.model.OrderDao;
import utility.Paging;

@Controller
@ComponentScan("order.*")
public class PayListController {
   private final String command="store_paylist.st";
   private final String getPage="/store_paylist_admin";
   
   @Autowired
   OrderDao orderDao;
   
   @RequestMapping(command)
   public String paylist(HttpSession session, HttpServletRequest request, Model model,
         @RequestParam(value = "pageNumber", required = false) String pageNumber,
         @RequestParam(value = "whatColumn", required = false) String whatColumn,
         @RequestParam(value = "keyword", required = false) String keyword) {
      
         
      Map<String,String>map = new HashMap<String,String>();
      
      map.put("whatColumn", whatColumn);
      map.put("keyword", "%"+keyword+"%");
      
      int totalcount=orderDao.getTotalCount(map);
      
      String context=request.getContextPath();
      String url=context+"/"+command;
      
      Paging pageInfo = new Paging(pageNumber,null,totalcount,url,whatColumn,keyword,null);
      
      if(pageNumber == null){
         pageNumber="1";
      }
      List<OrderBean> paylists=orderDao.getAllS_orders(pageInfo,map);
      session.setAttribute("paylists", paylists);
      model.addAttribute("pageInfo", pageInfo);
      return getPage;
   }//
}