<!DOCTYPE HTML>
<html>
<head>
<title></title>
<script type="text/javascript">
	function addUrl() {
		var obj = window.dialogArguments;
		var videoUrl = obj.ossUuid;
		document.getElementById("v1").src=videoUrl;
        document.getElementById("media").load();
	}
</script>
</head>
<body onload="addUrl();">
	<video width="800px" height="600px"
		controls="controls" id="media" autoplay="autoplay">
		  <source id="v1" src="">
	</video>
</body>

</html>

