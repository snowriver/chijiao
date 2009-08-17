package com.forbes.util;

//import com.forbes.util.Calendar;

public class CalendarLundarSolar {

	int iYear;
	String[] sHeavenlyStems = { "甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬",
			"癸" };
	String[] sEarthlyBranches = { "子", "丑", "寅", "卯", "辰", "巳", "午", "未", "申",
			"酉", "戌", "亥" };

	public CalendarLundarSolar() {
		iYear = 1981;
	}

	public CalendarLundarSolar(int iYear) {
		if ((iYear < 2050) && (iYear > 1901))
			this.iYear = iYear;
		else
			this.iYear = 1981;
	}

	public String toString() {
		int temp;
		temp = Math.abs(iYear - 1924);
		return sHeavenlyStems[temp % 10] + sEarthlyBranches[temp % 12];
	}

	/*public static void main(String[] args) {
		// 调用农历日期转换阳历日期方法
		Calendar c = new Calendar();
		System.out.println(new Calendar().sCalendarLundarToSolar(2009, 5, 1));
	}*/
}