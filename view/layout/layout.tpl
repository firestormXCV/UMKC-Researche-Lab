<?php  
	global $controle;  //accès aux variables globales 
	global $action; 	//nécessaire car layout inclus au sein d'une fonction-action
?>

<html> <!-- This tag is compulsory for any HTML document. -->   
	<head>
		
		<link href="view/style/css/header.css" rel="stylesheet">
		  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" 
		  integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
          crossorigin="anonymous"/>
		  
		  
		
		  
		  <script src="js/bootstrap.min.js"></script>
  
	</head>  
	<body> 
		<!--header-->
			<?php  require ("./view/layout/header.tpl"); ?>
		<!--end header-->

		<p> <!-- It is a Paragraph tag for creating the paragraph -->  
		<b> HTML </b> stands for <i> <u> Hyper Text Markup Language. </u> </i> It is used to create a web pages and applications. This language   
		is easily understandable by the user and also be modifiable. It is actually a Markup language, hence it provides a flexible way for designing the  
		web pages along with the text.   
		</p>  
			HTML file is made up of different elements. <b> An element </b> is a collection of <i> start tag, end tag, attributes and the text between them</i>.   
		</p> 
	</body>  
</html>  