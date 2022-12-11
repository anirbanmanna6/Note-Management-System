package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entity.Note;
import com.helper.FactoryProvider;

public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try {
			System.out.println("This is dosPost() method under SaveNoteServelet");
				
			Session session = FactoryProvider.getFactory().openSession();			
			Transaction tx = session.beginTransaction();
			
			String title = request.getParameter("title"); // should be same with the parameter 'name' in jsp
			String content = request.getParameter("content"); 
			Note note = new Note(0,title,content,LocalDate.now());
			
			session.save(note);			
			tx.commit();
			session.close();	
			FactoryProvider.closeFactory();
			
			//output to the browser
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<h1 style='text-align:center;'>Note added successfully</h1>");
			out.println("<h1 style='text-align:center'><a href='showNote.jsp'>View Notes</a><h1>");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<h1 style='text-align:center;'>Note Addition Failed !</h1>");
			out.println("<h1 style='text-align:center'><a href='addNote.jsp'>Try to add again</a><h1>");
		}
		
	}

}
