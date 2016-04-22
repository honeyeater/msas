/*******************************************************************************
 * DESC ：字符串相关处理工具类 AUTHOR ： zhouxianli CREATEDATE ： 2002-08-09 MODIFYLIST ：
 * Name Date Reason/Contents
 * ------------------------------------------------------ sunchenggang
 * 2002-08-12 修改了decodeStr中下标越界的bug zhangying 2002-11-22 新增split，拆分字符串函数 wupeng
 * 2002-12-12 新增split，拆分字符串函数
 ******************************************************************************/

package com.sinosoft.msas.util;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Vector;

/**
 * 数据类型相关处理工具类
 */
public class Str {

	private static final String DBTYPE_DB2 = "DB2";
	private static final String DBTYPE_ORACLE = "ORACLE";
	private static final SimpleDateFormat dateDefaultFormat = new SimpleDateFormat("yyyy-MM-dd");
	private static final SimpleDateFormat timeStampDefaultFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");


	/**
     * 将给定字符串复制ｎ遍
     * 
     * @param intLength 字符串长度
     * @return 字符串
     */
    public static String newString(String iString, int iTimes) {
        StringBuffer buffer = new StringBuffer();
        for(int i = 0; i < iTimes; i++)
            buffer.append(iString);

        return buffer.toString();
    }

    /**
     * 生成给定长度填充" "的字符串
     * 
     * @param iLength 字符串长度
     * @return 字符串
     */
    public static String space(int iLength) {
        return newString(" ", iLength);
    }

    /**
     * 得到转化为字节数组的长度
     * 
     * @param iString:原串
     * @return 转化为字节数组的长度
     */
    public static int getLength(String iString) {
        return iString.getBytes().length;
    }

    /**
     * 将字符串转换为GBK字符串
     * 
     * @param iString:原串
     * @return 将原串由ISO8859_1(Unicode)编码转换为GBK编码
     * @exception UnsupportedEncodingException If the named charset is not
     *            supported
     */
    public static String unicodeToGBK(String iString) throws UnsupportedEncodingException {
        String oString = iString;
        if(iString != null)
            oString = new String(iString.getBytes("ISO8859_1"), "GBK");

        return oString;
    }

    /**
     * 将字符串转换为Unicode字符串
     * 
     * @param iString:原串
     * @return 将原串由GBK编码转换为ISO8859_1(Unicode)编码
     * @exception UnsupportedEncodingException If the named charset is not
     *            supported
     */
    public static String GBKToUnicode(String iString) throws UnsupportedEncodingException {
        String oString = iString;
        if(iString != null)
            oString = new String(iString.getBytes("GBK"), "ISO8859_1");

        return oString;
    }

    /**
     * 获取子串在主串中出现 n 次的位置
     * 
     * @param strMain:主字符串，strSub:子字符串，intTimes:出现次数
     * @return 位置值,如果子串在主串中没有出现指定次数,则返回-1
     */
    public static int getPos(String strMain, String strSub, int intTimes) {
        return getPos(strMain, strSub, 0, intTimes);
    }

    /**
     * 获取从指定位置开始子串在主串中出现 n 次的位置
     * 
     * @param strMain:主字符串，strSub:子字符串，intStartIndex:起始位置，intTimes:出现次数
     * @return 位置值,如果从起始位置起子串在主串中没有出现指定次数,则返回-1
     */
    public static int getPos(String strMain, String strSub, int intStartIndex, int intTimes) {
        int intCounter = 0; // 循环记数
        int intPosition = intStartIndex; // 位置记录
        int intLength = strSub.length(); // 子串长度

        if(intTimes <= 0)
            return -1;

        if(strMain.length() - 1 < intStartIndex)
            return -1;

        if(strSub.equals(""))
            return 0;

        while(intCounter < intTimes) {
            intPosition = strMain.indexOf(strSub, intPosition);
            if(intPosition == -1)
                return -1;

            intCounter++;
            intPosition += intLength;
        }

        return intPosition - intLength;
    }

