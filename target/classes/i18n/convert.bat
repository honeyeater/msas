@set SRC_FILE=struts-messsages.properties
@set DES_FILE=struts-messsages_zh_CN.properties

set FILE_PATH= D:\work\ºº ıº‹ππ\arch4platform\arch4platform\src\java\ins\platform\user\web
set SRC_FILE= %FILE_PATH%\UserAction.properties
set DES_FILE= %FILE_PATH%\UserAction_zh_CN.properties

if exist "%DES_FILE%" del %DES_FILE%
native2ascii -encoding GBK %SRC_FILE% %DES_FILE%
