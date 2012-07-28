package com.examples.projects.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.examples.projects.domain.Person;
import com.examples.projects.mvc.service.interfaces.PersonService;

@Controller
@RequestMapping("/persons/*")
public class PersonController {

	@Autowired
	private PersonService personService;

	@RequestMapping
	public String list(Model model) {
		model.addAttribute("personList", personService.findAll());

		return "persons/list";
	}

	@RequestMapping("/add")
	public String add(Model model) {
		model.addAttribute("person", new Person());

		return "persons/add";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(@ModelAttribute("person") Person person) {

		personService.create(person);

		return "redirect:/persons/";
	}

	@RequestMapping("/edit/{id}")
	public String edit(@PathVariable("id") Long id, Model model) {
		Person person = personService.findById(id);

		model.addAttribute("person", person);

		return "persons/edit";
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
	public String edit(@PathVariable("id") Long id,
			@ModelAttribute("person") Person person) {	

		personService.update(person);

		return "redirect:/persons/";
	}

	@RequestMapping("/view/{id}")
	public String view(@PathVariable("id") Long id, Model model) {
		Person person = personService.findById(id);

		model.addAttribute("person", person);

		return "persons/view";
	}

	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		personService.delete(id);

		return "redirect:/persons/";
	}

}
