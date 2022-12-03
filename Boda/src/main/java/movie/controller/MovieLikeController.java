package movie.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import movie.model.MovieDao;

@Controller
public class MovieLikeController {
	
	private final String command="likeMovie.look";
	private String gotoPage="redirect:/movie_end.look";
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	private MovieDao movieDao;
	
	@RequestMapping(command)
	public String likeMovie(
			@RequestParam("m_num") int m_num,
			@RequestParam(value="pageNumber", required=false) String pageNumber) {
		
		int result=movieDao.likeMovie(m_num);
		System.out.println("likeMovie:"+result);
		return gotoPage+"?pageNumber="+pageNumber;
		
	}
}
