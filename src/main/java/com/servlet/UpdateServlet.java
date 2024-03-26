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

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
			PrintWriter pw = response.getWriter();
			response.setContentType("text/html");
			
			int id = Integer.parseInt(request.getParameter("id").trim());
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			Session s = FactoryProvider.getFactory().openSession();
			
			NoteTaker note = s.get(NoteTaker.class, id);
			note.setTitle(title);
			note.setContent(content);
			note.setAdddDate(new Date());
			Transaction tx = s.beginTransaction();
			s.save(note);
			tx.commit();
			s.close();
			response.sendRedirect("all_notes.jsp");
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
