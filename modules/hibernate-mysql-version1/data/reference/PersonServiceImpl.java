package com.examples.projects.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.examples.projects.domain.Person;
import com.examples.projects.mvc.dao.interfaces.PersonDAO;
import com.examples.projects.mvc.service.interfaces.PersonService;

/**
 * In this class I don't use generic service interface as in ContactServiceImpl.
 * Please remove methods from this class if you don't want to override CRUD operation
 * from associated DAO
 *
 * Don't use this approach until ContactService approach breaks. See
 * interface and implementation of ContactService first
 */ 
@Service
@Transactional
public class PersonServiceImpl implements PersonService {

	@Autowired
	private PersonDAO personDAO;

	public Person findById(Long id) {
		return personDAO.findById(id);
	}

	public List<Person> findAll() {
		return personDAO.findAll();
	}

	public List<Person> findAll(int startIndex, int fetchSize) {
		return personDAO.findAll(startIndex, fetchSize);
	}

	public void create(Person entity) {
		personDAO.create(entity);
	}

	public void update(Person entity) {
		personDAO.update(entity);
	}

	public void delete(Long id) {
		personDAO.delete(id);
	}

}
