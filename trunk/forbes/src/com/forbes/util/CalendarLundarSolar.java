package com.forbes.util;

//import com.forbes.util.Calendar;

public class CalendarLundarSolar {

	int iYear;
	String[] sHeavenlyStems = { "��", "��", "��", "��", "��", "��", "��", "��", "��",
			"��" };
	String[] sEarthlyBranches = { "��", "��", "��", "î", "��", "��", "��", "δ", "��",
			"��", "��", "��" };

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
		// ����ũ������ת���������ڷ���
		Calendar c = new Calendar();
		System.out.println(new Calendar().sCalendarLundarToSolar(2009, 5, 1));
	}*/
}