package com.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
	
	public static SessionFactory sif;
	
	//returns object of implementation of session factory sif
	//making the method static so that we don't need object to call this function
	public static SessionFactory getFactory() {
		
		//The goal is to create the SessionFactory only once in your application.
		//SessionFactory is a heavyweight object, so creating it multiple times can lead to performance issues.
		if(sif==null) {
			
			sif= new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			
		}
		return sif;
	}

	public void closefactory() {
		if(sif.isOpen()) {
			  
			  sif.close();
			
		}
	}
}
