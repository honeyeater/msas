package com.sinosoft.msas.util;

import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;


/**
 *@Title: 常量类，定义一些常量值
 *@Description:
 *@Author:YJX
 *@Since:2015-8-11 下午01:57:33
 *@Version:1.0.0
 *@Copyright (c) 中科软科技股份有限公司-版权所有
 */
 
public class Constant {

	   public static final int PAGESIZE = 10;  //分页定义的每页大小
	   
	   public static final String PASSWORD="111111";//新增用户信息默认密码
	   
	   public static final int LEVEL1 = 1;//级别1代表分公司
	   
	   public static final int LEVEL2 = 2;//级别1代表区域
	   
	   public static final int TIME_MINIUTE =1;//1分钟
	   
	   public static final String TREENAME ="财险总公司";//点击头信息时默认当前位置为天安财险
	   
	   public static final String USERURL = "/msplatform/pages/frame/main.jsp";//客户端登入地址
	   
	   public static final String MANAGEURL = "/msplatform/pages/frame/admin_manage.jsp";//管理中心登入地址
	   
	   /** 设备在线时间差 --设置的时间比心跳时间长一些*/
	   public static final int DEVICEUUID = 20;
	   
	   /** 视图区分机构类型:1机构 2-区域	*/
	   public static final String COMTYPE="1";
	   public static final String LOCTYPE="2";
	   
	   /**统计案件补传数量标示   start*/
	   public static final int REUPLOADFLAG1=1;//待补传
	   public static final int REUPLOADFLAG2=2;//已补传待审核
	   public static final int REUPLOADFLAG3=3;//审核不通过待补传
	   public static final int REUPLOADFLAG4=4;//审核通过
	   
	   /*-案件状态start-*/
	   public static final int CASE_NOCONNECT = 0;//未连接
	   public static final int CASE_CONNECTSUCCESS = 1;//连接成功
	   public static final int CASE_VIDEOFINISH = 2;//视频完成
	   public static final int CASE_APPLYSCHE = 3;//申请改派
	   public static final int CASE_SCHEFINISH = 4;//改派完成
	   public static final int CASE_BEFORE_CONNECTCANCEL = 5;//连线前注销
	   public static final int CASE_AFTER_CONNECTCANCEL = 6;//连线后注销
	   public static final int CASE_UPLOADFINISH = 8;//上传完成
	   
	   public static final String NOCASE_UUID = "******";//用于查勘平台没有的案件
	   
	   public static final TreeMap <String, String> CASESTATUSMAP = new TreeMap<String, String>();//案件状态名对应案件状态值  
	   static {  
		   CASESTATUSMAP.put("0", "待处理");  
		   CASESTATUSMAP.put("1", "连接成功");  
		   CASESTATUSMAP.put("2", "取证完成");  
		   CASESTATUSMAP.put("3", "申请改派");  
		   CASESTATUSMAP.put("4", "改派完成");  
		   CASESTATUSMAP.put("5", "取证前注销");  
		   CASESTATUSMAP.put("6", "取证后注销");  
		   CASESTATUSMAP.put("8", "上传成功");  
	   } 
	   /*-案件状态end-*/
	   
	   /*-案件类型start-*/
	   public static final TreeMap <String, String> CASETYPESMAP = new TreeMap<String, String>();
	   static {  
		   CASETYPESMAP.put("1", "自助");  
		   CASETYPESMAP.put("2", "查勘员");  
		   CASETYPESMAP.put("3", "修理厂");  
	   } 
	   /*-案件类型end-*/
	   
	   /*图片类型start-*/
	   public static final TreeMap <String, String> UPLOADIMGTYPEMAP = new TreeMap<String, String>();
	   static {
		   UPLOADIMGTYPEMAP.put("0", "视频"); 
		   UPLOADIMGTYPEMAP.put("00", "补传照片");
		   UPLOADIMGTYPEMAP.put("01", "引擎盖");  
		   UPLOADIMGTYPEMAP.put("02", "左前车门");  
		   UPLOADIMGTYPEMAP.put("03", "左后车门");  
		   UPLOADIMGTYPEMAP.put("04", "前保险杠");  
		   UPLOADIMGTYPEMAP.put("05", "左前翼子板");  
		   UPLOADIMGTYPEMAP.put("06", "左后翼子板");  
		   UPLOADIMGTYPEMAP.put("07", "车顶");  
		   UPLOADIMGTYPEMAP.put("08", "后备箱盖");  
		   UPLOADIMGTYPEMAP.put("09", "右后翼子板");  
		   UPLOADIMGTYPEMAP.put("10", "右前翼子板");  
		   UPLOADIMGTYPEMAP.put("11", "后保险杠");  
		   UPLOADIMGTYPEMAP.put("12", "右后车门");  
		   UPLOADIMGTYPEMAP.put("13", "右前车门");  
		   UPLOADIMGTYPEMAP.put("14", "45度全景图");  
		   UPLOADIMGTYPEMAP.put("15", "车架号");  
		    
		   UPLOADIMGTYPEMAP.put("17", "理赔资料");  
	   } 
	   /*-图片类型end-*/
	   
