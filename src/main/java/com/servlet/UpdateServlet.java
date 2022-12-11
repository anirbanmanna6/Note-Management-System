package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entity.Note;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class UpdateServlet
 */
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			System.out.println("Inside Update Servlet");
			int noteId=Integer.parseInt(request.getParameter("note_id"));
			String title= request.getParameter("title");
			System.out.println(title);
			String content= request.getParameter("content");
			Session session = FactoryProvider.getFactory().openSession();
			
			Transaction tx = session.beginTransaction();
			
			Note note = session.get(Note.class, noteId);
			
			
			note.setTitle(title);
			note.setContent(content);
			session.update(note);
			tx.commit();
			session.close();
			
			//output to the browser
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<h1 style='text-align:center;'>Note updated successfully</h1>");
			out.println("<h1 style='text-align:center'><a href='showNote.jsp'>View Notes</a><h1>");
		}
		catch(Exception e)
		{
			e.printStackTrace();
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<h1 style='text-align:center;'>Note updation Failed !</h1>");
			out.println("<h1 style='text-align:center'><a href='addNote.jsp'>Try to add again</a><h1>");
		}
	}

}
