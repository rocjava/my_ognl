package com.ognl;

import java.util.LinkedList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;

import com.javabean.Person;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class OgnlAction extends ActionSupport {
	private static final long serialVersionUID=-1494290883433357310L;
	private List<Person> persons;
	
	public String execute() {
		ActionContext ac = ActionContext.getContext();
		
		ac.getApplication().put("msg", "application msg.");//put
		ac.getSession().put("msg", "session msg.");//put
		
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("msg", "request msg.");//setAttribute
		
		persons = new LinkedList<Person>();
		Person person1 = new Person();
		person1.setName("tom");
		person1.setAge(26);
		Person person2 = new Person();
		person2.setName("jay");
		person2.setAge(25);
		Person person3 = new Person();
		person3.setName("pop");
		person3.setAge(24);
		
		persons.add(person1);
		persons.add(person2);
		persons.add(person3);
		
		System.out.println(Math.abs(-78));
		
		return "success";
	}

	public List<Person> getPersons() {
		return persons;
	}

	public void setPersons(List<Person> persons) {
		this.persons = persons;
	}
	
}
