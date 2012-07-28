package com.examples.projects.mvc.dao;

import org.springframework.stereotype.Repository;

import com.examples.projects.domain.Person;
import com.examples.projects.mvc.dao.interfaces.PersonDAO;

@Repository
public class PersonDAOImpl extends GenericDAOImpl<Person, Long> implements
		PersonDAO {

}
