package com.forbes.util;

public class Pager {
	int curPage=1;
	int totoalPage=0;
	int prePage=0;
	int nextPage=0;
	int totoalCnt=0;
	int cntOfPage=10;
	public void calTotoalPage(){
		if( totoalCnt % cntOfPage > 0 ){
			this.totoalPage = totoalCnt / cntOfPage +1;
		}else{
			this.totoalPage = totoalCnt / cntOfPage;
		}
	}
	public int getTotoalCnt() {
		return totoalCnt;
	}
	public void setTotoalCnt(int totoalCnt) {
		this.totoalCnt = totoalCnt;
		calTotoalPage();
		setNextPage();
		setPrePage();
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
		setNextPage();
		setPrePage();
	}
	public int getNextPage() {
		return this.nextPage;
	}
	public void setNextPage() {
		
		if (this.curPage < this.totoalPage) {
			this.nextPage = this.curPage+1;
		} else {
			this.nextPage = this.totoalPage;
		}
	}
	public int getPrePage() {
		return this.prePage;
	}
	public void setPrePage() {
		if( this.curPage > 1 ){
			this.prePage = this.curPage -1 ;
		}else{
			this.prePage = 1;
		}
	}
	public int getTotoalPage() {
		return totoalPage;
	}
	public void setTotoalPage(int totoalPage) {
		this.totoalPage = totoalPage;
		
	}
	public int getCntOfPage() {
		return cntOfPage;
	}
	public void setCntOfPage(int cntOfPage) {
		this.cntOfPage = cntOfPage;
		calTotoalPage();
	}
	
}
