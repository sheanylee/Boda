package admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boda.member.model.MemberBean;
import boda.member.model.MemberDao;
import store.model.StoreBean;
import store.model.StoreDao;


@Controller
public class AdminPageController {
   private final String command1="adminPage.ad";
   private final String getPage1="/adminPage";
   
   private final String command2="store_admin_upload.ad"; 
   private final String getPage2="/store_upload_admin";
   
   private final String command3="store_upload_proc.ad"; 
   private final String getPage3="redirect:/store_ticket.st";
   
   private final String command4="store_update_form.ad"; 
   private final String getPage4="/store_update_form_admin";
   
   private final String command5="store_update_proc.ad"; 
   
   private final String command6="store_delete.ad"; 
   
   private final String command7="member_admin.ad"; 
   private final String getPage5="/member_admin"; 
   
   @Autowired
   StoreDao storeDao;
   
   @Autowired
   ServletContext servletContext;
   
   @Autowired
   MemberDao memberDao;
   
   @RequestMapping(command1)
   public String adminPage() {
      return getPage1;
   }
   
   //    
   @RequestMapping(command2)
   public String admin_store_upload() {
      return getPage2;
   }
   
   //       
   @RequestMapping(command3)
   public ModelAndView admin_upload(@ModelAttribute("store") @Valid StoreBean store,
         BindingResult result, HttpServletResponse response) throws IOException {
      
      
      
      ModelAndView mav = new ModelAndView();
      
      if(result.hasErrors()) {
         mav.setViewName(getPage2);
         return mav;
      }
      
      MultipartFile multi=store.getUpload();
      System.out.println("multi.getName():"+multi.getName());
      System.out.println("multi.getOriginalFilename():"+multi.getOriginalFilename());
      System.out.println("sb.getS_image():"+store.getS_image());
      
      storeDao.insertStore(store); //DB       
      
      
      String uploadPath=servletContext.getRealPath("/resources/images");
      System.out.println("uploadPath:"+uploadPath);
//uploadPath:C:\Spring_ysy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\16_Spring_MyBatis_Products\resources
      
      File file=new File(uploadPath+"/"+multi.getOriginalFilename());
      try {
         multi.transferTo(file); //      ø   
      } catch (IllegalStateException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter writer=response.getWriter();
      writer.println("<script> alert('상품 등록이 완료되었습니다.'); </script>");
      writer.println("<script> location.href='store_ticket.st' </script>");
      writer.flush();
      return null;
   }//
   
   //   
   @RequestMapping(command4)
   public String adminPage_update(@RequestParam("s_num") int s_num,
         Model model) {
      StoreBean sb=storeDao.getStoreByS_num(s_num);
      model.addAttribute("store", sb);
      return getPage4;
   }
   
   //  
   @RequestMapping(command5)
   public String adminPage(@ModelAttribute("store") @Valid StoreBean store,
         BindingResult result,
         @RequestParam("originalimg") String originalimg,
         HttpServletResponse response) throws IOException {
      
      if(result.hasErrors()) {
         return getPage4;
      }
      
      //              
      String originalPath = servletContext.getRealPath("/resources/images/")+originalimg;
      File file1 = new File(originalPath);
      file1.delete();
      
      //           
      MultipartFile multi = store.getUpload();
      String newPath = servletContext.getRealPath("/resources/images/")+store.getS_image(); //   ε    ġ     
      File file2 = new File(newPath); //         
      
      try {
         multi.transferTo(file2); //        
      } catch (IllegalStateException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
      
      storeDao.updateStore(store);
      
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter writer=response.getWriter();
      writer.println("<script> alert('상품 수정이 완료되었습니다.'); </script>");
      writer.println("<script> location.href='store_ticket.st' </script>");
      writer.flush();
      return null;
   }//
   
   @RequestMapping(command6)
   public void adminPage_delete(@RequestParam("s_num") int s_num,
         HttpServletResponse response) throws IOException {
      storeDao.deleteStore(s_num);
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter writer=response.getWriter();
      writer.println("<script> alert('상품을 삭제하였습니다.'); </script>");
      writer.println("<script> location.href='store_ticket.st' </script>");
      writer.flush();
   }//
   
   @RequestMapping(command7)
   public String member_admin(Model model) {
      List<MemberBean> mlists=memberDao.getAllMember();
      model.addAttribute("mlists", mlists);
      return getPage5;
   }
   
}