import com.forbes.util.Calendar;

public class Test {
	
	int iYear;
	 String[] sHeavenlyStems = {
	   "��", "��", "��", "��", "��", "��", "��", "��", "��", "��"
	 };
	 String[] sEarthlyBranches = {
	   "��", "��", "��", "î", "��", "��", "��", "δ", "��", "��", "��", "��"
	 };

	 public Test(){
	  int iYear = 1981;
	 }

	 public Test(int iYear){
	  if((iYear < 2050) && (iYear > 1901))
	   this.iYear = iYear;
	  else
	   this.iYear = 1981;
	 }

	 public String toString(){
	  int temp;
	  temp = Math.abs(iYear - 1924);
	  return sHeavenlyStems[temp % 10] + sEarthlyBranches[temp % 12];
	 }
	 
  public static void main(String[] args) {
      //����ũ������ת���������ڷ���
	 Calendar c = new Calendar();
    System.out.println(new Calendar().sCalendarLundarToSolar(2008,5,1));


  }
}