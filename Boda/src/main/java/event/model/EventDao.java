package event.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class EventDao {
	private String namespace="event.model.EventBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public void insertData(EventBean eb) {
		sqlSessionTemplate.insert(namespace+".InsertData",eb);
	}//

	public List<EventBean> getAllData() {
		List<EventBean> lists=sqlSessionTemplate.selectList(namespace+".GetAllData");
		return lists;
	}//

	public EventBean getEventByNo(int no) {
		EventBean eb=sqlSessionTemplate.selectOne(namespace+".GetEventByNo",no);
		return eb;
	}//

	public void updateEvent(EventBean eb) {
		sqlSessionTemplate.update(namespace+".UpdateEvent",eb);
	}//

	public void deleteEvent(int no) {
		sqlSessionTemplate.delete(namespace+".DeleteEvent",no);
	}//
}

