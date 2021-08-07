package filter;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.*;


@WebFilter(filterName = "jspFilter", value = "*.jsp")
public class JspFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletResponse response1 = (HttpServletResponse) response;
        try {
            response1.sendRedirect("error");
        }catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
