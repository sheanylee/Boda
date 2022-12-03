package theater.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import theater.model.TheaterBean;
import theater.model.TheaterDao;

@Controller
public class Admin_T_UpdateController {
   final String command = "a_update.th";
   String getPage = "/a_theater_update";
   String goToPage = "redirect:admin_list.th";
   
   @Autowired
   TheaterDao tdao;
   
   @Autowired
   ServletContext config;
   
   @RequestMapping(value = command, method = RequestMethod.GET)
   public String update(@RequestParam(required = false) String pageNumber, @RequestParam int t_num,Model model) {
      System.out.println("num="+t_num);
      System.out.println("pageNumber="+pageNumber);
      
      TheaterBean tb = tdao.getDetail(t_num);
      model.addAttribute("tb",tb);
      model.addAttribute("pageNumber",pageNumber);
      return getPage;
   }
   
   
   
   @RequestMapping(value = command, method = RequestMethod.POST)
   public String update(@ModelAttribute("tb") @Valid TheaterBean tb, BindingResult result, @RequestParam(required = false) String beforeImg , @RequestParam(required = false) String pageNumber , Model model) throws IllegalStateException, IOException {
      System.out.println("beforeImg="+beforeImg);
      System.out.println("pageNumber="+pageNumber);
      
      if(result.hasErrors()) {
         model.addAttribute("pageNumber",pageNumber);
         return getPage;
      }
      
      //���ο� �̹��� ���ε�
         MultipartFile mf = tb.getUpload();
         String img = mf.getOriginalFilename();
         String url = config.getRealPath("/resources/극장 이미지/");
         File file = new File(url+img);
         mf.transferTo(file);
         
      //������ ����
         tdao.updateTheater(tb);
         
      //���� �̹��� ������ �����
         File fileDel = new File(url+beforeImg);
         if(fileDel.exists()) {
            fileDel.delete();
         }
         
         model.addAttribute("pageNumber",pageNumber);
      return goToPage;
   }
   
   
   
}