	   /*-用户类型start-*/
	   public static final TreeMap <String, String> USERTYPESMAP = new TreeMap<String, String>();
	   static {  
		   USERTYPESMAP.put("1", "管理员");  
		   USERTYPESMAP.put("2", "核损员");  
		   USERTYPESMAP.put("3", "理算员");  
	   } 
	   /*-用户类型end-*/
	   
	   /*-安装包类型和系统代码start-*/
	   public static final TreeMap <String, String> APPTYPESMAP = new TreeMap<String, String>();
	   public static final TreeMap <String, String> SYSTEMCODESMAP = new TreeMap<String, String>(); 
	   static {  
		   APPTYPESMAP.put("1", "ios");  
		   APPTYPESMAP.put("2", "Android");  
		   SYSTEMCODESMAP.put("1", "移动查勘");  
		   SYSTEMCODESMAP.put("2", "自助查勘");  
	   } 
	   /*-安装包类型和系统代码end-*/
	   
	   /*-核损员状态和理算员状态start-*/
	   public static final TreeMap <String, String> HESUNSTATUSMAP = new TreeMap<String, String>();
	   public static final String[] HESUNSTATUSSTR = new String[]{"离线数","空闲数","离开数","繁忙数"};
	   public static final TreeMap <String, String> LISUANSTATUSMAP = new TreeMap<String, String>(); 
	   public static final String[] LISUANSTATUSSTR = new String[]{"离线数","在线数"};
	   static {  
		   HESUNSTATUSMAP.put("0", "离线");  
		   HESUNSTATUSMAP.put("1", "空闲");  
		   HESUNSTATUSMAP.put("2", "繁忙");  
		   HESUNSTATUSMAP.put("3", "离开");  
		   LISUANSTATUSMAP.put("0", "离线");  
		   LISUANSTATUSMAP.put("1", "在线");  
	   } 
	   /*-安装包类型和系统代码end-*/
	   
	   /*-案件处理详情-案件类型start-*/
	   public static final TreeMap <String, String> CASEDETAILSTATUSMAP = new TreeMap<String, String>();
	   static {  
		   CASEDETAILSTATUSMAP.put("0", "待受理案件");  
		   CASEDETAILSTATUSMAP.put("1", "正在处理案件");  
	   } 
	   /*-案件处理详情-案件类型end-*/
	   
	   /*-自助补传照片-案件类型start-*/
	   public static final TreeMap <String, String> REUPLODCASESTATUSMAP = new TreeMap<String, String>();
	   static {  
		   REUPLODCASESTATUSMAP.put("1", "待补传");  
		   REUPLODCASESTATUSMAP.put("2", "已补传待审核");  
		   REUPLODCASESTATUSMAP.put("3", "审核不通过待补传");  
		   REUPLODCASESTATUSMAP.put("4", "审核通过");  
	   } 
	   /*-自助补传照片-案件类型end-*/
	   
	   /*-定损单状态start-*/
	   public static final int LOSS_TBC = 1;//定损完成待确认
	   public static final int LOSS_CLIENTREFUSE = 2;//客户拒绝
	   public static final int LOSS_CLIENTAGREE = 3;//客户同意
	   public static final int LOSS_CONCERTAGREE = 4;//协调同意
	   public static final int LOSS_FINALREFUSE = 5;//最终拒绝
	   /*-定损单状态end-*/
	   
	   /*文件上传到oss服务器的类型*/
	   public static final  Map<String,String> MIMETYPE_MAP = new HashMap<String,String>();
	   
	   //mysql uuid函数字符串
	   public static final String MYSQL_UUID = "replace(uuid(),'-','')";
	   //天安保险公司标识
	   public static final String TAICFLAG = "TAIC"; 
	   //mime文件类型
	   static{
		   MIMETYPE_MAP.put("JPG", "image/jpeg");
		   MIMETYPE_MAP.put("GIF", "image/gif");
		   MIMETYPE_MAP.put("BMP", "image/bmp");
		   MIMETYPE_MAP.put("TXT", "text/plain");
		   MIMETYPE_MAP.put("PDF", "application/pdf");
		   MIMETYPE_MAP.put("EXCEl", "application/msexcel");
		   MIMETYPE_MAP.put("MPG", "video/mpeg");
		   MIMETYPE_MAP.put("AVI", "video/x-msvideo");
		   MIMETYPE_MAP.put("mp4", "video/mpeg4");
		   MIMETYPE_MAP.put("jpg", "image/jpeg");
	   }
	   
