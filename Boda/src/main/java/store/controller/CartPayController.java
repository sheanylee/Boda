package store.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boda.member.model.MemberBean;
import boda.member.model.MemberDao;
import order.model.OrderBean;
import order.model.OrderDao;
import store.cart.MyCart;
import store.cart.ShoppingInfo;
import store.model.MyTicketBean;
import store.model.MyTicketDao;
import store.model.StoreBean;
import store.model.StoreDao;


@Controller
public class CartPayController {
   private final String command="store_bill.st";
   private final String getPage2="/store_bill";

   private final String command2="bill_point_proc.st"; 
   
   private final String command3="store_pay.st"; 
   
   private final String getPage3="redirect:/store_ticket.st";
   
   private final String command4="bill_direct_point_proc.st"; 
   
   private final String getPage4="/store_direct_bill";

   @Autowired
   OrderDao orderDao;

   @Autowired
   MyTicketDao myticketDao;

   @Autowired
   MemberDao memberDao;
   
   @Autowired
   StoreDao storeDao;

   @RequestMapping(command) 
   public String bill() {
      return getPage2;
   }
   
   @RequestMapping(command3)
      public String pay(HttpSession session,
            @RequestParam("final_price") int final_price) {

         MemberBean mb=(MemberBean)session.getAttribute("loginInfo");

         if(session.getAttribute("direct_buy_sb")!=null) {
            StoreBean sb=(StoreBean)session.getAttribute("direct_buy_sb");
            int order=(Integer)session.getAttribute("order");

            OrderBean ob=new OrderBean();
            ob.setO_id(mb.getId());
            ob.setO_name(sb.getS_name());
            ob.setO_order(order);
            ob.setO_price(Integer.parseInt(sb.getS_price()));
            ob.setO_total_price(order*Integer.parseInt(sb.getS_price()));
            ob.setO_total_point(order*Integer.parseInt(sb.getS_point()));
            ob.setS_num(sb.getS_num());

            orderDao.insertS_orders(ob);
            if(session.getAttribute("gift_id")==null) {
               if(sb.getS_num()==1 || sb.getS_num()==2 || sb.getS_num()==3) {
                  myticketDao.insertData(ob);
               }
            }

            mb.setPoint(mb.getPoint()+ob.getO_total_point());
            if(session.getAttribute("point")!=null) {
               int point=(Integer)session.getAttribute("point");
               mb.setPoint(mb.getPoint()-point);
            }
            memberDao.updatePoint(mb.getId(), mb.getPoint());
            session.removeAttribute("point");
            
            session.removeAttribute("direct_buy_sb");
            session.removeAttribute("order");
            
            if(session.getAttribute("gift_id")!=null) {
               String id=(String)session.getAttribute("gift_id");
               int s_num=(Integer)session.getAttribute("gift_s_num");
               StoreBean sbean=storeDao.getStoreByS_num(s_num);
               int gift_order=(Integer)session.getAttribute("gift_order");
               
               MyTicketBean mbean=new MyTicketBean();
               mbean.setT_id(id);
               mbean.setT_spec(sbean.getS_name());
               mbean.setT_order(gift_order);
               
               myticketDao.gift(mbean);
               
               session.removeAttribute("gift_id");
               session.removeAttribute("gift_s_num");
               session.removeAttribute("gift_order");
            }
         }//
         else {
            System.out.println("final_price:"+final_price);
            if(session.getAttribute("mycart") !=null) {
               MyCart mycart=(MyCart)session.getAttribute("mycart");
               Map<Integer, Integer> map=mycart.getAllOrderLists();
               Set<Integer> keylist=map.keySet();

               List<ShoppingInfo> shopLists=(List)session.getAttribute("shopLists");

               int Total_Point=0;
               for(ShoppingInfo sif:shopLists) {
                  OrderBean ob=new OrderBean();
                  ob.setO_id(mb.getId());
                  ob.setO_name(sif.getName());
                  ob.setO_order(sif.getOrder());
                  ob.setO_price(sif.getPrice());
                  ob.setO_total_price(final_price);
                  ob.setO_total_point(sif.getTotal_point());
                  ob.setS_num(sif.getS_num());

                  Total_Point +=sif.getTotal_point();

                  orderDao.insertS_orders(ob);
                  if(sif.getS_num()==1 || sif.getS_num()==2 || sif.getS_num()==3) {
                     myticketDao.insertData(ob);
                  }
               }
               mb.setPoint(mb.getPoint()+Total_Point);
               if(session.getAttribute("point")!=null) {
                  int point=(Integer)session.getAttribute("point");
                  mb.setPoint(mb.getPoint()-point);
               }
               memberDao.updatePoint(mb.getId(),mb.getPoint());
               session.removeAttribute("point");

               session.removeAttribute("mycart");
               session.removeAttribute("shopLists");

               Map<String,String> Map = new HashMap<String,String>();
               List<OrderBean> paylists=orderDao.getAllS_orders(Map);

               session.setAttribute("paylists", paylists);
            }//
         }
         return getPage3;
      }//pay

   @RequestMapping(command2) 
   public String bill_point_proc(@RequestParam("bill_point") String bill_point,
         Model model, HttpSession session) {
      
      if(bill_point!=null) {
         model.addAttribute("bill_point", Integer.parseInt(bill_point));
         session.setAttribute("point", Integer.parseInt(bill_point)); 
      }
      return getPage2;
   }
   
   @RequestMapping(command4) 
   public String bill_direct_point_proc(@RequestParam("bill_point") String bill_point,
         Model model, HttpSession session) {
      
      if(bill_point!=null) {
         model.addAttribute("bill_point", Integer.parseInt(bill_point));
         session.setAttribute("point", Integer.parseInt(bill_point)); 
      }
      return getPage4;
   }
}