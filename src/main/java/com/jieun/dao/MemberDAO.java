package com.jieun.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.jieun.dto.MemberVO;


public class MemberDAO {
	public MemberDAO() {}
	
	private static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	Connection conn = null;
	
	//커넥션풀
	public Connection getConnection() throws Exception{
		
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource) envContext.lookup("jdbc/estoreDB");

		Connection conn = ds.getConnection();
		return conn;
	}
	
	//사용자 인증시 사용하는 메소드
	//로그인
	//member table에서 해당 정보가 존재하면 1 암호가 다르면 0 존재하지 않으면 -1
	public int userCheck(String userid, String pwd) {
		int result=-1;
		String sql = "select pwd from member where userid=?"; //table에서 pwd 가져옴
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("pwd")!=null && rs.getString("pwd").equals(pwd)){
					result = 1;
				}else {
					result =0;
				}
			}else {
				result= -1;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	//아이디로 회원정보를 가져오는 메소드
	//member table에서 해당 정보(아이디)를 가진 회원정보를 가져온다
	public MemberVO getMember(String userid) {
		MemberVO mVo = null;
		String sql = "select * from member where userid=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mVo = new MemberVO();
				mVo.setUsername(rs.getString("username"));
				mVo.setUserid(rs.getString("userid"));
				mVo.setPwd(rs.getString("pwd"));
				mVo.setEmail(rs.getString("email"));
				mVo.setPhone(rs.getString("phone"));
				mVo.setAdmin(rs.getInt("admin"));
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
			
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
				
			}catch(Exception e) {
				e.printStackTrace();
				
			}
			
		}
		
		return mVo;
	}
	
	//회원가입 아이디중복체크 메소드 해당아이디가 있으면(중복)1 없으면-1
	public int confirmID(String userid) {
		int result=-1;
		String sql ="select userid from member where userid=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result=1;
			}else {
				result=-1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		return result;
	}
	
	//회원정보를 DB에 추가하기 위한 메소드
	//매개변수로 받은 VO객체를 member table에 insert
	public int insertMember(MemberVO mVo) {
		int result=-1;
		String sql="insert into member values(?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mVo.getUsername());
			pstmt.setString(2, mVo.getUserid());
			pstmt.setString(3, mVo.getPwd());
			pstmt.setString(4, mVo.getEmail());
			pstmt.setString(5, mVo.getPhone());
			pstmt.setInt(6, mVo.getAdmin());
			result=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	//회원정보를 수정하기 위한 메소드
	//매개변수로 받은 VO객체의 userid로 member table에서 검색
	//VO객체에 저장된 정보를 불러오고, 회원정보를 수정한다
	public int updateMember(MemberVO mVo) {
		int result=-1;
		String sql="update member set pwd=?,email=?,"+"phone=?,admin=? where userid=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mVo.getPwd());
			pstmt.setString(2, mVo.getEmail());
			pstmt.setString(3, mVo.getPhone());
			pstmt.setInt(4, mVo.getAdmin());
			pstmt.setString(5, mVo.getUserid());
			
			result=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
}
