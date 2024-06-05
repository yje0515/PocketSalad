package com.jieun.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jieun.dto.BoardVO;

import util.DBManager;

public class BoardDAO {
	private BoardDAO() {
	}

	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() { // �떛湲��넠 BoardDAO媛앹껜瑜� 由ы꽩(諛섑솚)
		return instance;
	}

	//湲��쓣 10媛쒖뵫 �몴�떆�뻽�쓣�븣(�럹�씠吏�瑜� 10�쑝濡� �굹�댋�쓣�븣) 理쒕��럹�씠吏�
	public int getMaxPage() {
		String sql = "SELECT count(*) AS count FROM board";//�럹�씠吏�
        int count = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs);
        }
        return (int) Math.ceil(count / 10) + 1; //珥� 寃뚯떆湲� �닔瑜� 10�쑝濡� �굹�늿 �썑(10�럹�씠吏��뵫 �몴�떆) 1�쓣 �뜑�븿(洹몃옒�빞 �썝�븯�뒗 媛믪씠 �굹�삩�떎)
	}

	public List<BoardVO> selectAllBoards(int pageNum) {
	    pageNum--; // 페이지 번호는 0부터 시작하도록 수정
	    String sql = "SELECT count(*) AS count FROM board";
	    ArrayList<BoardVO> list = new ArrayList<>();
	    int count = 0; // 총 게시글 수
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    try {
	        conn = DBManager.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            count = rs.getInt("count");
	        }
	        DBManager.close(null, pstmt, rs);

	        // 게시글을 날짜 기준으로 내림차순하여 가져오는 쿼리
	        sql = "SELECT * FROM board ORDER BY num DESC LIMIT ?, ?";
	        pstmt = conn.prepareStatement(sql);
	        
	        int start = pageNum * 10; // 페이지의 시작 인덱스 계산
	        pstmt.setInt(1, start); // LIMIT의 첫 번째 매개변수에 페이지의 시작 인덱스 설정
	        pstmt.setInt(2, 10); // 한 페이지에 표시될 게시글 수 설정
	        
	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	            BoardVO bVo = new BoardVO();
	            bVo.setNum(rs.getInt("num"));
	            bVo.setUsername(rs.getString("username"));
	            bVo.setEmail(rs.getString("email"));
	            bVo.setPass(rs.getString("pass"));
	            bVo.setTitle(rs.getString("title"));
	            bVo.setContent(rs.getString("content"));
	            bVo.setReadcount(rs.getInt("readcount"));
	            bVo.setWritedate(rs.getTimestamp("writedate"));
	            list.add(bVo);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        DBManager.close(conn, pstmt, rs);
	    }
	    return list;
	}

