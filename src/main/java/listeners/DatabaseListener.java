package listeners;

import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import oracle.jdbc.pool.OracleDataSource;


@WebListener
public class DatabaseListener implements ServletContextListener {

    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	
    public void contextInitialized(ServletContextEvent sce)  { 
         // create data source and place it in ServletContext as an attribute
    	ServletContext ctx = sce.getServletContext();
    	try {
			OracleDataSource ods = new OracleDataSource();
			ods.setUser("hr");
			ods.setPassword("hr");
			ods.setURL("jdbc:oracle:thin:@localhost:1521:xe");
			ctx.setAttribute("oracleDataSource", ods);
			System.out.println("created oracleDataSource succesfully");
		} catch (SQLException ex) {
			// TODO Auto-generated catch block
			System.out.println("Error :" + ex.getMessage());
			
		}
    	
    }
	
}
