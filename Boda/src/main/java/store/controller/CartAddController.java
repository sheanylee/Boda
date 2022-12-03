package store.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import store.cart.MyCart;


@Controller
public class CartAddController {
	private final String command="Cartadd.st";
	private final String getPage="redirect:/store_cartlist.st";
	
	@RequestMapping(command)
	public String Cartadd(@RequestParam("order") int order,
			@RequestParam("s_num") int s_num,
			@RequestParam("point") int point,
			@RequestParam(value =  "num", required = false) String num,
			HttpSession session, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer=response.getWriter();
		int t_point=point*order;
		
		if(session.getAttribute("loginInfo")==null) { 
			session.setAttribute("destination", "redirect:/detail.st?s_num="+s_num);
			writer.println("<script> alert('로그인 후 이용 가능합니다.'); </script>");
	        writer.println("<script> location.href='login.bd' </script>");
	        writer.flush();
			return null;
		}
		else { 
			MyCart mycart=(MyCart)session.getAttribute("mycart");
			System.out.println("mycart:"+mycart); //null
			
			if(mycart==null) {
				mycart=new MyCart(); 
			}
			
			mycart.addCart(s_num, order);
			session.setAttribute("mycart", mycart);
			return getPage;
		}
	}
}
