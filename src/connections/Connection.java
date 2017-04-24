package connections;

import java.sql.DriverManager;
import java.sql.SQLException;

import javax.tools.JavaCompiler;

import org.apache.commons.dbutils.DbUtils;

public class Connection {
	public static java.sql.Connection getConnection() throws SQLException{
		String url = "jdbc:mysql://debug.ocrosoft.com:3306/users?useUnicode=true&characterEncoding=utf8";
		String jdbcDriver = "com.mysql.jdbc.Driver";
		String user = "root";
		String pass = "mysqlForASPandJSP";
		DbUtils.loadDriver(jdbcDriver);
		return DriverManager.getConnection(url, user, pass);
	}
}