    /**
     * 复制文件
     * 
     * @param fromFile 源文件
     * @param toFile 目的文件
     * @throws FileNotFoundException
     * @throws IOException
     * @throws Exception
     */
    public static void copyFile(String fromFile, String toFile) throws FileNotFoundException,
            IOException, Exception {
        FileInputStream in = new FileInputStream(fromFile);
        FileOutputStream out = new FileOutputStream(toFile);
        byte b[] = new byte[1024];
        int len;
        while((len = in.read(b)) != -1) {
            out.write(b, 0, len);
        }
        out.close();
        in.close();
    }

    /**
     * 字符串替换函数
     * 
     * @param strMain：原串，strFind：查找字符串，strReplaceWith：替换字符串
     * @return 替换后的字符串，如果原串为空或者为""，则返回""
     */
    public static String replace(String strMain, String strFind, String strReplaceWith) {
        String strReturn = "";
        int intStartIndex = 0, intEndIndex = 0;

        if(strMain == null || strMain.equals(""))
            return "";

        while((intEndIndex = strMain.indexOf(strFind, intStartIndex)) > -1) {
            strReturn = strReturn + strMain.substring(intStartIndex, intEndIndex) + strReplaceWith;
            intStartIndex = intEndIndex + strFind.length();
        }

        strReturn = strReturn + strMain.substring(intStartIndex, strMain.length());
        return strReturn;
    }

    /**
     * 将字符串按照指定的分隔字符进行拆分,返回从指定序号的分隔符到前一个分隔符之间的字符串
     * 
     * @param strMain:主字符串，strDelimiters:分隔符，intSerialNo:分隔符序号
     * @return 指定序号的分隔符到前一个分隔符之间的字符串,如果没有找到则返回""
     */
    public static String decodeStr(String strMain, String strDelimiters, int intSerialNo) {
        int posStart = 0;
        int posEnd = 0;
        String strReturn = ""; // 作为返回值的字符串

        if(strMain.length() < strDelimiters.length())
            return ""; // 若主字符串比分隔符串还要短的话,则返回空字符串

        posStart = getPos(strMain, strDelimiters, intSerialNo - 1);
        if(posStart == -1) {
            posStart = 0;
        }
        else {
            posStart = posStart + strDelimiters.length();
        }

        posEnd = getPos(strMain, strDelimiters, intSerialNo);
        if(posEnd == -1) {
            posEnd = 0;
        }

        strReturn = strMain.substring(posStart, posEnd);
        return strReturn;
    }

    /**
     * 使用指定类中的decode()方法解包给定字符串
     * 
     * @param
     * strMessage:字符串，delimiter:分隔符,intCount:解包次数，cl:包含decode()方法的类,并且此类中含有FIELDNUM属性
     * @return 将每个解包数据生成对应的类实例,并将这些实例作为返回Vector的元素
     * @throws Exception 如果查找decode方法出错、或者查找FIELDNUM字段出错、或者解包出错，方法抛出异常
     */
    public static Vector stringToVector(String strMessage, String delimiter, int intCount, Class cl)
            throws Exception {
        int intFieldNum = 0;
        Object object = null;
        Vector vec = new Vector();
        int intPosition = 0;
        Class[] parameters = { String.class };
        Method method = null;
        Field field = null;
        String[] therecord = { new String() };

        try {
            object = cl.newInstance();
            method = cl.getMethod("decode", parameters);
            field = cl.getField("FIELDNUM");
            intFieldNum = field.getInt(object);
            for(int i = 0; i < intCount; i++) {
                object = cl.newInstance();
                intPosition = Str.getPos(strMessage, delimiter, intFieldNum);
                therecord[0] = strMessage.substring(0, intPosition + 1);
                method.invoke(object, therecord);
                vec.addElement(object);
                strMessage = strMessage.substring(intPosition + 1);
            }
        }
        catch(Exception exception) {
            throw exception;
        }
        return vec;
    }

    /**
     * 字符串 转换成HTML格式
     * 
     * @param strInValue：传入字符串
     * @return strOutValue:传入字符串
     */
    public static String toHTMLFormat(String strInValue) {
        String strOutValue = "";
        char c;
        for(int i = 0; i < strInValue.length(); i++) {
            c = strInValue.charAt(i);
            switch(c) {
                case '<':
                    strOutValue += "&lt;";
                    break;
                case '>':
                    strOutValue += "&gt;";
                    break;
                case '\n':
                    strOutValue += "<br>";
                    break;
                case '\r':
                    break;
                case ' ':
                    strOutValue += "&nbsp;";
                    break;
                default:
                    strOutValue += c;
                    break;
            }
        }
        return strOutValue;
    }