	   /**上传plist文件的内容*/
	   public static final String PLISTCONTENTONE= "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
			+"<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">"
			+"<plist version=\"1.0\"><dict><key>items</key><array><dict><key>assets</key><array><dict>"
			+"<key>kind</key><string>software-package</string><key>url</key><string>";
	   public static final String PLISTCONTENTTWO= "</string></dict></array><key>metadata</key><dict><key>bundle-identifier</key>"
			+"<string>com.liveneo.tianan</string><key>bundle-version</key><string>";
	   public static final String PLISTCONTENTTHREE= "</string><key>kind</key><string>software</string><key>title</key>"
			+"<string>天安移动视频查勘</string></dict></dict></array></dict></plist>";
	   /**上传plist的文件名*/
	   public static final String PLISTPACKAGENAME = "uploadPlist.plist";
	   
	   /**
		 * 理赔接口常量
		 */
	   public static final String CLAIM_CLIENTS_APPLYTURNPERSON = "32";//客户申请人工查勘
	   public static final String CLAIM_NUCLEARDAMAGE_APPLYTURNPERSON = "34";//核损申请人工查勘
	   public static final String CLAIM_NORMALEND = "40";//案件正常结束
	   
	   /**登录平台*/
	   public static final Integer LOGINPLAT_WEB = 1;//网页 
	   public static final Integer LOGINPLAT_ANDRIOD = 2;//安卓端
	   public static final Integer LOGINPLAT_IOS = 1;//苹果端
	   
	   /**个推服务常量 */
	   //移动查勘安卓个推常量
	   public static final String GETUI_SURVEYANDROID_APPID        = "UOKhso2wdf5alkt42YQp32";//
	   public static final String GETUI_SURVEYANDROID_APPKEY       = "xtBuWKfMyz5nN8ClFYONa2";//
	   public static final String GETUI_SURVEYANDROID_APPSECRET    = "d4Lrght8ZV7hD4MT3cCbr5";//
	   public static final String GETUI_SURVEYANDROID_MASTERSECRET = "5MVTirYrvhAsCDJtjmcra4";//
	   public static final String GETUI_SURVEYANDROID_HOST         = "http://sdk.open.api.igexin.com/apiex.htm";//

	   //移动查勘ios个推常量
	   public static final String GETUI_SURVEYIOS_APPID        = "2htTwbHaqt5uRFYWs9Gg04";//
	   public static final String GETUI_SURVEYIOS_APPKEY       = "0Yqtf0k3Wt9uMnAvO6YhR2";//
	   public static final String GETUI_SURVEYIOS_APPSECRET    = "kGn7TpfgvgAjLsvzpDK8M1";//
	   public static final String GETUI_SURVEYIOS_MASTERSECRET = "HQv3XWPVD79p2TqnbvAGK1";//
	   public static final String GETUI_SURVEYIOS_HOST         = "http://sdk.open.api.igexin.com/apiex.htm";//
	   
	   //自助查勘安卓个推常量
	   public static final String GETUI_SELFANDROID_APPID        = "dJ83JAfYqr9MHigAN8OO7A";//
	   public static final String GETUI_SELFANDROID_APPKEY       = "jCdb942U13AC3VcKXRxPX1";//
	   public static final String GETUI_SELFANDROID_APPSECRET    = "Fs4dvnjSDi5iJyBJQ9UV54";//
	   public static final String GETUI_SELFANDROID_MASTERSECRET = "kDjjm37Rer5esmLsOOve57";//
	   public static final String GETUI_SELFANDROID_HOST         = "http://sdk.open.api.igexin.com/apiex.htm";//
	   
	   //自助查勘ios个推常量
	   public static final String GETUI_SELFIOS_APPID        = "dJ83JAfYqr9MHigAN8OO7A";//
	   public static final String GETUI_SELFIOS_APPKEY       = "jCdb942U13AC3VcKXRxPX1";//
	   public static final String GETUI_SELFIOS_APPSECRET    = "Fs4dvnjSDi5iJyBJQ9UV54";//
	   public static final String GETUI_SELFIOS_MASTERSECRET = "kDjjm37Rer5esmLsOOve57";//
	   public static final String GETUI_SELFIOS_HOST         = "http://sdk.open.api.igexin.com/apiex.htm";//
	   