//	public List<BoardVO> selectAllBoards(int pageNum) {
//		pageNum--;
//        String sql = "SELECT count(*) AS count FROM board";
//        ArrayList<BoardVO> list = new ArrayList<>();
//        int count = 0;//珥덇린�솕
//        Connection conn = null;
//        PreparedStatement pstmt = null;
//        ResultSet rs = null;
//        try {
//            conn = DBManager.getConnection();
//            pstmt = conn.prepareStatement(sql);
//            rs = pstmt.executeQuery();
//            if (rs.next()) {
//                count = rs.getInt("count");
//            }
//            DBManager.close(conn, pstmt, rs);
//            
//            
//            sql = "SELECT * FROM board WHERE num <= ? AND num > ? ORDER BY num DESC";
//            conn = DBManager.getConnection();
//            pstmt = conn.prepareStatement(sql);
//            
//            pstmt.setInt(1, count - (pageNum * 10));
//            pstmt.setInt(2, count - (pageNum * 10) - 10);
//           
//            rs = pstmt.executeQuery();
//            while (rs.next()) {
//                BoardVO bVo = new BoardVO();
//                bVo.setNum(rs.getInt("num"));
//                bVo.setUsername(rs.getString("username"));
//                bVo.setEmail(rs.getString("email"));
//                bVo.setPass(rs.getString("pass"));
//                bVo.setTitle(rs.getString("title"));
//                bVo.setContent(rs.getString("content"));
//                bVo.setReadcount(rs.getInt("readcount"));
//                bVo.setWritedate(rs.getTimestamp("writedate"));
//                list.add(bVo);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            DBManager.close(conn, pstmt, rs);
//        }
//        return list;
//	}

	// CREATE INSERT �쟾�떖�씤�옄濡� 諛쏆� VO媛앹껜瑜� board table�뿉 �궫�엯�븯�뒗 硫붿냼�뱶
	public void insertBoard(BoardVO bVo) {
		String sql = "INSERT INTO board(username,email,pass,title,content) VALUES(?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bVo.getUsername());
			pstmt.setString(2, bVo.getEmail());
			pstmt.setString(3, bVo.getPass());
			pstmt.setString(4, bVo.getTitle());
			pstmt.setString(5, bVo.getContent());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace(); // 濡쒕뱺 濡쒓퉭 �봽�젅�엫�썙�겕瑜� �궗�슜�븯�뿬 濡쒓렇�뿉 湲곕줉
			throw new RuntimeException("湲� �옉�꽦 以묒뿉 �삤瑜섍� 諛쒖깮�뻽�뒿�땲�떎." + e);
		} finally {
			DBManager.close(conn, pstmt); // pstmt�뒗 stmt瑜� �긽�냽諛쏆� �븷�씪 �꽔�쓣 �닔 �엳援�
		}
	}

	// 寃뚯떆湲� �긽�꽭蹂닿린瑜� �븷 �븣留덈떎 議고쉶�닔瑜� 利앷��떆�궓�떎. boardView /readcount /num
	public void updateReadCount(String num) {
		String sql = "UPDATE board SET readcount = readcount+1 WHERE num=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	// READ 寃뚯떆湲� 踰덊샇濡� �빐�떦 �뻾�쓽 �젙蹂대�� BoardVO媛앹껜濡� �뼸�뼱以��떎
	public BoardVO selectOneBoardByNum(String num) {
		String sql = "SELECT * FROM board WHERE num = ?";
		BoardVO bVo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bVo = new BoardVO();
				bVo.setNum(rs.getInt("num"));
				bVo.setUsername(rs.getString("username"));
				bVo.setEmail(rs.getString("email"));
				bVo.setPass(rs.getString("pass"));
				bVo.setTitle(rs.getString("title"));
				bVo.setContent(rs.getString("content"));

				bVo.setWritedate(rs.getTimestamp("writedate"));
				bVo.setReadcount(rs.getInt("readcount"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return bVo;

	}

	// UPDATE 留ㅺ컻蹂��닔濡� 諛쏆� VO媛앹껜 �궡�쓽 肄뷀듃�쑝濡� board table�뿉�꽌 �빐�옣 �뻾�쓽 寃뚯떆湲� �젙蹂대�� �닔�젙�븳�떎.
	public void updateBoard(BoardVO bVo) {
		String sql = "UPDATE board SET username=?, email=?, pass=?, title=?, content=? WHERE num=?"; // SQL臾� 肄ㅻ쭏 �솗�씤!
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bVo.getUsername());
			pstmt.setString(2, bVo.getEmail());
			pstmt.setString(3, bVo.getPass());
			pstmt.setString(4, bVo.getTitle());
			pstmt.setString(5, bVo.getContent());
			pstmt.setInt(6, bVo.getNum());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	// board table�뿉�꽌 寃뚯떆湲�踰덊샇�� 鍮꾨�踰덊샇媛� �씪移섑븯硫� 寃뚯떆湲��쓣 BoardVO媛앹껜濡� 由ы꽩(諛섑솚)�븳�떎.
	public BoardVO checkPassWord(String pass, String num) {
		String sql = "SELECT * FROM board WHERE pass=? and num=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVO bVo = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pass);
			pstmt.setString(2, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				bVo = new BoardVO();
				bVo.setNum(rs.getInt("num"));
				bVo.setUsername(rs.getString("username"));
				bVo.setEmail(rs.getString("email"));
				bVo.setPass(rs.getString("pass"));
				bVo.setTitle(rs.getString("title"));
				bVo.setContent(rs.getString("content"));
				bVo.setReadcount(rs.getInt("readcount"));
				bVo.setWritedate(rs.getTimestamp("writedate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return bVo;
	}

	// 寃뚯떆湲� 踰덊샇�뿉 �빐�떦�븯�뒗 �뻾�쓽 �젙蹂대�� �궘�젣�븳�떎
	public void deleteBoard(String num) {
		String sql = "DELETE FROM board WHERE num=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}


}
