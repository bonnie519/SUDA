package action;

import com.opensymphony.xwork2.ActionSupport;
//������һ�֣� ActionSupport�Ѿ���æ��װ����෽��������ֱ����
public class IndexAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String path() {
		return "path";
	}
	public String hello(){
		return "hello";
	}
	
}
