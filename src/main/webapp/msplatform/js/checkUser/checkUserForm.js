
function send(){
	 var successFlag = "1";  //默认成功 
	 $("input").each(function(){
		 if(typeof($(this).attr("checkKey"))=="undefined"){
			 //alert("不包含checkKey");
		 }else{
			 if(!checkField(this)){
				 successFlag = "0";
				 //return false;
			 }
		 }
	 } );
	 $("select").each(function(){
		 if(typeof($(this).attr("checkKey"))=="undefined"){
			 //alert("不包含checkKey");
		 }else{
			 if(!checkField(this)){
				 successFlag = "0";
				 //return false;
			 }
		 }
	 } );
	 $("textarea").each(function(){
		 if(typeof($(this).attr("checkKey"))=="undefined"){
			 //alert("不包含checkKey");
		 }else{
			 if(!checkField(this)){
				 successFlag = "0";
				 //return false;
			 }
		 }
	 } );
	 //所有校验通过 提交表单
	 if(successFlag == 1){
		 surveyForm.submit();
	 }
}


