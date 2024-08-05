package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet({"/student", "/data", "/update", "/delete"})
public class StudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(StudentServlet.class.getName());

    private static final String JDBC_URL = "jdbc:postgresql://localhost:5432/uni";
    private static final String JDBC_USER = "postgres";
    private static final String JDBC_PASSWORD = "000000";

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new ServletException("PostgreSQL JDBC Driver not found", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();
        if ("/data".equals(path)) {
            List<Map<String, String>> students = new ArrayList<>();
            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
                 PreparedStatement stmt = conn.prepareStatement("SELECT * FROM student");
                 ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    Map<String, String> student = new HashMap<>();
                    student.put("name", rs.getString("name"));
                    student.put("address", rs.getString("address"));
                    students.add(student);
                }
            } catch (SQLException e) {
                logger.log(Level.SEVERE, "Error retrieving students data", e);
                throw new ServletException("Error retrieving students data", e);
            }
            request.setAttribute("students", students);
            request.getRequestDispatcher("data.jsp").forward(request, response);
        } else {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<a href='index.jsp'>Back to form</a>");
            out.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();

        if ("/student".equals(path)) {
            String name = request.getParameter("name");
            String address = request.getParameter("address");

            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
                 PreparedStatement stmt = conn.prepareStatement("INSERT INTO student (name, address) VALUES (?, ?)")) {

                stmt.setString(1, name);
                stmt.setString(2, address);
                stmt.executeUpdate();

            } catch (SQLException e) {
                logger.log(Level.SEVERE, "Error inserting student", e);
                throw new ServletException("Error inserting student", e);
            }

            response.sendRedirect("index.jsp");
        } else if ("/update".equals(path)) {
            String oldName = request.getParameter("oldName");
            String name = request.getParameter("name");
            String address = request.getParameter("address");

            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
                 PreparedStatement stmt = conn.prepareStatement("UPDATE student SET name = ?, address = ? WHERE name = ?")) {

                stmt.setString(1, name);
                stmt.setString(2, address);
                stmt.setString(3, oldName);
                stmt.executeUpdate();

            } catch (SQLException e) {
                logger.log(Level.SEVERE, "Error updating student", e);
                throw new ServletException("Error updating student", e);
            }

            response.sendRedirect("data");
        } else if ("/delete".equals(path)) {
            String name = request.getParameter("name");

            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
                 PreparedStatement stmt = conn.prepareStatement("DELETE FROM student WHERE name = ?")) {

                stmt.setString(1, name);
                stmt.executeUpdate();

            } catch (SQLException e) {
                logger.log(Level.SEVERE, "Error deleting student", e);
                throw new ServletException("Error deleting student", e);
            }

            response.sendRedirect("data");
        }
    }
}
