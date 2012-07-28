package com.examples.projects.mvc.service.interfaces;

import java.util.List;

import com.examples.projects.domain.Person;

// Don't use this approach until ContactService approach breaks. See
// interface and implementation of ContactService first
public interface PersonService {
	Person findById(Long id);

	List<Person> findAll();

	List<Person> findAll(int startIndex, int fetchSize);

	void create(Person entity);

	void update(Person entity);

	void delete(Long id);
}
