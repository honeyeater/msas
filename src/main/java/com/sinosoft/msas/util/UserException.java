/**
 * 我们针对自行开发的应用程序进行了错误种类和具体错误的分类和编码管理, 这个异常类就是基于这套错误体系的异常类
 */
package com.sinosoft.msas.util;

import java.io.*;
import java.util.Calendar;
import java.util.TreeMap;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.*;


/**
 * 在我们开发的JAVA软件中,所有自定义的异常统一由此异常处理,当捕捉到此异常时说明触发了一个
 * 应用级的异常,而非系统级的。但是这里所说的应用级异常可能会包括一些第三方产品报出的错误, 这些第三方产品可能没有以JAVA
 * EXCEPTION的方式抛出异常,而是采用一些其它方式,如用函数的返
 * 回值为-1代表错误,这种情况下我们会将这些错误包装在UserException中,然后再向更上层的调用
 * 抛出,因此UserException不止包含业务逻辑类的错误,抛出的具体是哪一类异常可以通过
 * UserException.getErrorCatalog()的值来判断。
 */
public class UserException extends Exception { 
    private static final long serialVersionUID = 1L;
    private int errorCatalog = 0; // 异常类型
    private int errorNo = 0; // 异常编号
    private String errorMessage = ""; // 异常详细信息
    private String errorModule = ""; // 触发异常的函数
    private String errorAppend = ""; // 异常的堆栈信息

    private static String LINE_SEPARATOR = System.getProperty("line.separator");
    private static TreeMap userExceptionTreeMap = null; // 盛放系统常量
    private static final String delimiter = "^";
    private static boolean init = false;
    private static final File CONFIG_FILE = FileUtils.getUniqueFile(
            UserException.class, ".config");
    private static long lastModified = 0;
    private static File localConfigFile;