    /**
     * 字符串打包
     * 
     * @param strInValue：传入字符串
     * @return strOutValue:传出字符串
     */
    public static String encode(String strInValue) {
        String strOutValue = "";
        char c;

        for(int i = 0; i < strInValue.length(); i++) {
            c = strInValue.charAt(i);
            switch(c) {
                case ':': // hardcode 同Common.js中 NAMEVALUEDELIMITER
                            // //域名与域值的分隔符
                    strOutValue += "："; // hardcode
                    break;
                case '|': // hardcode 同Common.js中 FIELDDELIMITER //域之间的分隔符
                    strOutValue += "┃";
                    break;
                case '\n':
                    strOutValue += "\\n";
                    break;
                case '\r':
                    strOutValue += "\\r";
                    break;
                case '\"':
                    strOutValue += "\\\"";
                    break;
                case '\'':
                    strOutValue += "\\\'";
                    break;
                case '\b':
                    strOutValue += "\\b";
                    break;
                case '\t':
                    strOutValue += "\\t";
                    break;
                case '\f':
                    strOutValue += "\\f";
                    break;
                case '\\':
                    strOutValue += "\\\\";
                    break;
                case '<':
                    strOutValue += "\\<";
                    break;
                case '>':
                    strOutValue += "\\>";
                    break;
                default:
                    strOutValue += c;
                    break;
            }
        }

        return strOutValue;
    }

    /**
     * 字符串型条件的拼串函数
     * 
     * @param strName 字段名
     * @param strValue 匹配值
     * @param strSign 匹配方式
     * @return 条件字串
     */
    public static String convertString(String strName, String strValue, String strSign) {
        String strReturn = "";
        if(strValue == null || strValue.equals("")) {
            return "";
        }
        if(strSign.equals(":")) {
            String strValueStart = "";
            String strValueEnd = "";
            int index = strValue.indexOf(':');
            if(index > -1) {
                strValueStart = strValue.substring(0, index);
                strValueEnd = strValue.substring(index + 1);
                strReturn = " and " + strName + " between '" + strValueStart + "' and '"
                        + strValueEnd + "' ";
            }
            else
                return "";
        }
        else if(strSign.equals("=")) {
            strReturn = " and " + strName + "='" + strValue + "' ";
        }
        else {
            strValue = replace(strValue, "*", "%");
            strReturn = " and " + strName + " like '%" + strValue + "%' ";
        }

        return strReturn;
    }

  /**
   * 日期型条件的拼串函数，使用{@link SysConst}所规定的DBTYPE，并且使用默认的"AND"操作符
   * @param columnName
   * @param columnValue
   * @param strSign
   * @return
   * @throws UserException
   */
  public static String convertDate(String columnName,String columnValue,String strSign)throws UserException{
	  return convertDate(columnName,columnValue,strSign, " AND ");
  }

  /**
   * 日期型条件的拼串函数，使用{@link SysConst}所规定的DBTYPE
   * @param columnName
   * @param columnValue
   * @param strSign
   * @param op 规定该条件是"AND" 还是 "OR"
   * @return
   * @throws UserException
   */
  public static String convertDate(String columnName,String columnValue,String strSign,String op)throws UserException{
	  String strDbType = SysConst.getProperty("DBTYPE");
	  return convertDate(columnName,columnValue,strSign,strDbType, op);
  }
  
