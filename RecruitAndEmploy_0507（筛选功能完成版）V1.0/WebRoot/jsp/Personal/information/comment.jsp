<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/comment.css" type="text/css" />
<title>无标题文档</title>
</head>

<body>
 <h2>意见反馈</h2>
      <div id="respond">
        <form action="../index.jsp" method="post">
          <p>
           <label for="name"><big>发出人：:</big></label>
            <input type="text" name="name" id="name" value="" size="22" />
           
          </p>
          <p>
           <label for="email"><big>邮箱：</big></label>
            <input type="text" name="email" id="email" value="" size="22" />
           
          </p>
          <p>
            <label for="comment"><big>请写下亲的意见和建议：</big></label>
            <textarea name="comment" id="comment" cols="100%" rows="10"></textarea>
          
          </p>
          <p align="center">
            <input name="submit" type="submit" id="submit" value="传递意见" />
            &nbsp;
            <input name="reset" type="reset" id="reset" tabindex="5" value="重置意见" />
          </p>
        </form>
        </div>
</body>
</html>