    /**
     * 根据JVM启动配置System.log.file设置日志文件
     */
    private PrintStream getLogFile() {
        String filename = System.getProperty("System.log.file");
        Calendar rightNow = Calendar.getInstance();

        if (filename != null) {
            filename = filename + "." + (rightNow.get(Calendar.MONTH) + 1)
                    + rightNow.get(Calendar.DAY_OF_MONTH);
            try {
                return new java.io.PrintStream(new java.io.FileOutputStream(
                        filename, true), true);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    /**
     * 判断是否已被初始化
     * 
     * @return 是否已被初始化
     */
    public static boolean isInited() {
        return init;
    }

    /**
     * 生成一个异常对象实例,并设置异常类型、异常编号、异常所在模块 此方法会根据异常类型和异常编号生成标准错误信息
     * 
     * @param theErrorCatalog theErrorCatalog
     * @param theErrorNo theErrorNo
     */
    public UserException(int theErrorCatalog, int theErrorNo,
            String theErrorModule) {
        errorCatalog = theErrorCatalog;
        errorNo = theErrorNo;
        errorModule = theErrorModule;
        try {
            setErrorMessageFromErrorCode();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 生成一个异常对象实例,并设置异常的类型、编号、触发错误的函数、详细错误信息、扩展错误信息,这个方法通常
     * 在接收到后台服务的错误报告,封装为UserException,然后继续抛向更上层的应用
     * 
     * @param theErrorCatalog 异常的类型
     * @param theErrorNo 异常的编号
     * @param theErrorModule 触发错误的函数
     * @param theErrorMessage 详细错误信息
     * @param theErrorAppend 扩展错误信息
     */
    public UserException(int theErrorCatalog, int theErrorNo,
            String theErrorModule, String theErrorMessage, String theErrorAppend) {
        errorCatalog = theErrorCatalog;
        errorNo = theErrorNo;
        errorModule = theErrorModule;
        errorAppend = theErrorAppend;
        if (theErrorMessage != null && theErrorMessage.trim().length() > 0) {
            errorMessage = theErrorMessage;
        } else {
            try {
                setErrorMessageFromErrorCode();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 生成一个异常对象实例,并设置异常的类型、编号、触发错误的函数、详细错误信息,这个方法通常
     * 在接收到后台服务的错误报告,封装为UserException,然后继续抛向更上层的应用
     * 
     * @param theErrorCatalog 异常的类型
     * @param theErrorNo 异常的编号
     * @param theErrorModule 触发错误的函数
     * @param theErrorMessage 详细错误信息
     */
    public UserException(int theErrorCatalog, int theErrorNo,
            String theErrorModule, String theErrorMessage) {
        errorCatalog = theErrorCatalog;
        errorNo = theErrorNo;
        errorModule = theErrorModule;
        if (theErrorMessage != null && theErrorMessage.trim().length() > 0) {
            errorMessage = theErrorMessage;
        } else {
            try {
                setErrorMessageFromErrorCode();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 得到异常类型代码
     * 
     * @return 异常类型代码
     */
    public int getErrorCatalog() {
        return errorCatalog;
    }

    /**
     * 得到异常编码号
     * 
     * @return 异常编码号
     */
    public int getErrorNo() {
        return errorNo;
    }

    /**
     * 得到异常详细信息
     * 
     * @return 异常详细信息
     */
    public String getErrorMessage() {
        return errorMessage;
    }

    /**
     * 得到触发异常的函数
     * 
     * @return 触发异常的函数
     */
    public String getErrorModule() {
        return errorModule;
    }

    /**
     * 根据错误类别及错误代码设置相关的错误信息
     * 
     * @throws Exception
     */
    private void setErrorMessageFromErrorCode() throws Exception {
        if (this.errorMessage == null || this.errorMessage.trim().length() == 0) {
            //没有初始化时自动加载，更新了也自动加载
            if (init == false) {
                if (!CONFIG_FILE.exists()) {
                    try {
                        if (CONFIG_FILE.createNewFile() == false) {
                            System.out.println("Create file "
                                    + CONFIG_FILE.getAbsolutePath() + " fail.");
                        }
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
                if (CONFIG_FILE.exists()) {
                    String fileName = FileUtils.read(CONFIG_FILE);
                    if (new File(fileName).exists()) {
                        reconfigure(fileName);
                    }
                }
            } else {
                if (lastModified < localConfigFile.lastModified()) {
                    reconfigure(localConfigFile.getAbsolutePath());
                }
            } 
            this.errorMessage = (String) userExceptionTreeMap.get(errorCatalog
                    + delimiter + errorNo);
            if (this.errorMessage == null)
                this.errorMessage = "";
        }
    }

    /**
     * Prints this throwable and its backtrace to the specified print writer.
     * 
     * @param s - PrintWriter to use for output
     */
    public void printStackTrace(java.io.PrintStream s) {
        synchronized (s) {
            Calendar rightnow = Calendar.getInstance();
            String strLogValue = LINE_SEPARATOR
                    + "***** UserException occurred at "
                    + rightnow.get(Calendar.HOUR_OF_DAY) + ":"
                    + rightnow.get(Calendar.MINUTE) + ":"
                    + rightnow.get(Calendar.SECOND) + " *****" + LINE_SEPARATOR
                    + "ErrorCatalog = " + getErrorCatalog() + LINE_SEPARATOR
                    + "ErrorNo      = " + getErrorNo() + LINE_SEPARATOR
                    + "ErrorModule  = " + getErrorModule() + LINE_SEPARATOR
                    + "ErrorMessage = " + getErrorMessage() + LINE_SEPARATOR
                    + LINE_SEPARATOR + "The stack trace is: " + LINE_SEPARATOR
                    + errorAppend + LINE_SEPARATOR;

            s.print(strLogValue);
            super.printStackTrace(s);
            PrintStream logfile = this.getLogFile();
            if (logfile != null) {
                logfile.print(strLogValue);
                logfile.flush();
                super.printStackTrace(logfile);
            }
        }
    }

    /**
     * Prints this throwable
     */
    public void printStackTrace() {
        printStackTrace(System.err);
    }

    /**
     * 解析配置文件,初始化
     * 
     * @param userExceptionFile 配置文件绝对路径＋文件名
     * @param forceInit 已初始化但还是要强制重新解释文件
     * @throws Exception
     */
    public static synchronized void init(String userExceptionFile,
            boolean forceInit) throws Exception {
        if (forceInit == false && init == true) {
            // Do nothing
        } else {
            init(userExceptionFile);
        }
    }

    /**
     * 初始化UserException类，重新装载配置文件
     * 
     * @param fileName 配置文件
     * @throws Exception
     */
    public synchronized static void reconfigure(String fileName)
            throws Exception {
        try {
            localConfigFile = new File(fileName);
            lastModified = localConfigFile.lastModified();
            FileUtils.write(fileName, CONFIG_FILE);
            configure(new BufferedInputStream(new FileInputStream(fileName)));
            System.out.println("Success load UserException configuration at \""
                    + fileName + "\".");
        } catch (Exception e) {
            System.out.println("Fail load UserException configuration at \""
                    + fileName + "\".");
            throw e;
        }
    }

    /**
     * 解析异常常量文件,初始化
     * 
     * @param userExceptionFile :系统常量文件绝对路径＋文件名
     * @deprecated Use init(String userExceptionFile,boolean forceInit)
     * @throws Exception
     */
    public static synchronized void init(String userExceptionFile)
            throws Exception {
        File file = new File(userExceptionFile);
        if (file.exists()) {
            reconfigure(userExceptionFile);
        }
    }

    /**
     * 初始化UserException类，装载配置文件
     * 
     * @param inputStream 配置文件InputStream
     * @throws Exception
     */
    private synchronized static void configure(InputStream inputStream)
            throws Exception {
        init = false;
        // 解析xml文件,从xml文件中读取交易码的系统常量信息,将结果放入映射表中
        // 初始化userExceptionTreeMap
        userExceptionTreeMap = new TreeMap();

        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();

        // 分析XML文件
        Document document = builder.parse(inputStream);

        // 得到系统常量父NodeList
        NodeList userExceptions = document
                .getElementsByTagName("UserException");
        NodeList errors;
        String errorCatalog;
        String errorNo;
        String errorMessage;
        // 循环系统常量NodeList,系统常量加入TreeMap中
        for (int i = 0; i < userExceptions.getLength(); i++) {
            if (userExceptions.item(i).getNodeType() != Node.ELEMENT_NODE)
                continue;
            errorCatalog = userExceptions.item(i).getAttributes().getNamedItem(
                    "ErrorCatalog").getNodeValue();
            errorNo = "";
            errorMessage = "";
            errors = userExceptions.item(i).getChildNodes();
            for (int j = 0; j < errors.getLength(); j++) {
                if (errors.item(j).getNodeType() != Node.ELEMENT_NODE)
                    continue;
                Element element = (Element) errors.item(j);
                errorNo = element.getElementsByTagName("ErrorNo").item(0)
                        .getFirstChild().getNodeValue();
                errorMessage = element.getElementsByTagName("ErrorMessage")
                        .item(0).getFirstChild().getNodeValue();
                userExceptionTreeMap.put(errorCatalog + delimiter + errorNo,
                        errorMessage);
            }
        }
        inputStream.close();
        init = true;
    }

    /**
     * main method
     * 
     * @param args argements
     */
    public static void main(String[] args) {
        String filename = System.getProperty("System.log.file");
        Calendar rightNow = Calendar.getInstance();

        if (filename != null)
            filename = filename + "." + (rightNow.get(Calendar.MONTH) + 1)
                    + rightNow.get(Calendar.DAY_OF_MONTH);
        try {
            throw new UserException(100, 200, "Unkown Module",
                    "Unkonw Error message--Only for test", "");
        } catch (UserException ex) {
            try {
                if (filename != null)
                    ex
                            .printStackTrace(new java.io.PrintStream(
                                    new java.io.FileOutputStream(filename, true),
                                    true));
            } catch (Exception e) {
            }
        }
    }
}