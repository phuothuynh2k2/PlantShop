package se160205.servlet;

import se160205.dao.OrderDAO;
import se160205.dto.Account;
import se160205.dto.Order;
import se160205.utils.DateUtils;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Huynh Van Phuot
 */
public class ViewAllOrders extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession(false);

        String filter = request.getParameter("filter");
        String dateFrom = request.getParameter("dateFrom");
        String dateTo = request.getParameter("dateTo");

        System.out.println(dateFrom + " - " + dateTo);
        List<Order> listOrders = null;

        int status = 0;

        if ("processing".equals(filter)) {
            status = 1;
        } else if ("completed".equals(filter)) {
            status = 2;
        } else if ("canceled".equals(filter)) {
            status = 3;
        }

        Account loginedAccount = (Account) session.getAttribute("loginedUser");

        if ((dateFrom != null && !dateFrom.isEmpty()) && (dateTo != null && !dateTo.isEmpty())) {

            Date dFrom = new Date(DateUtils.parse(dateFrom).getTime());
            Date dTo = new Date(DateUtils.parse(dateTo).getTime());

            if (dFrom.compareTo(dTo) <= 0) {
                listOrders = OrderDAO.getOrders(loginedAccount.getId(), status, dFrom, dTo);
                request.setAttribute("dateFrom", dateFrom);
                request.setAttribute("dateTo", dateTo);
            }

        } else {
            listOrders = OrderDAO.getOrders(loginedAccount.getId());
        }

        request.setAttribute("listOrders", listOrders);
        request.setAttribute("status", status);

        request.getRequestDispatcher("./views/user/orders.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
