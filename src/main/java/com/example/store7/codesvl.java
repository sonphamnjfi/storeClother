package com.example.store7;

import DAO.accDao;
import DAO.addDao;
import DAO.cartDao;
import DAO.productDao;
import entity.acc;
import entity.addItem;
import entity.cart;
import entity.product;

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
    private accDao ad;
    private DAO.productDao pd;
    private DAO.addDao addDao;
    private DAO.cartDao cartDao;

    public codesvl() {
        this.ad = new accDao();
        this.pd = new productDao();
        this.addDao = new addDao();
        this.cartDao = new cartDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
        try {
            switch(action) {
            case "/loginacc":
                loginacc(request,response);
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
            case "/formeditacc":
                formeditacc(request, response);
                break;
            case "/editacc":
                editacc(request, response);
                break;
            case "/logout" :
                logout(request, response);
                break;
            case "/home" :
                home(request, response);
                break;
            case "/cart" :
                showCart(request, response);
                break;
            case "/addcart" :
                addCart(request, response);
                break;
            case "/product" :
                pd(request, response);
                break;
            default :
//                home(request, response);
                login(request, response);
                break;
            }
        }catch(Exception e) {}
    }

    private void pd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        product p = pd.getp(id);
        request.setAttribute("p", p);
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }

    private void addCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        int pid = Integer.parseInt(request.getParameter("id"));
        // kiem tra xem da co san pham trong gio hang chua
        addItem ai = addDao.check(username,pid);
        int amount = 1;
        // get gia san pham
        product p = pd.getp(String.valueOf(pid));
        long total =p.getPrice();

        // tang tien trong gio hang
        cart c = cartDao.check(username);
        if(c == null){
            c = new cart(username,total);
            cartDao.addc(c);
        }else {
            total += c.getTotal();
            c.setTotal(total);
            cartDao.update(c);
        }
        // tang so luong san pham
        if(ai== null){
            ai = new addItem(username,pid,amount);
            addDao.addi(ai);
        }else{
            amount += ai.getAmount();
            ai.setAmount(amount);
            addDao.update(ai);
        }
        response.sendRedirect("home");
    }

    private void formeditacc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("editacc.jsp").forward(request, response);
    }

    private void showCart(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        cart c = cartDao.check(username);
        long total;
        if (c == null) {
            total = 0;
        }else {
            total = c.getTotal();
        }
        HttpSession ss = request.getSession();
        ss.setAttribute("total", total);

    }

    private void editacc(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("us");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        acc newacc = new acc(username, password, name, phone, address);
        ad.update(newacc);
        response.sendRedirect("home");
    }

    private void home(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<product> listp = new ArrayList<product>();
        listp = pd.getProducts();
        request.setAttribute("listP", listp);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    private void loginacc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String us = request.getParameter("us");
        String pass = request.getParameter("pass");
        acc ac = ad.login(us, pass);
        if (ac == null) {
            request.setAttribute("mess","nhap sai pass hoac username");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            HttpSession ss = request.getSession();
            ss.setAttribute("ac" , ac);
            ss.setMaxInactiveInterval(1000);
            response.sendRedirect("home");
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
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String adress = request.getParameter("adress");
        acc b = new acc();
        b.setUsername(us);
        b.setAddress(adress);
        b.setPhone(phone);
        b.setName(name);
        acc ac = ad.check(us);
        if(!pass.equals(pass1)) {
            request.setAttribute("mess","2 pass khac nhau");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }else if(ac != null ) {
            request.setAttribute("mess","username da ton tai");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else {
            b.setPass(pass);
            ad.signup(b);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    private void editpass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String us = request.getParameter("us");
        String pass = request.getParameter("pass");
        String newpass = request.getParameter("newpass");
        String newpass1 = request.getParameter("newpass1");
        acc ac = ad.login(us, pass);
        if (ac == null){
            request.setAttribute("mess","nhap sai pass");
            request.getRequestDispatcher("editpass.jsp").forward(request, response);
        }else if(!newpass.equals(newpass1)) {
            request.setAttribute("mess","2 pass moi khac nhau");
            request.getRequestDispatcher("editpass.jsp").forward(request, response);
        }else{
            ad.resetpass(us, newpass);
            response.sendRedirect("home");
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