  /**
   * 日期型条件的拼串函数
   * @param    columnName   字段名
   * @param    columnValue  匹配值
   * @param    strSign   匹配方式，必须是以下值之一：（=|>|<|>=|<=|:)
   * @param    strDBType 数据库类型，必须是以下值之一：(DB2|ORACLE)
   * @param    op 规定该条件是"AND" 还是 "OR"
   * @return   条件字串 ，带有"AND "或者"OR "前缀
   */
  public static String convertDate(String columnName, String columnValue,
		  String strSign, String strDBType, String op) throws UserException {
	  String strReturn = "";
	  if (columnValue == null || columnValue.equals(""))
		  return "";
	  else {
		  if (":".equals(strSign)) {
			  // 必须是Date类型，否则时分秒的间隔符号也是冒号，会导致出错
			  String strValueStart = "";
			  String strValueEnd = "";
			  int index = columnValue.indexOf(':');
			  if (index > -1) {
				  strValueStart = columnValue.substring(0, index);
				  strValueEnd = columnValue.substring(index + 1);
				  if (DBTYPE_ORACLE.equals(strDBType)) {
					  // strReturn = " between SINOSOFT_to_date('"+ strValueStart +"')
					  // and SINOSOFT_to_date('"+ strValueEnd +"') ";
					  strReturn = " between " + "to_date('" + strValueStart
					  + "', 'yyyy-mm-dd hh24:mi:ss') " + "and "
					  + "to_date('" + strValueEnd
					  + "', 'yyyy-mm-dd hh24:mi:ss') ";
				  } else if (DBTYPE_DB2.equals(strDBType)) {
					  strReturn = " between '" + strValueStart
//					  + getSuffixWhenIsDate(strValueStart,false)
					  + "' and '" + strValueEnd
//					  + getSuffixWhenIsDate(strValueEnd,true) 
					  + "' ";
				  }
			  } else
				  return "";

		  } else if ("=".equals(strSign)){
			  //=类型需要匹配当天所有类型，所以应该也是输出between
			  String beginTimestamp = getBeginTimestampInADate(columnValue);
			  String endTimestamp = getEndTimestampInADate(columnValue);
			  if (strDBType.equals(DBTYPE_ORACLE)) {
				  strReturn = " between " + "to_date('" + beginTimestamp
				  + "', 'yyyy-mm-dd hh24:mi:ss') " + "and "
				  + "to_date('" + endTimestamp 
				  + "', 'yyyy-mm-dd hh24:mi:ss') ";
			  } else if (DBTYPE_DB2.equals(strDBType)) {
				  strReturn = " between '" + beginTimestamp
				  + "' and '" + endTimestamp + "' ";
			  }

		  } else {
			  //其他类型
			  // and p.updatedate >= SINOSOFT_to_date('2006-11-25', 'yyyy-mm-dd')
			  // and ${strName} ${strSign} SINOSOFT_to_date('${strValue}',
			  // 'yyyy-mm-dd')
			  if (DBTYPE_ORACLE.equals(strDBType)) {
				  // strReturn = strName + strSign +"to_date('"+ strValue +"')
				  // ";
				  strReturn = strSign + "to_date('" + columnValue
				  + "', 'yyyy-mm-dd hh24:mi:ss') ";
			  } else if (DBTYPE_DB2.equals(strDBType)) {
				  //如果是"小于等于"的短日期，则取本日的最后时间
				  strReturn = strSign + "'" + columnValue
//				  + getSuffixWhenIsDate(columnValue,"<=".equals(strSign)) 
				  + "' ";
			  }
		  }
		  if (strReturn != null && (!"".equals(strReturn))) {
			  strReturn = " " + op + " " + columnName + strReturn;
		  }
		  return strReturn;
	  }
  }

  /**
   * 
   * @param columnValue
   * @return
   */
  private static String getBeginTimestampInADate(String columnValue) {
	  Calendar cal1 = getCalFromString(columnValue);
      cal1.set(Calendar.HOUR_OF_DAY, 0);
      cal1.set(Calendar.MINUTE, 0);
      cal1.set(Calendar.SECOND, 0);
      cal1.set(Calendar.MILLISECOND, 0);
      return timeStampDefaultFormat.format(cal1.getTime()); 
  }
 
  /**
   * 
   * @param columnValue
   * @return
   */
  private static String getEndTimestampInADate(String columnValue) {
	  Calendar cal1 = getCalFromString(columnValue);
	  cal1.set(Calendar.HOUR_OF_DAY, 23);
	  cal1.set(Calendar.MINUTE, 59);
	  cal1.set(Calendar.SECOND, 59);
	  cal1.set(Calendar.MILLISECOND, 999);
	  return timeStampDefaultFormat.format(cal1.getTime());
  }
  
