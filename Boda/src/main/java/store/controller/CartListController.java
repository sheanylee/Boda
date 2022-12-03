package store.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import store.cart.MyCart;
import store.cart.ShoppingInfo;
import store.model.StoreBean;
import store.model.StoreDao;

@Controller
public class CartListController {
	private final String command="store_cartlist.st";
	private final String getPage="/store_CartList";

	private final String command2="delete_shoplists.st"; 
	private final String getPage2="redirect:/store_cartlist.st";

	private final String command3="update_shoplists.st"; 

	@Autowired
	StoreDao storeDao;

	@RequestMapping(command)
	public String cartlist(HttpSession session,Model model,
			HttpServletResponse response) throws IOException {

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer=response.getWriter();
		
		session.removeAttribute("destination");

		if(session.getAttribute("loginInfo")==null) { 
			session.setAttribute("destination", "redirect:/store_cartlist.st");
			writer.println("<script> alert('로그인 후 이용 가능합니다.'); </script>");
			writer.println("<script> location.href='login.bd' </script>");
			writer.flush();
			return null;
		}
		else {
			MyCart mycart=(MyCart)session.getAttribute("mycart");
			if(mycart!=null) {
				Map<Integer,Integer> map=mycart.getAllOrderLists();
				Set<Integer> key=map.keySet();
				List<ShoppingInfo> shopLists=new ArrayList<ShoppingInfo>();
				int totalAmount=0;
				int totalPoint=0;
				for(int x:key) {
					StoreBean sb=storeDao.getStoreByS_num(x);
					ShoppingInfo sif=new ShoppingInfo();
					sif.setNum(sb.getS_num());
					sif.setName(sb.getS_name());
					sif.setOrder(map.get(x));
					sif.setPrice(Integer.parseInt(sb.getS_price()));
					sif.setTotal_price(map.get(x)*Integer.parseInt(sb.getS_price()));
					sif.setTotal_point(Integer.parseInt(sb.getS_point())*map.get(x));
					sif.setS_num(x);

					totalAmount += sif.getTotal_price();
					totalPoint += sif.getTotal_point();

					shopLists.add(sif);
				}
				session.setAttribute("shopLists", shopLists);
				model.addAttribute("totalAmount", totalAmount);
				model.addAttribute("totalPoint", totalPoint);
				return getPage;
			}//if
			else {
				return getPage;
			}

		}//else
	}//

	@RequestMapping(command2)
	public String delete_shoplists(@RequestParam("num") int num,
			HttpSession session) {


		MyCart mycart=(MyCart)session.getAttribute("mycart");
		Map<Integer,Integer> map=mycart.getAllOrderLists();
		Set<Integer> key=map.keySet();
		for(int x:key) {
			if(x==num) {
				map.remove(x, map.get(x));
			}
		}
		return getPage2;

	}//

	@RequestMapping(command3)
	public String update_shoplists(@RequestParam("order") int order,
			@RequestParam("num") int num,
			HttpSession session,
			HttpServletResponse response) throws IOException {

		response.setContentType("text/html; charset=UTF-8");

		MyCart mycart=(MyCart)session.getAttribute("mycart");
		Map<Integer,Integer> map=mycart.getAllOrderLists();
		Set<Integer> key=map.keySet();
		for(int x:key) {
			if(x==num) {
				map.put(num, order); 
				PrintWriter writer=response.getWriter();
				writer.println("<script> alert('주문 수량이 변경되었습니다.'); </script>");
				writer.flush();
				writer.println("<script> location.href='store_cartlist.st' </script>");
			}
		}
		return getPage2;
	}
}
