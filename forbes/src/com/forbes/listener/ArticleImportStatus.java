package com.forbes.listener;

public class ArticleImportStatus {
	
	private int importCnt = 0;
	private int totalCnt = 0;
	private int currentCnt = 0;
	private int failCnt = 0;

	public int getImportCnt() {
		return importCnt;
	}

	public void setImportCnt(int importCnt) {
		this.importCnt = importCnt;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public int getCurrentCnt() {
		return currentCnt;
	}

	public void setCurrentCnt(int currentCnt) {
		this.currentCnt = currentCnt;
	}

	public int getFailCnt() {
		return failCnt;
	}

	public void setFailCnt(int failCnt) {
		this.failCnt = failCnt;
	}

	public ArticleImportStatus() {
		importCnt = 0;
		totalCnt = 0;
		currentCnt = 0;
	}

	
}