  private static Calendar getCalFromString(String columnValue) {
	  java.util.Date date = null;
	  try {
		  date = timeStampDefaultFormat.parse(columnValue);
	  } catch (ParseException e) {
		  try {
			  date = dateDefaultFormat.parse(columnValue);
		  } catch (ParseException e1) {
			  e1.printStackTrace();
			  throw new RuntimeException(
					  "The string["+columnValue+"] is not a date or a timestamp."
					  + "Please check the parameter", e1);
		  }
	  }
	  Calendar cal = Calendar.getInstance();
	  Calendar cal1 = Calendar.getInstance();
	  cal.setTime(date);
	  cal1.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DATE));
	  return cal1;
  }
  
  /**
   * if columnValue is a string for date, return " 00:00:00"
   * @param columnValue
   * @param isForEndOfDay if true, return " 23:59:59" instead of " 00:00:00"
   * @return
   */
  /*
  private static String getSuffixWhenIsDate(String columnValue, boolean isForEndOfDay) {

	  try {
		  timeStampDefaultFormat.parse(columnValue);
		  // if columnValue is timestamp format, suffix should be empty, ""
		  return "";
	  } catch (ParseException e) {
		  try {
			  dateDefaultFormat.parse(columnValue);
			  // if columnValue is timestamp format, suffix should be 
			  // " 00:00:00" or " 23:59:59"
			  if (isForEndOfDay){
				  return " 23:59:59";
			  }else{
				  return " 00:00:00";
			  }
		  } catch (ParseException e1) {
			  // not date format either, so there must be something wrong.
			  e1.printStackTrace();
			  throw new RuntimeException(
					  "The string is not a date or a timestamp."
					  + "Please check the parameter", e1);
		  }
	  }
  }
  */
  public static String getNextValString(String sequenceName) throws UserException{
	  String strDbType = SysConst.getProperty("DBTYPE");
	  if (DBTYPE_ORACLE.equals(strDbType)){
		  return " "+sequenceName+".NextVal ";
	  }else if (DBTYPE_DB2.equals(strDbType)){
		  return " NextVal for "+sequenceName+" ";
	  }
	  throw new RuntimeException("Wrong DB Type");
  }


    /**
     * 数值型条件的拼串函数
     * 
     * @param strName 字段名
     * @param strValue 匹配值
     * @param strSign 匹配方式
     * @return 条件字串
     */
    public static String convertNumber(String strName, String strValue, String strSign) {
        String strReturn = "";
        if(strValue == null || strValue.equals("")) {
            return "";
        }
        if(strSign.equals(":")) {
            String strValueStart = "";
            String strValueEnd = "";
            int index = strValue.indexOf(':');
            if(index > -1) {
                strValueStart = strValue.substring(0, index);
                strValueEnd = strValue.substring(index + 1);
                strReturn = " and " + strName + " between " + strValueStart + " and "
                        + strValueEnd + " ";
            }
            else
                return "";
        }
        else {
            strReturn = " and " + strName + strSign + strValue + " ";
        }

        return strReturn;
    }

    /**
     * 字符串解包
     * 
     * @param strInValue：传入字符串
     * @return strOutValue:传入字符串
     */
    public static String decode(String strInValue) {
        String strOutValue = strInValue;
        strOutValue = replace(strOutValue, "\\n", "\n");
        strOutValue = replace(strOutValue, "\\r", "\r");
        strOutValue = replace(strOutValue, "\\\\", "\\");
        strOutValue = replace(strOutValue, "\\b", "\b");
        strOutValue = replace(strOutValue, "\\t", "\t");
        strOutValue = replace(strOutValue, "\\\"", "\"");
        strOutValue = replace(strOutValue, "\\\'", "\'");
        strOutValue = replace(strOutValue, "\\f", "\f");
        strOutValue = replace(strOutValue, "\\<", "<");
        strOutValue = replace(strOutValue, "\\>", ">");
        return strOutValue;
    }

    /**
     * 将指定的字符串按给定的最大长度进行分割，返回分割后的字符串数组
     * 
     * @param strMain：被拆分的串
     * @param intMaxLength：每一行结果串的长度最大值
     * @return Object 分割字符串后的字符串数组
     */
    public static Object split(String strMain, int intMaxLength) {
        if(strMain == null)
            return new String[0];

        if(strMain.trim().equals(""))
            return new String[0];

        byte[] arrByte = {}; // 被拆分的字符串生成的Byte数组
        int intEndIndex = 0; // 游标终止位置
        int intStartIndex = 0; // 游标起始位置
        int intCount = 0; // 拆分的字符串的个数
        int i, j = 0; // 循环变量
        String[] arrReturn = {}; // 返回值

        arrByte = strMain.getBytes();
        intCount = Math.round((arrByte.length / intMaxLength + 0.5f));
        arrReturn = new String[intCount];

        for(i = 0; i < intCount; i++) {
            // 默认游标终止位置＝累加固定长度
            if(intEndIndex == 0)
                intEndIndex = intMaxLength - 1;
            else
                intEndIndex += intMaxLength;
            // 当游标终止位置大于Byte数组长度，说明越界，更新游标终止位置为Byte数组最后的位置
            intEndIndex = Math.min(intEndIndex, arrByte.length - 1);

            // 小于0，说明是汉字的一部分
            if(arrByte[intEndIndex] < 0) {
                j = intEndIndex - 1;
                while(arrByte[j] < 0) {
                    j--;
                    if(j < intStartIndex)
                        break;
                }
                // 判断最后的两个是否构成一个汉字
                if((intEndIndex - j) % 2 != 0) {
                    intEndIndex--;
                }
            }
            arrReturn[i] = new String(arrByte, intStartIndex, intEndIndex - intStartIndex + 1);
            if(intEndIndex == arrByte.length - 1)
                break;
            intStartIndex = intEndIndex + 1;
        }
        return arrReturn;
    }

    /**
     * 转换数值字符串，当字符串变量的值为""或者为空时,将其转换为字符串"0"
     * 
     * @param iValue：字符串
     * @return 转换后的字符串
     */
    public static String chgStrZero(String iValue) {
        String value = null;

        if(iValue == null)
            value = "0";
        else if(iValue.trim().length() == 0)
            value = "0";
        else
            value = iValue;

        return value.trim();
    }

    /**
     * 获取系统日期中的年份
     * 
     * @param 无
     * @return 年
     */
    public static String getYear() {
        String strReturn = "";
        int intYear = Calendar.getInstance().get(Calendar.YEAR);
        strReturn = "" + intYear;
        return strReturn;
    }

    /**
     * 获取系统日期中的月份
     * 
     * @param strDate：日期
     * @return 月
     */
    public static String getMonth() {
        String strReturn = "";
        int intMonth = Calendar.getInstance().get(Calendar.MONTH) + 1;
        if(intMonth < 10)
            strReturn = "0" + intMonth;
        else
            strReturn = "" + intMonth;
        return strReturn;
    }

    /**
     * 获取系统日期值中的天
     * 
     * @param 无
     * @return 天
     */
    public static String getDay() {
        String strReturn = "";
        int intDate = Calendar.getInstance().get(Calendar.DATE);
        if(intDate < 10)
            strReturn = "0" + intDate;
        else
            strReturn = "" + intDate;

        return strReturn;
    }

    /**
     * 获取系统时间值中的小时
     * 
     * @param 无
     * @return 小时
     */
    public static String getHour() {
        String strReturn = "";
        int intHour = Calendar.getInstance().get(Calendar.HOUR) + (Calendar.HOUR_OF_DAY + 1)
                * Calendar.getInstance().get(Calendar.AM_PM);
        if(intHour < 10)
            strReturn = "0" + intHour;
        else
            strReturn = "" + intHour;

        return strReturn;
    }

    /**
     * 获取系统时间值中的分钟
     * 
     * @param 无
     * @return 分钟
     */
    public static String getMinute() {
        String strReturn = "";
        int intMinute = Calendar.getInstance().get(Calendar.MINUTE);
        if(intMinute < 10)
            strReturn = "0" + intMinute;
        else
            strReturn = "" + intMinute;

        return strReturn;
    }

    /**
     * 获取系统时间值中秒数
     * 
     * @param 无
     * @return 秒数
     */
    public static String getSecond() {
        String strReturn = "";
        int intSecond = Calendar.getInstance().get(Calendar.SECOND);
        if(intSecond < 10)
            strReturn = "0" + intSecond;
        else
            strReturn = "" + intSecond;

        return strReturn;
    }

    /**
     * 将字符串按照指定的分隔字符进行拆分,返回拆分后的字符串数组
     * 
     * @param strIn:待拆分的字符串，strDelimiters:分隔符
     * @return 字符串数组
     */
    public static String[] split(String strIn, String strDelimiters) throws Exception {
        int theIndex = 0;
        String[] arrReturn = null; // 返回值字符串数组
        String strErrorMessage = ""; // 错误信息
        int intCount = 0; // 数组的大小

        if(strIn.equals("") || strIn == null || strDelimiters.equals("") || strDelimiters == null) {
            strErrorMessage = "Str.split('" + strIn + "','" + strDelimiters
                    + "'): 待拆分字符串和分隔符串都不能为空";
            throw new Exception(strErrorMessage); // 待拆分字符串和分隔符串都不能为空
        }

        if(strIn.length() < strDelimiters.length()) {
            strErrorMessage = "Str.split('" + strIn + "','" + strDelimiters + "'): 待拆分字符串比分隔符串还要短";
            throw new Exception(strErrorMessage); // 待拆分字符串比分隔符串还要短
        }

        // 计算字符串有多少个分隔符
        String strTemp = strIn;
        while(strTemp != "" && strTemp != null) {
            theIndex = strTemp.indexOf(strDelimiters);
            if(theIndex == -1) {
                break;
            }
            intCount++;
            strTemp = strTemp.substring(theIndex + strDelimiters.length());
        }
        arrReturn = new String[++intCount];

        // 生成字符串数组
        for(int i = 0; i < intCount - 1; i++) {
            theIndex = strIn.indexOf(strDelimiters);
            arrReturn[i] = strIn.substring(0, theIndex);
            strIn = strIn.substring(theIndex + strDelimiters.length());
        }
        arrReturn[intCount - 1] = strIn;

        return arrReturn;
    }

    /**
     * 截取字符串右边的空串
     * 
     * @param strIn:原字符串
     * @return 截掉右边空串后的字符串
     */
    public static String rightTrim(String strIn) {
        String strReturn = "";
        int intLength = 0;

        if(strIn == null || strIn.equals("") || strIn.equals("null"))
            return "";
        intLength = strIn.length();

        while(intLength > 0 && strIn.substring(intLength - 1, intLength).equals(" ")) {
            strIn = strIn.substring(0, intLength - 1);
            intLength = strIn.length();
        }

        strReturn = strIn;
        return strReturn;
    }

    /**
     * author:zhanqiang 20040224 提供精确的小数位四舍五入处理。
     * 
     * @param v 需要四舍五入的数字
     * 
     * @param scale 小数点后保留几位
     * 
     * @return 四舍五入后的结果
     * 
     */

    public static double round(double v, int scale) {
        BigDecimal b = new BigDecimal(Double.toString(v));

        BigDecimal one = new BigDecimal("1");

        return b.divide(one, scale, BigDecimal.ROUND_HALF_UP).doubleValue();
    }
    /**
     * 数值型条件的拼串函数
     * 
     * @param strName 字段名
     * @param strValue 匹配值
     * @param strSign 匹配方式
     * @return 条件字串
     */
    public static String convertInt(String strName, String strValue, String strSign) {
        String strReturn = "";
        if(strValue == null || strValue.equals("")) {
            return "";
        }
        if(strSign.equals(":")) {
            String strValueStart = "";
            String strValueEnd = "";
            int index = strValue.indexOf(':');
            if(index > -1) {
                strValueStart = strValue.substring(0, index);
                strValueEnd = strValue.substring(index + 1);
                strReturn = " and " + strName + " between '" + strValueStart + "' and '"
                        + strValueEnd + "' ";
            }
            else
                return "";
        }
        else {
            strReturn = " and " + strName + strSign  + strValue ;
        }

        return strReturn;
    }
    /**
     * inputStream转byte[]
     * 
     */
	public static byte[] toByteArray(InputStream fileStream) throws IOException {
		// TODO Auto-generated method stub
		ByteArrayOutputStream out=new ByteArrayOutputStream();
        byte[] buffer=new byte[1024];
        int n=0;
        while ( (n=fileStream.read(buffer)) !=-1) {
            out.write(buffer,0,n);
        }
        return out.toByteArray();
	}
    /**
     * main method
     * 
     * @param args
     */
    public static void main(String[] args) throws Exception {
        String str = null;
//        str = Str.convertString(args[0], args[1], args[2]);
        str = getBeginTimestampInADate("2007-06-20");
        System.out.println(str);
    }
}
