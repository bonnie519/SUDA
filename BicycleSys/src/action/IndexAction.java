package action;

import com.opensymphony.xwork2.ActionSupport;
//就用这一种， ActionSupport已经帮忙封装了许多方法，可以直接用
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
