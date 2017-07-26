package User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public MemberDAO(){
		try{
			String dbURL = "jdbc:mysql://localhost:3306/mytest";
			String dbID ="root";
			String dbPassword = "3355253a";
			// sql 드라이버를 찾을 수 있도록 한다.mysql에 접속할 수 있도록 도와주는 역할, 추가 해줘야한다.
			Class.forName("com.mysql.jdbc.Driver");
			//DB를 연결하는 메소드
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPW){
		 String SQL = "SELECT userPW FROM user WHERE userID = ?";
		 try{
			 pstmt = conn.prepareStatement(SQL);
			 pstmt.setString(1, userID); 
			 rs = pstmt.executeQuery();
			 if(rs.next()){
				 if(rs.getString(1).equals(userPW)){
					 return 1;// 로그인 성공
				 } else 
					 return 0; // 비밀번호 다름
			 }
			 return -1; // 아이디 없음
		 } catch(Exception e){
			 e.printStackTrace();
		 }
		 return -2; //DB 오류
	}
	
	public int join(Member member){
		String SQL = "INSERT INTO user VALUES(?,?,?,?,?,?,?)";
		
		try{
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, member.getUserID());
			pstmt.setString(2, member.getUserPW());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getNickname());
			pstmt.setString(5, member.getPhone());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getGender());
			
			return pstmt.executeUpdate();
		} catch(Exception e){
			e.printStackTrace();
		}
		return -1; //DB 오류
	}
}