	   /**推送消息类型*/
	   public static final Integer NEWSTYPE_REGISTER      = 1;//新案件/报案推送
	   public static final Integer NEWSTYPE_VIDEOFINISH   = 2;//视频完成推送
	   public static final Integer NEWSTYPE_DAMAGEFINISH  = 3;//核损完成推送
	   public static final Integer NEWSTYPE_PICTUREUPLOAD = 4;//单证补传推送
	   public static final Integer NEWSTYPE_SCHEFINISH    = 5;//案件已改派
	   public static final Integer NEWSTYPE_TURNPERSON    = 6;//案件转人工推送
	   public static final Integer NEWSTYPE_CANCLE        = 7;//案件注销推送
	   public static final Integer NEWSTYPE_TURNNORMAL    = 8;//案件转正常案件推送
	   public static final Integer NEWSTYPE_PAPERUPLOAD   = 9;//纸质单证补传推送
	   public static final Integer NEWSTYPE_FEEDBACKRESULT= 10;//客户拒绝后再协商结果推送
	   public static final Integer NEWSTYPE_PAPERFINISH= 11;//纸质单证完成
	   public static final Integer NEWSTYPE_AGAINDISPATCH= 12;//案件重派
	   
	   public static final String LOCALIMG_PATH  = "D://pics/";//本地图片地址
	   
	   public static final String USER_ENDTIME = "2099-12-31";//默认用户过期时间

	   /**	平台用户状态--0空闲 1繁忙 2离开  */
	   public static final String PLATFORM_USERFREE = "0";//平台用户状态--0空闲
	   public static final String PLATFORM_USERONLINE = "1";//平台用户状态--1繁忙
	   public static final String PLATFORM_USERLEAVE  = "2";//平台用户状态--2离开
	   
	   /**	调度引擎用户状态--04调整为离开 05调整为空闲 06调整为繁忙 */
	   public static final String DISPATCH_USERLEAVE = "04";//调度引擎用户状态--04调整为离开
	   public static final String DISPATCH_USERFREE = "05";//调度引擎用户状态--05调整为空闲 
	   public static final String DISPATCH_USERONLINE = "06";//调度引擎用户状态--06调整为繁忙
	   
	   /**	使用标识：1:客户,2:查勘员,3:修理厂'*/
	   public static final String MOBILEUSER_CUSTOMER = "1"; 
	   public static final String MOBILEUSER_SURVEY = "2"; 
	   public static final String MOBILEUSER_GARAGE = "3"; 
	   
	   public static final String MOBILETYPE_CUSTOMER = "客户";
	   public static final String MOBILETYPE_SURVEY = "查勘员";
	   public static final String MOBILETYPE_GARAGE = "修理厂";
	   
	   public static final String CASEEND_TURNPERSONSURVEY = "2";//核损申请转人工查勘
	   
	   public static final Integer REASSIGNPLAT_WEB = 1;//改派平台--平台
	   public static final Integer REASSIGNPLAT_PHONE = 2;//改派平台--手机端
	   public static final Integer REASSIGNTYPE_SURVEY = 1;//改派类型-- 1-查勘  
	   public static final Integer REASSIGNTYPE_LOSS = 2;//改派类型-- 2-定损  
	   public static final Integer REASSIGNTYPE_PERSON = 3;//改派类型-- 3-人工查勘
	   public static final Integer REASSIGNTYPE_VIDEONORMALEND = 8;//改派类型-- 8-视频正常结束  
	   public static final Integer REASSIGNTYPE_IMGNORMALEND = 9;//改派类型-- 9-拍照查勘正常结束
	   
	   public static final Integer MOBILEPLAT_ANDROID = 1;//手机平台--安卓
	   public static final Integer MOBILEPLAT_IOS = 2;	  //手机平台--苹果
	   public static final Integer MOBILEPLAT_OTHERS = 3; //手机平台--苹果
	   
	   //后台预占排队常量
	   public static final String CAMPONQUEUE_SUCCESS = "1";
	   public static final String CAMPONQUEUE_REQUESTFAIL = "2";
	   public static final String CAMPONQUEUE_CAMPONFAIL = "3";
	   public static final String CAMPONQUEUE_REQUESTSUCCESS = "4";
	   
	   //默认查勘员坐席密码
	   public static final String VIDEO_USER_PASSWORD = "Abc123";
	   
	   //查询推送消息失败日志表(这里查询做个控制，只查询10分钟之前已在PrpmSendFailLog中存在，防止已推送成功（数据已放入faillog表），手机端回调（删除faillog）延迟，重复发送)
	   public static final int  MESSAGE_TIMETASK_BEFORE_TIME = 10;
	   
}
