
package com.ajax.controller;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@WebServlet("*.ajax")
public class AjaxController extends HttpServlet {
   private static final long serialVersionUID = 1L;

  
    public AjaxController() {
        // TODO Auto-generated constructor stub
    }

   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      doAction(request, response);
   }

   
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      doAction(request, response);
   }

protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
   //�ѱ�ó��
      
      request.setCharacterEncoding("utf-8");
   
   
      String uri = request.getRequestURI();
      String conpath = request.getContextPath();
      
      String command = uri.substring(conpath.length());
      
      System.out.println(command);
      if(command.equals("/test.ajax")) {
         
         String id = request.getParameter("id");
         String pw = request.getParameter("pw");
         System.out.println(id);
         System.out.println(pw);
         
         System.out.println("�����....");
         
         //��û���� ������ ���ڿ��� ���·� ��ȯ
         response.setCharacterEncoding("utf-8");
         response.setContentType("text/html");
         PrintWriter out = response.getWriter();
         out.println("��ȯ�� ������");
      }else if(command.equals("/list.ajax")) {
    	  String num = request.getParameter("num");
    	  System.out.println("���޵� ��ȣ:"+num);
    	  
    	  //1. JSON-simple ���̺귯�� �߰�
    	  //JSONObject - �ڹ��� ���� ���̽� �������� ��ȯ
    	  
//    	  JSONObject obj = new JSONObject();
//    	  obj.put("name","ȫ�浿");
//    	  obj.put("age","30");
//    	  
//    	  System.out.println(obj.toJSONString());
//    	  response.setCharacterEncoding("utf-8");
//    	  response.setContentType("application/json");
//    	  PrintWriter out = response.getWriter();
//    	  out.println(obj.toString());
    	  
    	  
    	  //JSONArray - �ڹ��� list�� �ڹٽ�ũ��Ʈ�� �迭 �������� ��ȯ
    	  JSONArray list=  new JSONArray();
    	  
    	  for(int i =1;i<=10;i++) {
    		JSONObject obj = new JSONObject();
    		obj.put("writer","�۾��� :"+i);
    		obj.put("title","���� :"+i);
    		obj.put("content","���� :"+i);
    		
    		list.add(obj); //����Ʈ�� JSON�� �ִ´�.
    		
    	  }
    	  response.setCharacterEncoding("utf-8");
    	  response.setContentType("application/json");
    	  PrintWriter out = response.getWriter();
    	  out.println(list.toString());//����
    	  
      }
   }
}