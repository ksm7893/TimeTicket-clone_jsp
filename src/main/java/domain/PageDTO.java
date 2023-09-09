package domain;

import java.sql.SQLException;

public class PageDTO {

	private int currentPage = 1; // 현재 페이지 번호
	private int numberPerPage = 8; // 한 페이지 출력할 게시글 개수
	private int numberOfPageBlock = 4; // 페이지 블럭 수
	private int start, end; // 페이지 시작값, 끝값
	private boolean prev, next; // 이전버튼, 다음버튼
	
	public PageDTO(int currentPage, int numberPerPage, int numberOfPageBlock, int total) {
		
		int totalPages; // 총 페이지 수
		totalPages = (int)Math.ceil( (double)total / numberPerPage );
		
		this.currentPage = currentPage;
		this.start = (currentPage -1) / numberOfPageBlock * numberOfPageBlock +1 ;
		this.end = start + numberOfPageBlock - 1;
		this.end = end > totalPages ? totalPages : end;

		this.prev = this.start > 1;
		this.next = end < totalPages;
		
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getNumberPerPage() {
		return numberPerPage;
	}

	public void setNumberPerPage(int numberPerPage) {
		this.numberPerPage = numberPerPage;
	}

	public int getNumberOfPageBlock() {
		return numberOfPageBlock;
	}

	public void setNumberOfPageBlock(int numberOfPageBlock) {
		this.numberOfPageBlock = numberOfPageBlock;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}
	
}
