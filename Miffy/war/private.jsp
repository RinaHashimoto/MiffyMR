<%@ page language="java" contentType="text/html; charset=utf8"
        pageEncoding="utf8" %>
<%@ page import="com.google.appengine.api.users.*" %>
<%
User user = (User)session.getAttribute("user");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <script type="text/javascript">
<!--

function changeSize(fontSize) { 
   document.getElementById("content").style.fontSize=fontSize; 
}
function changeColor(color) { 
   document.getElementById("content").style.color=color; 
}

// -->
</script>
   <style>
            title{font-size: 30pt; font-synthesis:weight;}
            h1{font-size: 20pt; font-synthesis: weight; color:#660000;}
            body{background: ivory;
            background-image: url("./pictures/miffy.png");
            background-repeat: repeat-x;
            background-position: left bottom;
            background-size: 450px 148px}
    </style>
    <title>＜・x・＞miffy＜・x・＞</title>
    <script type="text/javascript" src="lib.js"></script>
        <script type="text/javascript">
        function callback(request){
            var json = eval(request.responseText);
            var res = '';
            if (json.length == 1){
                res += '<tr><td>' + json[0].id +'</td></tr>';
                res += '<tr><td>' + json[0].title +'</td></tr>';
                res += '<tr><td>' + json[0].url +'</td></tr>';
                res += '<tr><td>' + json[0].comment +'</td></tr>';
            } else {
                for (var i = 0;i < json.length;i++){
                    res += '<tr><td><a href="javascript:return false;" onclick="getData(' + json[i].id +');">' + json[i].id + '</a></td>';
                    res += '<td><a href="' + json[i].url + '">' + json[i].title + '</a></td>';
                    res += '<td>'+json[i].comment + '</td>' +
                    '<td><a href="edit.html?id=' + json[i].id + '">編集</td>' +
                    '<td><a href="del.html?id=' + json[i].id + '">やっぱり不参加！</td></tr>';
                }
            }
            var obj = document.getElementById("datatable");
            obj.innerHTML = res;
        }
        </script>
  </head>
  <body onload="getData(null);">
  <div id="content">
    <h3>文字サイズ</h3>
<a href="javascript:void(0)" onclick="changeSize('8pt')">小</a> | 
<a href="javascript:void(0)" onclick="changeSize('12pt')">中</a> | 
<a href="javascript:void(0)" onclick="changeSize('30pt')">大</a>
    <h1>焼肉@渋谷 6/6 18:00〜</h1>
     
    <table id="datatable" border="1">
      <tr>
        <td>wait...</td>
      </tr>
    </table>
    <br>
    <div><a href="add.html">参加する！</a></div>
    <a href="/logout">Logout</a>
    <p><a href="/private.jsp">再読み込み</a></p>
    <br>
        </div>
  </body>
</html>