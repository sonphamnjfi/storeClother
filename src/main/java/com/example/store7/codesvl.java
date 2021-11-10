package com.example.store7;

import DAO.CodeDao;
import DAO.accDao;
import entity.account;
import entity.code;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@WebServlet(value = "/")
public class codesvl extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private CodeDao cd;
    private accDao ad;

    public codesvl() {
        this.cd = new CodeDao();
        this.ad = new accDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
        try {
            switch(action) {
            case "/new" :
                formnew(request, response);
                break;
            case "/loginacc":
                loginacc(request,response);
            case "/list" :
                listcode(request, response);
                break;
            case "/newacc" :
                formnewacc(request, response);
                break;
            case "/addacc" :
                signup(request, response);
                break;
            case "/newpass" :
                formnewpass(request, response);
                break;
            case "/editpass":
                editpass(request, response);
                break;
            case "/logout" :
                logout(request, response);
                break;
            case "/add" :
                addCode(request, response);
                break;
            case "/edit" :
                formedit(request, response);
                break;
            case "/update" :
                updateCode(request, response);
                break;
            case "/delete":
                delCode(request, response);
                break;
            default :
//                listcode(request, response);
                login(request, response);
                break;
            }
        }catch(Exception e) {}
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    private void loginacc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String us = request.getParameter("us");
        String pass = request.getParameter("pass");
        account ac = ad.login(us, pass);
        if (ac == null) {
            request.setAttribute("mess","nhap sai pass hoac username");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else if(ac.getIdsell() >0){
            HttpSession ss = request.getSession();
            ss.setAttribute("us" , us);
            ss.setAttribute("pass" , pass);
            ss.setMaxInactiveInterval(1000);
            response.sendRedirect("list");
        }else {
            request.setAttribute("mess","ban khong phai nhan vien");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    private void formnewpass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("editpass.jsp").forward(request, response);
    }

    private void formnewacc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    }

    private void signup(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String us = request.getParameter("us");
        String pass = request.getParameter("pass");
        String pass1 = request.getParameter("pass1");
        account ac = ad.check(us);
        if(!pass.equals(pass1)) {
            request.setAttribute("mess","2 pass khac nhau");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }else if(ac != null ) {
            request.setAttribute("mess","username da ton tai");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else {
            ad.signup(us, pass);
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
    }

    private void editpass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String us = request.getParameter("us");
        String pass = request.getParameter("pass");
        String newpass = request.getParameter("newpass");
        String newpass1 = request.getParameter("newpass1");
        account ac = ad.login(us, pass);
        if (ac == null){
            request.setAttribute("mess","nhap sai pass");
            request.getRequestDispatcher("editpass.jsp").forward(request, response);
        }else if(!newpass.equals(newpass1)) {
            request.setAttribute("mess","2 pass moi khac nhau");
            request.getRequestDispatcher("editpass.jsp").forward(request, response);
        }else{
            ad.resetpass(us, newpass);
            response.sendRedirect("list");
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    private void delCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        cd.delete(id);
        response.sendRedirect("list");
    }

    private void updateCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("idcode");
        String name = request.getParameter("name");
        Long total = Long.parseLong(request.getParameter("total"));
        Long dis = Long.parseLong(request.getParameter("dis"));
        Date begin = Date.valueOf(request.getParameter("begin"));
        Date end = Date.valueOf(request.getParameter("end"));
        //set code to database
        code code1 = new code(id, name, total, dis, begin,end);
        cd.update(code1);
        response.sendRedirect("list");
    }

    private void formedit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        code code1 = cd.getcode(id);
        request.setAttribute("code", code1);
        request.getRequestDispatcher("editcode.jsp").forward(request, response);
    }

    private void addCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("idcode");
        String name = request.getParameter("name");
        Long total = Long.parseLong(request.getParameter("total"));
        Long dis = Long.parseLong(request.getParameter("dis"));
        Date begin = Date.valueOf(request.getParameter("begin"));
        Date end = Date.valueOf(request.getParameter("end"));
        //set code to database
        code code1 = new code(id, name, total, dis, begin,end);
        cd.add(code1);
        response.sendRedirect("list");
    }

    private void listcode(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<code> code1 = new ArrayList<code>();
        code1 = cd.getall();
        request.setAttribute("listcode", code1);
        request.getRequestDispatcher("formlist.jsp").forward(request, response);
    }

    private void formnew(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("newcode.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
