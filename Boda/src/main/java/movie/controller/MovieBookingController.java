package movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import movie.model.MovieDao;

@Controller
public class MovieBookingController {
	
	private final String command="movie_booking.look";
	private String getPage="/movie_booking";

	@Autowired
	MovieDao movieDao;
	
	@RequestMapping(command)
	public String movie_booking(@RequestParam("m_num") int m_num) {
		
		return getPage;
		
	}
}
