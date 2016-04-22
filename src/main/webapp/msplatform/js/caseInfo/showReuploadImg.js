var uuidList = new Array();// 照片集
var index;// 照片对应数据库下标
var totalPage;// 照片统计
var du = 0;// 照片旋转初始化
var num = 0;//高版本IE浏览器（10、11）旋转标示
function init(uuid, caseUuid) {
	var url = contextRootPath + "/caseInfo/caseInfo_findReuploadImgInit";
	$.ajax({
		type : "POST",
		url : url,
		async : false,
		data : {
			"uuid" : uuid,
			"caseUuid" : caseUuid
		},
		success : function(data) {
			var data = $.parseJSON(data);
			uuidList = data;
			if (data != null) {
				totalPage = data.length;
				$("#totalPager").html(totalPage);
				for ( var i = 0; i < totalPage; i++) {
					if (uuid == data[i].uuid) {
						index = i;
						var ossUuid = data[i].ossUuid;
						$("#pager").html(index + 1);
						ossUuid = contextRootPath+"/uploadImg/uploadImg_showPhotos?ossUuid="+ossUuid;
						$("#pic").attr("src", ossUuid);
						
					}
				}
			}
		}
	});
}

/** 翻页：0-上一页 1-下一页 */
function pageChange(page) {
	turnReset()
	if (page == 0) {
		if (index == 0) {
			index = totalPage - 1;
		} else {
			index = index - 1;
		}
	}
	if (page == 1) {
		if (index == (totalPage - 1)) {
			index = 0;
		} else {
			index = index + 1;
		}
	}
	for ( var i = 0; i < totalPage + 1; i++) {
		if (i == index) {
			var ossUuid = uuidList[i].ossUuid;
			$("#pager").html(index + 1);
			ossUuid = contextRootPath+"/uploadImg/uploadImg_showPhotos?ossUuid="+ossUuid;
			$("#pic").attr("src", ossUuid);
		}
	}
}

function turnReset(){
	//高版本浏览器不支持滤镜--使用css3自带方法
	if (!document.body.filters) {
		$("#pic").css('transform', 'rotate(0deg)');
		num = 0;
	}
	var img = document.getElementById("pic");
	var imgindex = 0;
	img.style.filter = "progid:DXImageTransform.Microsoft.BasicImage(Rotation=" + imgindex + ")";
}

/****************************完美分割线**********************************/
//顺时针旋转
function rotateImage_shun()
{
	//高版本浏览器不支持滤镜--使用css3自带方法
	if (!document.body.filters) {
		if (num == -3) {
			$("#pic").css("transform", "rotate(0deg)");
			num = 0;
		} else {
			$("#pic").css("transform","rotate(" + 90 * (num - 1) + "deg)");
			num--;
		}
		return;
	}
  var index = 0;
  var img = document.getElementById("pic");
  var tmpFilter = img.style.filter;
  var imgindex = 0;
  imgindex = parseInt(tmpFilter.charAt(tmpFilter.length - 2));
  if (!isFinite(imgindex))
  {
      imgindex = 1;
  }
  else
  {
      imgindex = imgindex + 1;
      if (imgindex > 3)
      {
          imgindex = 0;
      }
  }
  img.style.filter = "progid:DXImageTransform.Microsoft.BasicImage(Rotation=" + imgindex + ")";
}
/****************************完美分割线**********************************/
//逆时针旋转
function rotateImage_ni()
{
	//高版本浏览器不支持滤镜--使用css3自带方法
	if (!document.body.filters) {
		if (num == 3) {
			$("#pic").css("transform", "rotate(0deg)");
			num = 0;
		} else {
			$("#pic").css("transform","rotate(" + 90 * (num + 1) + "deg)");
			num++;
		}
		return;
	}
	
  var img = document.getElementById("pic");

  var tmpFilter = img.style.filter;

  var imgindex = 3;
  imgindex = parseInt(tmpFilter.charAt(tmpFilter.length - 2));

  if (!isFinite(imgindex))
  { //first time
      imgindex = 3;
  }
  else
  {
      imgindex = imgindex - 1;
      if (imgindex < 0)
      {
          imgindex = 3;
      }
  }
  img.style.filter = "progid:DXImageTransform.Microsoft.BasicImage(Rotation=" + imgindex + ")";
}

//var s;//删除标示位
//var newUuid;//删除后的下标统一往前移一位
//function deleteImg(uuid,caseUuid){
//	for ( var i = 0; i < totalPage; i++) {
//		if (uuid == uuidList[i].uuid) {
//			s = i;
//			if(s == 0){
//				newUuid = uuidList[totalPage-1].uuid;
//			}else{
//				newUuid = uuidList[s-1].uuid;
//			}
//		}
//	}
//	if(confirm("确定删除吗？")){
////		window.parent.document.getElementsByName("pageForm").action = contextRootPath + "/caseInfo/caseInfo_deleteReuploadImg?uuid="+uuid+"&caseUuid="+caseUuid;
////		window.parent.document.getElementsByName("pageForm").submit();
//		window.opener.location.reload(); 
//		init(newUuid,caseUuid);
//	}
//}