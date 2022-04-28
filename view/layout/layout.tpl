<?php  
	global $controle;  //accès aux variables globales 
	global $action; 	//nécessaire car layout inclus au sein d'une fonction-action
?>

<html> <!-- This tag is compulsory for any HTML document. -->   
	<head>
		
		<link href="view/style/css/header.css" rel="stylesheet">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" >
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" ></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
  
	</head>  
	<body> 
		<!--header-->
			<?php  require ("./view/layout/header.tpl"); ?>
		<!--end header-->

		<div id ="main"> 
			<?php  require ("./view/" . $controle . "/" . $action . ".tpl"); ?>  
		</div>

	</body>  
</html>  