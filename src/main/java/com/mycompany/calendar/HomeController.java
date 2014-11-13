package com.mycompany.calendar;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.calendar.dao.CalendarUserDao;
import com.mycompany.calendar.dao.EventAttendeeDao;
import com.mycompany.calendar.dao.EventDao;
import com.mycompany.calendar.domain.CalendarUser;
import com.mycompany.calendar.domain.Event;
import com.mycompany.calendar.domain.EventAttendee;
import com.mycompany.calendar.service.CalendarService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	CalendarUserDao calendarUserDao;
	
	@Autowired
	EventDao eventDao;
	
	@Autowired
	EventAttendeeDao eventAttendeeDao;
	
	@Autowired
	CalendarService calendarService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		List<CalendarUser> calendarUsers;
		List<Event> events;
		List<EventAttendee> eventAttendees;
		
		calendarUsers = calendarUserDao.findAllusers();
		events = eventDao.findAllEvents();
		eventAttendees = eventAttendeeDao.findAllEventAttendees();
		
		return "home";
	}
	
}
