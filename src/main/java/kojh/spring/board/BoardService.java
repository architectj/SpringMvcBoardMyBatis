package kojh.spring.board;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
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

	public ArrayList<BoardBean> getList(int nStartPage, String dbsearch,int list_num)
	{
		System.out.println("boardMapper.getList() ȣ��!![nStartPage="+nStartPage +",dbsearch="+dbsearch + ",list_num="+list_num+"]");
		return this.boardMapper.getList(nStartPage, dbsearch, list_num);		
	}
	
	public BoardBean getSpecificRow(String id)
	{
		System.out.println("boardMapper.getSpecificRow() ȣ��!!");
		return this.boardMapper.getSpecificRow(id);
	}
	
	public int getTotalCnt(String search)
	{
		int nCnt = 0;
		if(null == search )
		{
			System.out.println("boardMapper.getTotalCnt() ȣ��!!");
			nCnt= this.boardMapper.getTotalCnt();
		}
		else
		{
			System.out.println("boardMapper.getTotalCntBySubject() ȣ��!!");			
			nCnt= this.boardMapper.getTotalCntBySubject(search) ;			
		}
		System.out.println("nCnt="+nCnt);
		return nCnt;		
	}
	
	public void insertBoard (BoardBean boardBean)
	{
		boardMapper.insertBoard(boardBean);
	}
	
}
