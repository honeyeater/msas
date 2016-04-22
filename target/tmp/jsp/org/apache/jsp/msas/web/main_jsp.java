package org.apache.jsp.msas.web;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class main_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_shiro_principal_nobody;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_shiro_hasAnyRoles_name;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_shiro_lacksRole_name;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_shiro_hasRole_name;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_shiro_user;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_shiro_guest;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_shiro_notAuthenticated;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_shiro_authenticated;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_shiro_hasPermission_name;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_shiro_principal_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_shiro_hasAnyRoles_name = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_shiro_lacksRole_name = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_shiro_hasRole_name = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_shiro_user = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_shiro_guest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_shiro_notAuthenticated = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_shiro_authenticated = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_shiro_hasPermission_name = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_shiro_principal_nobody.release();
    _jspx_tagPool_shiro_hasAnyRoles_name.release();
    _jspx_tagPool_shiro_lacksRole_name.release();
    _jspx_tagPool_shiro_hasRole_name.release();
    _jspx_tagPool_shiro_user.release();
    _jspx_tagPool_shiro_guest.release();
    _jspx_tagPool_shiro_notAuthenticated.release();
    _jspx_tagPool_shiro_authenticated.release();
    _jspx_tagPool_shiro_hasPermission_name.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");

	String url = request.getRequestURL().toString();
	url = url.substring(0, url.indexOf('/', url.indexOf("//") + 2));
	String context = request.getContextPath();
	url += context;
	application.setAttribute("ctx", url);

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("<title>Shiro登陆实例</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<h1>Shiro登陆实例</h1><a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${ctx}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/user/logout\">退出</a>\r\n");
      out.write("\t<p>一、验证当前用户是否为\"访客\"，即未认证（包含未记住）的用户</p>\r\n");
      out.write("\t");
      if (_jspx_meth_shiro_guest_0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\t<p>二、认证通过或已记住的用户</p>\r\n");
      out.write("\t");
      if (_jspx_meth_shiro_user_0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\t<p>三、已认证通过的用户。不包含已记住的用户，这是与user标签的区别所在。</p>\r\n");
      out.write("\t");
      if (_jspx_meth_shiro_authenticated_0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\t<p>四、未认证通过用户，与authenticated标签相对应。与guest标签的区别是，该标签包含已记住用户。</p>\r\n");
      out.write("\t");
      if (_jspx_meth_shiro_notAuthenticated_0(_jspx_page_context))
        return;
      out.write("  \r\n");
      out.write("\t<p>五、输出当前用户信息，通常为登录帐号信息</p>\r\n");
      out.write("\tHello, ");
      if (_jspx_meth_shiro_principal_0(_jspx_page_context))
        return;
      out.write(", how are you today?  \r\n");
      out.write("\t<p>六、验证当前用户是否属于该角色</p>\r\n");
      out.write("\t");
      if (_jspx_meth_shiro_hasRole_0(_jspx_page_context))
        return;
      out.write("  \r\n");
      out.write("\t<p>七、与hasRole标签逻辑相反，当用户不属于该角色时验证通过</p>\r\n");
      out.write("\t");
      if (_jspx_meth_shiro_lacksRole_0(_jspx_page_context))
        return;
      out.write("  \r\n");
      out.write("\t<p>八、验证当前用户是否属于以下任意一个角色。</p>\r\n");
      out.write("\t");
      if (_jspx_meth_shiro_hasAnyRoles_0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("   <p>九、验证当前用户权限。</p>\r\n");
      out.write("\t");
      if (_jspx_meth_shiro_hasPermission_0(_jspx_page_context))
        return;
      out.write("  \r\n");
      out.write("\r\n");
      out.write("\t");
      if (_jspx_meth_shiro_hasPermission_1(_jspx_page_context))
        return;
      out.write("  \r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_shiro_guest_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  shiro:guest
    org.apache.shiro.web.tags.GuestTag _jspx_th_shiro_guest_0 = (org.apache.shiro.web.tags.GuestTag) _jspx_tagPool_shiro_guest.get(org.apache.shiro.web.tags.GuestTag.class);
    _jspx_th_shiro_guest_0.setPageContext(_jspx_page_context);
    _jspx_th_shiro_guest_0.setParent(null);
    int _jspx_eval_shiro_guest_0 = _jspx_th_shiro_guest_0.doStartTag();
    if (_jspx_eval_shiro_guest_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("  \r\n");
        out.write("    \tHi there!  Please <a href=\"login.jsp\">Login</a> or <a href=\"signup.jsp\">Signup</a> today!  \r\n");
        out.write("\t");
        int evalDoAfterBody = _jspx_th_shiro_guest_0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_shiro_guest_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_shiro_guest.reuse(_jspx_th_shiro_guest_0);
      return true;
    }
    _jspx_tagPool_shiro_guest.reuse(_jspx_th_shiro_guest_0);
    return false;
  }

  private boolean _jspx_meth_shiro_user_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  shiro:user
    org.apache.shiro.web.tags.UserTag _jspx_th_shiro_user_0 = (org.apache.shiro.web.tags.UserTag) _jspx_tagPool_shiro_user.get(org.apache.shiro.web.tags.UserTag.class);
    _jspx_th_shiro_user_0.setPageContext(_jspx_page_context);
    _jspx_th_shiro_user_0.setParent(null);
    int _jspx_eval_shiro_user_0 = _jspx_th_shiro_user_0.doStartTag();
    if (_jspx_eval_shiro_user_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("  \r\n");
        out.write("    \tWelcome back John!  Not John? Click <a href=\"login.jsp\">here<a> to login. \r\n");
        out.write("\t");
        int evalDoAfterBody = _jspx_th_shiro_user_0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_shiro_user_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_shiro_user.reuse(_jspx_th_shiro_user_0);
      return true;
    }
    _jspx_tagPool_shiro_user.reuse(_jspx_th_shiro_user_0);
    return false;
  }

  private boolean _jspx_meth_shiro_authenticated_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  shiro:authenticated
    org.apache.shiro.web.tags.AuthenticatedTag _jspx_th_shiro_authenticated_0 = (org.apache.shiro.web.tags.AuthenticatedTag) _jspx_tagPool_shiro_authenticated.get(org.apache.shiro.web.tags.AuthenticatedTag.class);
    _jspx_th_shiro_authenticated_0.setPageContext(_jspx_page_context);
    _jspx_th_shiro_authenticated_0.setParent(null);
    int _jspx_eval_shiro_authenticated_0 = _jspx_th_shiro_authenticated_0.doStartTag();
    if (_jspx_eval_shiro_authenticated_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("  \r\n");
        out.write("    \t<a href=\"updateAccount.jsp\">Update your contact information</a>.  \r\n");
        out.write("\t");
        int evalDoAfterBody = _jspx_th_shiro_authenticated_0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_shiro_authenticated_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_shiro_authenticated.reuse(_jspx_th_shiro_authenticated_0);
      return true;
    }
    _jspx_tagPool_shiro_authenticated.reuse(_jspx_th_shiro_authenticated_0);
    return false;
  }

  private boolean _jspx_meth_shiro_notAuthenticated_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  shiro:notAuthenticated
    org.apache.shiro.web.tags.NotAuthenticatedTag _jspx_th_shiro_notAuthenticated_0 = (org.apache.shiro.web.tags.NotAuthenticatedTag) _jspx_tagPool_shiro_notAuthenticated.get(org.apache.shiro.web.tags.NotAuthenticatedTag.class);
    _jspx_th_shiro_notAuthenticated_0.setPageContext(_jspx_page_context);
    _jspx_th_shiro_notAuthenticated_0.setParent(null);
    int _jspx_eval_shiro_notAuthenticated_0 = _jspx_th_shiro_notAuthenticated_0.doStartTag();
    if (_jspx_eval_shiro_notAuthenticated_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("  \r\n");
        out.write("\t    Please <a href=\"login.jsp\">login</a> in order to update your credit card information.  \r\n");
        out.write("\t");
        int evalDoAfterBody = _jspx_th_shiro_notAuthenticated_0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_shiro_notAuthenticated_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_shiro_notAuthenticated.reuse(_jspx_th_shiro_notAuthenticated_0);
      return true;
    }
    _jspx_tagPool_shiro_notAuthenticated.reuse(_jspx_th_shiro_notAuthenticated_0);
    return false;
  }

  private boolean _jspx_meth_shiro_principal_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  shiro:principal
    org.apache.shiro.web.tags.PrincipalTag _jspx_th_shiro_principal_0 = (org.apache.shiro.web.tags.PrincipalTag) _jspx_tagPool_shiro_principal_nobody.get(org.apache.shiro.web.tags.PrincipalTag.class);
    _jspx_th_shiro_principal_0.setPageContext(_jspx_page_context);
    _jspx_th_shiro_principal_0.setParent(null);
    int _jspx_eval_shiro_principal_0 = _jspx_th_shiro_principal_0.doStartTag();
    if (_jspx_th_shiro_principal_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_shiro_principal_nobody.reuse(_jspx_th_shiro_principal_0);
      return true;
    }
    _jspx_tagPool_shiro_principal_nobody.reuse(_jspx_th_shiro_principal_0);
    return false;
  }

  private boolean _jspx_meth_shiro_hasRole_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  shiro:hasRole
    org.apache.shiro.web.tags.HasRoleTag _jspx_th_shiro_hasRole_0 = (org.apache.shiro.web.tags.HasRoleTag) _jspx_tagPool_shiro_hasRole_name.get(org.apache.shiro.web.tags.HasRoleTag.class);
    _jspx_th_shiro_hasRole_0.setPageContext(_jspx_page_context);
    _jspx_th_shiro_hasRole_0.setParent(null);
    _jspx_th_shiro_hasRole_0.setName("administrator");
    int _jspx_eval_shiro_hasRole_0 = _jspx_th_shiro_hasRole_0.doStartTag();
    if (_jspx_eval_shiro_hasRole_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("  \r\n");
        out.write("\t    <a href=\"admin.jsp\">Administer the system</a>  \r\n");
        out.write("\t");
        int evalDoAfterBody = _jspx_th_shiro_hasRole_0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_shiro_hasRole_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_shiro_hasRole_name.reuse(_jspx_th_shiro_hasRole_0);
      return true;
    }
    _jspx_tagPool_shiro_hasRole_name.reuse(_jspx_th_shiro_hasRole_0);
    return false;
  }

  private boolean _jspx_meth_shiro_lacksRole_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  shiro:lacksRole
    org.apache.shiro.web.tags.LacksRoleTag _jspx_th_shiro_lacksRole_0 = (org.apache.shiro.web.tags.LacksRoleTag) _jspx_tagPool_shiro_lacksRole_name.get(org.apache.shiro.web.tags.LacksRoleTag.class);
    _jspx_th_shiro_lacksRole_0.setPageContext(_jspx_page_context);
    _jspx_th_shiro_lacksRole_0.setParent(null);
    _jspx_th_shiro_lacksRole_0.setName("administrator");
    int _jspx_eval_shiro_lacksRole_0 = _jspx_th_shiro_lacksRole_0.doStartTag();
    if (_jspx_eval_shiro_lacksRole_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("  \r\n");
        out.write("\t    Sorry, you are not allowed to administer the system.  \r\n");
        out.write("\t");
        int evalDoAfterBody = _jspx_th_shiro_lacksRole_0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_shiro_lacksRole_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_shiro_lacksRole_name.reuse(_jspx_th_shiro_lacksRole_0);
      return true;
    }
    _jspx_tagPool_shiro_lacksRole_name.reuse(_jspx_th_shiro_lacksRole_0);
    return false;
  }

  private boolean _jspx_meth_shiro_hasAnyRoles_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  shiro:hasAnyRoles
    org.apache.shiro.web.tags.HasAnyRolesTag _jspx_th_shiro_hasAnyRoles_0 = (org.apache.shiro.web.tags.HasAnyRolesTag) _jspx_tagPool_shiro_hasAnyRoles_name.get(org.apache.shiro.web.tags.HasAnyRolesTag.class);
    _jspx_th_shiro_hasAnyRoles_0.setPageContext(_jspx_page_context);
    _jspx_th_shiro_hasAnyRoles_0.setParent(null);
    _jspx_th_shiro_hasAnyRoles_0.setName("developer,manager,administrator");
    int _jspx_eval_shiro_hasAnyRoles_0 = _jspx_th_shiro_hasAnyRoles_0.doStartTag();
    if (_jspx_eval_shiro_hasAnyRoles_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("\t    You are either a developer,manager, or administrator.  \r\n");
        out.write("\t");
        int evalDoAfterBody = _jspx_th_shiro_hasAnyRoles_0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_shiro_hasAnyRoles_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_shiro_hasAnyRoles_name.reuse(_jspx_th_shiro_hasAnyRoles_0);
      return true;
    }
    _jspx_tagPool_shiro_hasAnyRoles_name.reuse(_jspx_th_shiro_hasAnyRoles_0);
    return false;
  }

  private boolean _jspx_meth_shiro_hasPermission_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  shiro:hasPermission
    org.apache.shiro.web.tags.HasPermissionTag _jspx_th_shiro_hasPermission_0 = (org.apache.shiro.web.tags.HasPermissionTag) _jspx_tagPool_shiro_hasPermission_name.get(org.apache.shiro.web.tags.HasPermissionTag.class);
    _jspx_th_shiro_hasPermission_0.setPageContext(_jspx_page_context);
    _jspx_th_shiro_hasPermission_0.setParent(null);
    _jspx_th_shiro_hasPermission_0.setName("create");
    int _jspx_eval_shiro_hasPermission_0 = _jspx_th_shiro_hasPermission_0.doStartTag();
    if (_jspx_eval_shiro_hasPermission_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("  \r\n");
        out.write("\t  <p>当前用户拥有增加的权限</p>\r\n");
        out.write("\t");
        int evalDoAfterBody = _jspx_th_shiro_hasPermission_0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_shiro_hasPermission_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_shiro_hasPermission_name.reuse(_jspx_th_shiro_hasPermission_0);
      return true;
    }
    _jspx_tagPool_shiro_hasPermission_name.reuse(_jspx_th_shiro_hasPermission_0);
    return false;
  }

  private boolean _jspx_meth_shiro_hasPermission_1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  shiro:hasPermission
    org.apache.shiro.web.tags.HasPermissionTag _jspx_th_shiro_hasPermission_1 = (org.apache.shiro.web.tags.HasPermissionTag) _jspx_tagPool_shiro_hasPermission_name.get(org.apache.shiro.web.tags.HasPermissionTag.class);
    _jspx_th_shiro_hasPermission_1.setPageContext(_jspx_page_context);
    _jspx_th_shiro_hasPermission_1.setParent(null);
    _jspx_th_shiro_hasPermission_1.setName("delete");
    int _jspx_eval_shiro_hasPermission_1 = _jspx_th_shiro_hasPermission_1.doStartTag();
    if (_jspx_eval_shiro_hasPermission_1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("  \r\n");
        out.write("\t   <p>当前用户拥有删除的权限</p>\r\n");
        out.write("\t");
        int evalDoAfterBody = _jspx_th_shiro_hasPermission_1.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_shiro_hasPermission_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_shiro_hasPermission_name.reuse(_jspx_th_shiro_hasPermission_1);
      return true;
    }
    _jspx_tagPool_shiro_hasPermission_name.reuse(_jspx_th_shiro_hasPermission_1);
    return false;
  }
}
