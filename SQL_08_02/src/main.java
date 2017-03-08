import java.sql.*;

import com.mysql.jdbc.DatabaseMetaData;

public class main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String pilote= "com.mysql.jdbc.Driver";
		
		try {
			Class.forName(pilote);
			
		}
		catch (ClassNotFoundException e){
			System.out.println("erreur pendant le chargement du pilote");
		}
		Connection cnxDirect=null;
		try{
			cnxDirect= DriverManager.getConnection("jdbc:mysql://localhost/clicom?allowMultiQueries=true","root","");
		}catch (SQLException e){
			System.out.println("erreur pendant la connection");
		}
		
//		try {
//			cnxDirect.close();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		try {
//			if (cnxDirect.isClosed()){
//				System.out.println("C'est fermé");
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		try {
			if (cnxDirect.isValid(0)){
				System.out.println("C'est bon");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			cnxDirect.setReadOnly(true);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if (cnxDirect.isReadOnly()){
				System.out.println("C'est readOnly");
			}else{
				System.out.println("C'est pas readOnly");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		AfficheWarning(cnxDirect);
		infoBase(cnxDirect);
	}
	
	public static void AfficheWarning(Connection cnx){
		String mess ="";
		try {
			SQLWarning warning = cnx.getWarnings();
			while (warning != null) {
				 System.out.println("SQLState: " + warning.getSQLState());
			     System.out.println("Message:  " + warning.getMessage());
			     System.out.println("Vendor:   " + warning.getErrorCode());
			     System.out.println("");
			     warning.getNextWarning();
			}
			cnx.clearWarnings();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void infoBase(Connection cnx){
		try {
			java.sql.DatabaseMetaData dmd = cnx.getMetaData();
			System.out.println("Type : "+ dmd.getDatabaseProductName());
			System.out.println("Version : "+ dmd.getDatabaseProductVersion());
			System.out.println("nom pilote : "+ dmd.getDriverName());
			System.out.println("Nom utilisateur : "+ dmd.getUserName());
			System.out.println("url de connection : "+dmd.getURL());
			ResultSet resul = dmd.getTables(null, null, "%", null);
			while (resul.next()) {
				  System.out.println(resul.getString(3));
				}
//			resul.close();
			ResultSet rs = dmd.getProcedures(cnx.getCatalog(),"%", "%");
			
			ResultSetMetaData rsmd = rs.getMetaData();
			    int numCols = rsmd.getColumnCount();
			    for (int i = 1; i <= numCols; i++) {
			      if (i > 1)
			        System.out.print(", ");
			      System.out.print(rsmd.getColumnLabel(i));
			    }
			    System.out.println("");
			    
//			    conn.close();
			 
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} 
		
		
		try {
			System.out.println(cnx.getCatalog());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
