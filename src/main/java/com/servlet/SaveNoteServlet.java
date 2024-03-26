package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.NoteTaker;
import com.helper.FactoryProvider;

//@WebServlet("/SaveNoteServlet")
public class SaveNoteServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
			PrintWriter pw = response.getWriter();
			response.setContentType("text/html");
			
			//title,content fetch
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			NoteTaker note = new NoteTaker(title ,content ,new Date());
			
			// hibernate save()
			Session session = FactoryProvider.getFactory().openSession();
			Transaction tx = session.beginTransaction();
			session.save(note);
			tx.commit();
			session.close();
			pw.println("<h1 style ='text-align:center;'>Note is added successfully</h1>");
			pw.println("<h2 style ='text-align:center;'><a href='all_notes.jsp'>View all notes</a></h2>");
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
