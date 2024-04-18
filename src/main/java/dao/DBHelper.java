package dao;
import java.sql.*;
import java.util.*;
import java.io.FileReader;



public class DBHelper {
	public static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = null;
		
		String dbUrl = "jdbc:oracle:thin:@rash4x11r2mc7d9k_high?TNS_ADMIN=C:/oracle_wallet/Wallet_RASH4X11R2MC7D9K";
		String dbUser = "admin";
		
		//보안이슈로 로컬에서 설정파일 로드 (소스코드에서 비밀번호 노출 X )
		FileReader fr = new FileReader("c:\\dev\\auth\\mariadb.properties");
		Properties prop = new Properties();
		prop.load(fr);
		String dbPw = prop.getProperty("dbPw");
		
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
		
		return conn;		
	}
	
	public static void main(String[] args) throws Exception{
		//Connection conn = new DBHelper().getConnection();
		//System.out.println(conn);
	}
}
