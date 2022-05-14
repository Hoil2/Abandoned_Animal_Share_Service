<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">   
</head>
<body>
	<div class="container">
		<div class="m-2">
		   <!--  파일첨부 -->
		    <form  action="upload" method="post"  enctype="multipart/form-data">
		    	<input type="text" name="text"/>
		        <input type="file" name="image"/>
		        <input class="btn btn-primary btn-sm"  type="submit" value="업로드"/>
		    </form>
		</div>
	 </div>
 </body>
 </html>