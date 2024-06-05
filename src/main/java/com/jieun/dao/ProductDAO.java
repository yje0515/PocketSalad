package com.jieun.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jieun.dto.ProductVO;

import util.DBManager;

public class ProductDAO {
	// 싱글톤패턴
	public ProductDAO() {
	}

	public static ProductDAO instance = new ProductDAO();

	public static ProductDAO getInstance() {
		return instance;
	}

	// READ all
	public List<ProductVO> selectAllProducts() {
		// 최근 등록한 상품 먼저 출력하기 내림차순
		String sql = "SELECT * FROM product ORDER BY code DESC";
		List<ProductVO> list = new ArrayList<>(); // 객체를 담을 배열을 생성

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ProductVO pVo = new ProductVO();
				pVo.setCode(rs.getInt("code"));
				pVo.setProductname(rs.getString("productname"));
				pVo.setPrice(rs.getInt("price"));
				pVo.setPictureUrl(rs.getString("pictureUrl"));
				pVo.setDescription(rs.getString("description"));
				list.add(pVo); // 생성된 객체를 ArrayList에 추가
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}

	// CREATE 상품등록
	public void insertProduct(ProductVO pVo) {
		String sql = "INSERT INTO product(productname,price,pictureurl,description) values(?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pVo.getProductname());
			pstmt.setInt(2, pVo.getPrice());
			pstmt.setString(3, pVo.getPictureUrl());
			pstmt.setString(4, pVo.getDescription());
			pstmt.executeUpdate(); // 실행

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}

	}

	// READ by code
	public ProductVO selectProductByCode(String code) {
		String sql = "SELECT * FROM product WHERE code=?";
		ProductVO pVo = null;

		try {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, code);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					pVo = new ProductVO();
					pVo.setCode(rs.getInt("code"));
					pVo.setProductname(rs.getString("productname"));
					pVo.setPrice(rs.getInt("price"));
					pVo.setPictureUrl(rs.getString("pictureUrl"));
					pVo.setDescription(rs.getString("description"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {

				DBManager.close(conn, pstmt, rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pVo;
	}

	// UPDATE 상품 수정을 위한 메소드
	public void updateProduct(ProductVO pVo) {
		String sql = "UPDATE product SET productname=?, price=?, pictureurl=?, description=? WHERE code=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pVo.getProductname());
			pstmt.setInt(2, pVo.getPrice());
			pstmt.setString(3, pVo.getPictureUrl());
			pstmt.setString(4, pVo.getDescription());
			pstmt.setInt(5, pVo.getCode());
			pstmt.executeUpdate(); // 쿼리문 실행

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}

	}

		//DELETE 상품 삭제를 위한 메소드
	public void deleteProduct(String code) {
		String sql ="DELETE FROM product WHERE code=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, code);
			pstmt.executeUpdate(); //쿼리문 실행
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}

	}

}
