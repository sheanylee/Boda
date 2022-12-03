package movie.controller;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import movie.model.IndeMovieDao;
import movie.model.MovieDao;

@Controller
public class IndeMovieDeleteController {
		
	private final String command="deleteIndeMovie.look";
	private String gotoPage="redirect:/selectIndeMovie.look";
	
	@Autowired
	private IndeMovieDao indeMovieDao;

	@Autowired
	ServletContext servletContext;	
	
	@RequestMapping(command)
	public String deleteIndeMovie(
			@RequestParam("num") int num,
			@RequestParam(value="pageNumber", required=false) String pageNumber,
			@RequestParam("img") String img,
			@RequestParam("direc_img1") String direc_img1,
			@RequestParam("direc_img2") String direc_img2){
		
		//이미지 삭제
		String imgPath = servletContext.getRealPath("/resources/movie_image/Independent_film/")+img;
		String imgPath1 = servletContext.getRealPath("/resources/movie_image/Independent_film/direc/")+direc_img1;
		String imgPath2 = servletContext.getRealPath("/resources/movie_image/Independent_film/direc/")+direc_img2;
		File file = new File(imgPath);
		File file1 = new File(imgPath1);
		File file2 = new File(imgPath2);
		file.delete();
		file1.delete();
		file2.delete();
		
		int result=indeMovieDao.deleteIndeMovie(num);
		System.out.println(result);
		return gotoPage+"?pageNumber="+pageNumber;
				
	}

}
