package kojh.spring.board;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kojh.db.beans.BoardBean;
import kojh.spring.mappers.BoardMapper;

@Component
public class BoardService
{
	@Autowired
	private BoardMapper boardMapper;

	/*
	// @Autowired �� ó�������Ƿ� setter ���ʿ� 
	public void setBoardMapper(BoardMapper boardMapper) 
	{
		this.boardMapper = boardMapper;
	}
	*/

	public ArrayList<BoardBean> getList(int nStartPage, int list_num)
	{
		System.out.println("boardMapper.getList() ȣ��!![nStartPage="+nStartPage +",list_num="+list_num+"]");
		return this.boardMapper.getList(nStartPage, list_num);		
	}
	
	public BoardBean getSpecificRow(String id)
	{
		System.out.println("boardMapper.getSpecificRow() ȣ��!!");
		return this.boardMapper.getSpecificRow(id);
	}
	
	public int getTotalCnt()
	{
		int nCnt = 0;
		
		System.out.println("boardMapper.getTotalCnt() ȣ��!!");
		nCnt= this.boardMapper.getTotalCnt();
			
		System.out.println("nCnt="+nCnt);
		return nCnt;		
	}
	
	public int getTotalCntBySubject(String search)
	{
		int nCnt = 0;
		
		System.out.println("boardMapper.getTotalCntBySubject() ȣ��!! = "+search);			
		nCnt= this.boardMapper.getTotalCntBySubject(search) ;			
		
		System.out.println("nCnt="+nCnt);
		return nCnt;		
	}
	
	public void insertBoard (BoardBean boardBean)
	{
		boardMapper.insertBoard(boardBean);
	}
	
	public void updateBoard (BoardBean boardBean)
	{
		System.out.println("boardMapper.updateBoard() ȣ��!![id="+boardBean.getId() +",memo="+boardBean.getMemo()+"]");
		boardMapper.updateBoard(boardBean.getId(), boardBean.getSubject(), boardBean.getMail(), boardBean.getMemo());
	}
	
	
	public void deleteRow(int id)
	{
		System.out.println("boardMapper.deleteSpecificRow() ȣ��!!");
		this.boardMapper.deleteSpecificRow(id);
	}
	
	public ArrayList<BoardBean> getSearchedList(int nStartPage, int list_num, String strSearchThis)
	{
		System.out.println("boardMapper.getSearchedList() ȣ��!!");
		return this.boardMapper.getSearchedList(nStartPage, list_num, strSearchThis);
	}
	
}
