/**
 * XML格式数据读取类
 */
package com.sinosoft.msas.util;

import java.io.*;
import java.util.TreeMap;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.*;


/**
 * 用散列表的方法加速读取XML格式的系统常量文件的过程
 */
public class SysConst {
    private static TreeMap constTreeMap = null; // 盛放系统常量
    private static boolean init = false;
    public static final int FAILURE = -1;
    public static final int SUCCESS = 0;
    public static final int NOTFOUND = 100;
    public static final int CONTINUE = 200;
    public static final int NOTSQLCODE = 888;
    public static final int SERVICEEXCEPTION = 999;
    public static final String HEADOFPACKAGE = "";
    public static final String ENDOFPACKAGE = "|";
    public static final String HEADOFSERVICE = "";
    public static final String ENDOFSERVICE = "";
    public static final String HEADOFPARAMETERS = "";
    public static final String ENDOFPARAMETERS = "";
    public static final String HEADOFPARAMETER = "";
    public static final String ENDOFPARAMETER = "^";
    public static final String DELIMITER = "　";
    public static final int SPLITLENGTH = 33;
    public static final int LINE_LENGTH = 70;
    public static final String EMPTY = "";
    private static final File CONFIG_FILE = FileUtils.getUniqueFile(
            SysConst.class, ".config");
    private static long lastModified = 0;
    private static File localConfigFile;

    public SysConst() {
    }

    /**
     * 判断是否已被初始化
     * @return 是否已被初始化
     */
    public static boolean isInited() {
        return init;
    }

    /**
     * 解析系统常量文件,初始化
     * @param sysConstFile 系统常量文件绝对路径＋文件名
     * @param forceInit 已初始化但还是要强制重新解释文件
     * @throws Exception
     */
    public static synchronized void init(String sysConstFile, boolean forceInit)
            throws Exception {
        if (forceInit == false && init == true) {
            // Do nothing
        } else {
            init(sysConstFile);
        }
    }

    /**
     * 解析系统常量文件,初始化
     * @param fileName 系统常量文件绝对路径＋文件名
     * @throws Exception
     */
    public static synchronized void init(String fileName) throws Exception {
        if (!init) {
            reconfigure(fileName);
        }
    }

    /**
     * 初始化SysConst类，重新装载配置文件
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
            System.out.println("[Success load SysConst configuration at \""
                    + fileName + "\".");
            init = true;
        } catch (Exception e) {
            System.out.println("Fail load SysConst configuration at \""
                    + fileName + "\".");
            throw e;
        }
    }

    /**
     * 初始化SysConst类，装载配置文件
     * 
     * @param inputStream 配置文件InputStream
     * @throws Exception
     */
    public static synchronized void configure(InputStream inputStream)
            throws Exception {
        // 解析xml文件,从xml文件中读取交易码的系统常量信息,将结果放入映射表中
        // 初始化ConstTreeMap
        constTreeMap = new TreeMap();
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        // 分析XML文件
        Document document = builder.parse(inputStream);
        // 得到系统常量父NodeList
        NodeList SysConstList = document.getElementsByTagName("sysconst");
        // 得到系统常量NodeList
        NodeList ConstList = SysConstList.item(0).getChildNodes();
        // 定义常量名
        String ConstName = "";
        // 定义常量值
        String ConstValue = "";
        // 定义常量个数
        int ConstCount = ConstList.getLength();
        // 循环系统常量NodeList,系统常量加入TreeMap中
        for (int i = 0; i < ConstCount; i++) {
            if (ConstList.item(i).getNodeType() != Node.ELEMENT_NODE) {
                continue;
            }
            // 得到常量名称
            ConstName = ConstList.item(i).getNodeName().trim();
            // 得到常量值
            if (ConstList.item(i).hasChildNodes() == false) {// 若无子节点则为""
                ConstValue = "";
            } else {
                ConstValue = ConstList.item(i).getFirstChild().getNodeValue();
            }
            constTreeMap.put(ConstName, ConstValue);
        }
        inputStream.close();
    }

    /**
     * 根据常量名称获得值
     * @param key 常量名称
     * @return 常量值
     * @throws UserException
     */
    public static String getProperty(String key)
            throws UserException {
        String value = null;

        // LIJIBIN ADD BEGIN 2004-02-08
        if (key.equals("DDCCDATASOURCE")) {
            return "ddccDataSource";
        }
        if (key.equals("QUERY_LIMIT_COUNT")) {
            return "1000";
        }
        // LIJIBIN ADD END 2004-02-08

        if (key == null) {
            throw new UserException(-98, -998, "SysConst.GetProperty",
                    "参数为NULL");
        }
        if (key.trim().length() == 0) {
            throw new UserException(-98, -997, "SysConst.GetProperty", "参数值为空");
        }

        try {
            // 没有初始化时自动加载，更新了也自动加载
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
        } catch (Exception e) {
            throw new UserException(-98, -999, "SysConst.GetProperty",
                    "SysConst类初始化失败!");
        }

        value = (String) constTreeMap.get(key);

        if (value == null) {
            throw new UserException(-98, -996, "SysConst.GetProperty", "没有"
                    + key + "配置项");
        }
        return value;
    }

    /**
     * main method
     * @param args
     */
    public static void main(String args[]) {
        try {
            // SysConst.init("c:\\temp\\SysConstConfig.xml");
            SysConst.getProperty("");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
