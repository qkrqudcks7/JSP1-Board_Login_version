package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	Connection c;
	PreparedStatement p;
	ResultSet r;
	
	public void getC() {
		try {
			Context i=new InitialContext();
			Context e=(Context) i.lookup("java:comp/env");
			DataSource ds=(DataSource) e.lookup("jdbc/pool");
			c=ds.getConnection();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	public int login(String id,String password) {
		getC();
		try {
			String sql="select password from u where id=?";
			p=c.prepareStatement(sql);
			p.setString(1, id);
			r=p.executeQuery();
			if(r.next()) {
				if(r.getString(1).equals(password)) {
					return 1;
				}
				else {
					return 0;
				}
			}
			return -1;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	public void insertUser(UserBean bean) {
		getC();
		try {
			String sql="insert into u values(?,?,?,?,?)";
			p=c.prepareStatement(sql);
			p.setString(1, bean.getId());
			p.setString(2, bean.getPassword());
			p.setString(3, bean.getName());
			p.setInt(4, bean.getPhone());
			p.setString(5, bean.getEmail());
			p.executeUpdate();
			c.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	public Vector<BoardBean> getAll(){
		Vector<BoardBean> v = new Vector<>();
		getC();
		try {
			String sql="select * from b order by ref desc, re_step asc";
			p=c.prepareStatement(sql);
			r=p.executeQuery();
			while(r.next()) {
				BoardBean bean= new BoardBean();
				bean.setNum(r.getInt(1));
				bean.setId(r.getString(2));
				bean.setName(r.getString(3));
				bean.setSubject(r.getString(4));
				bean.setReg_date(r.getDate(5).toString());
				bean.setRef(r.getInt(6));
				bean.setRe_step(r.getInt(7));
				bean.setRe_level(r.getInt(8));
				bean.setReadcount(r.getInt(9));
				bean.setContent(r.getString(10));
				v.add(bean);
			}
			c.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	public void insertBoard(BoardBean bean) {
		getC();
		int ref=0;
		int re_step=1;
		int re_level=1;
		String id= bean.getId();
		
		try {
			String refsql="select max(ref) from b";
			p=c.prepareStatement(refsql);
			r=p.executeQuery();
			if(r.next()) {
				ref=r.getInt(1)+1;
			}
			
			String sql="insert into b values(board_seq.NEXTVAL,?,?,?,sysdate,?,?,?,0,?)";
			p=c.prepareStatement(sql);
			p.setString(1, id);
			p.setString(2, bean.getName());
			p.setString(3, bean.getSubject());
			p.setInt(4, ref);
			p.setInt(5, re_step);
			p.setInt(6, re_level);
			p.setString(7, bean.getContent());
			p.executeUpdate();
			c.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	public BoardBean getOneBoard(int num) {
		BoardBean bean= new BoardBean();
		getC();
		try {
			String readsql="update b set readcount=readcount+1 where num=?";
			p=c.prepareStatement(readsql);
			p.setInt(1, num);
			p.executeUpdate();
			
			String sql="select * from b where num=?";
			p=c.prepareStatement(sql);
			p.setInt(1, num);
			r=p.executeQuery();
			if(r.next()) {
				bean.setNum(r.getInt(1));
				bean.setId(r.getString(2));
				bean.setName(r.getString(3));
				bean.setSubject(r.getString(4));
				bean.setReg_date(r.getDate(5).toString());
				bean.setRef(r.getInt(6));
				bean.setRe_step(r.getInt(7));
				bean.setRe_level(r.getInt(8));
				bean.setReadcount(r.getInt(9));
				bean.setContent(r.getString(10));
			}
			c.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	public void reWriteBoard(BoardBean bean) {
		
		int ref=bean.getRef();
		int re_step=bean.getRe_step();
		int re_level=bean.getRe_level();
		String id= bean.getId();
		getC();
		try {
			String levelsql="update b set re_level=re_level+1 where ref=? and re_level>?";
			p=c.prepareStatement(levelsql);
			p.setInt(1, ref);
			p.setInt(2, re_level);
			p.executeUpdate();
			
			String sql="insert into b values(board_seq.NEXTVAL,?,?,?,sysdate,?,?,?,0,?)";
			p=c.prepareStatement(sql);
			p.setString(1, id);
			p.setString(2, bean.getName());
			p.setString(3, bean.getSubject());
			p.setInt(4, ref);
			p.setInt(5, re_step+1);
			p.setInt(6, re_level+1);
			p.setString(7, bean.getContent());
			p.executeUpdate();
			c.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	public BoardBean getOneUpdate(int num) {
		BoardBean bean= new BoardBean();
		getC();
		try {
			
			String sql="select * from b where num=?";
			p=c.prepareStatement(sql);
			p.setInt(1, num);
			r=p.executeQuery();
			if(r.next()) {
				bean.setNum(r.getInt(1));
				bean.setId(r.getString(2));
				bean.setName(r.getString(3));
				bean.setSubject(r.getString(4));
				bean.setReg_date(r.getDate(5).toString());
				bean.setRef(r.getInt(6));
				bean.setRe_step(r.getInt(7));
				bean.setRe_level(r.getInt(8));
				bean.setReadcount(r.getInt(9));
				bean.setContent(r.getString(10));
			}
			c.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	public void updateBoard(BoardBean bean) {
		getC();
		
		try {
			String sql="update b set subject=?,content=? where num=?";
			p=c.prepareStatement(sql);
			p.setString(1, bean.getSubject());
			p.setString(2, bean.getContent());
			p.setInt(3, bean.getNum());
			p.executeUpdate();
			c.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteBoard(int num) {
		getC();
		
		try {
			String sql="delete from b where num=?";
			p=c.prepareStatement(sql);
			p.setInt(1, num);
			p.executeUpdate();
			c.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
