package com.mycompany.calendar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.calendar.dao.CalendarUserDao;
import com.mycompany.calendar.dao.EventAttendeeDao;
import com.mycompany.calendar.dao.EventDao;
import com.mycompany.calendar.domain.CalendarUser;
import com.mycompany.calendar.domain.Event;
import com.mycompany.calendar.domain.EventAttendee;
import com.mycompany.calendar.domain.EventLevel;

@Service("calendarService")
@Transactional
public class DefaultCalendarService implements CalendarService {
	public static final int MIN_NUMLIKES_FOR_HOT = 10;

	@Autowired
	private EventDao eventDao;

	// userDao 시 root-context에서 type때문에 에러가 발생하여 변수명을 정확히 calendarUserDao로 수정
	@Autowired
	private CalendarUserDao calendarUserDao;

	@Autowired
	private EventAttendeeDao eventAttendeeDao;

	public void setEventDao(EventDao eventDao) {
		this.eventDao = eventDao;
	}
	
	/* CalendarUser */
	@Override
	public CalendarUser getUser(int id) {
		return this.calendarUserDao.findUser(id);
	}

	@Override
	public CalendarUser getUserByEmail(String email) {
		return calendarUserDao.findUserByEmail(email);
	}

	@Override
	public List<CalendarUser> getUsersByEmail(String partialEmail) {
		return calendarUserDao.findUsersByEmail(partialEmail);
	}

	@Override
	public int createUser(CalendarUser user) {
		return calendarUserDao.createUser(user);
	}

	@Override
	public void deleteAllUsers() {
		calendarUserDao.deleteAll();
	}



	/* Event */
	@Override
	public Event getEvent(int eventId) {
		return eventDao.findEvent(eventId);
	}

	@Override
	public List<Event> getEventForOwner(int ownerUserId) {
		return eventDao.findForOwner(ownerUserId);
	}

	@Override
	public List<Event> getAllEvents() {
		return eventDao.findAllEvents();
	}

	@Override
	public int createEvent(Event event) {
		if (event.getEventLevel() == null) {
			event.setEventLevel(EventLevel.NORMAL);
		}

		return eventDao.createEvent(event);
	}

	@Override
	public void deleteAllEvents() {
		eventDao.deleteAll();
	}

	/* EventAttendee */
	@Override
	public List<EventAttendee> getEventAttendeeByEventId(int eventId) {
		return null;
	}

	@Override
	public List<EventAttendee> getEventAttendeeByAttendeeId(int attendeeId) {
		return eventAttendeeDao.findEventAttendeeByAttendeeId(attendeeId);
	}

	@Override
	public int createEventAttendee(EventAttendee eventAttendee) {
		return eventAttendeeDao.createEventAttendee(eventAttendee);
	}

	@Override
	public void deleteEventAttendee(int id) {
		eventAttendeeDao.deleteEventAttendee(id);
	}

	@Override
	public void deleteAllEventAttendees() {
		eventAttendeeDao.deleteAll();
	}



	/* upgradeEventLevels */
	@Override
	public void upgradeEventLevels() throws Exception{
		List<Event> events = eventDao.findAllEvents();
		for(Event event : events) {
			if( canUpgradeEventLevel(event)) {
				upgradeEventLevel(event);
			}
		}
	}

	@Override
	public boolean canUpgradeEventLevel(Event event) {
		EventLevel currentLevel = event.getEventLevel();
		switch( currentLevel ) {
		case NORMAL: return ( event.getNumLikes() >= MIN_NUMLIKES_FOR_HOT);
		case HOT: return false;
		default: throw new IllegalArgumentException("Unknown Level: " + currentLevel);
		}
	}

	@Override
	public void upgradeEventLevel(Event event) {
		event.upgradeLevel();
		eventDao.udpateEvent(event);
	}
}