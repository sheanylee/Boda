package movie.controller;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import movie.model.MovieDao;

@Controller
public class MovieDeleteController {
	
	private final String command="deleteMovie.look";
	private String gotoPage="redirect:/selectMovie.look";
	
	@Autowired
	private MovieDao movieDao;

	@Autowired
	ServletContext servletContext;	
	
	@RequestMapping(command)
	public String deleteMovie(
			@RequestParam("m_num") int m_num,
			@RequestParam(value="pageNumber", required=false) String pageNumber,
			@RequestParam("m_img") String m_img){
		
		//이미지 삭제
		String imgPath = servletContext.getRealPath("/resources/movie_image/")+m_img;
		File file = new File(imgPath);
		file.delete();
		
		int result=movieDao.deleteMovie(m_num);
		System.out.println(result);
		return gotoPage+"?pageNumber="+pageNumber;
				
	}
	
}
