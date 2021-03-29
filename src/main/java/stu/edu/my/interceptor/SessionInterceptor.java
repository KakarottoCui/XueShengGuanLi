package stu.edu.my.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//拦截器,继承HandlerInterceptorAdapter
public class SessionInterceptor extends HandlerInterceptorAdapter{

	//继承重写preHandle方法
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//获取session对象
		Object object = request.getSession().getAttribute("user");
		if(object == null) {
			//为空返回登录页面
			response.sendRedirect(request.getContextPath()+"/index");
			return false;
		}
		return super.preHandle(request, response, handler);
	}
	
}
