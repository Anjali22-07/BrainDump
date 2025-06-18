package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class SaveNoteServlet
 */
public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SaveNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//fetching the value from form
		try 
		{
			//will fetch title and content from form
			
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			
			//Creating the object of note
			Note note= new Note(title, content, new Date());
			
               //hibernate: saving the data in the table without creating the dao class
			
				Session s=FactoryProvider.getFactory().openSession();
				
				s.save(note);
				Transaction tx= s.beginTransaction();
				tx.commit();
				
				s.close();
				
				response.setContentType("text/html");
				PrintWriter out= response.getWriter();
				out.println("<h1 style='text-align:center;'> Notes added Successfully!</h1>");
				out.println("<h1 style='text-align:center;'><a href='ShowNotes.jsp'>View all notes</a>");
				
				
			
			
		} catch(Exception e) {
			e.printStackTrace();		}
	}

}
