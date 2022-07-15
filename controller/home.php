<?php

/**
 * home
 * function to display the content of the home page
 * @return void
 */
function home() {
	//call the function to fetch the data from the table admin, it contain the data from the profile of the admin
	require("./model/adminBD.php");
	if(displayBio($bio)) { //if the bio is seccesfully fetched from the DB 
		$_SESSION['bio'] = $bio;	//Put the data in the global variable $_SESSION
	} else {
		$msg='No bio for the moment ! Please try later bro';
	}

	//call the function to fetch the news from the data base
	require("./model/newsBD.php");
    if(displayNews($news)){
		$_SESSION['news'] = $news;
        
        
	}
	else{
		$msg='No news for the moment ! Please try later bro';
	}

	//call the function to fetch the content of the bio from the data base, that content is and HTML string
	require("./model/contentBD.php");
	if(displayContent($content)){
		$_SESSION['content'] = $content;
        
	}
	else{
		$msg='No content for the moment ! Please try later bro';
	}

	require ("./view/layout/layout.tpl"); //start the layout to have the footer, the header and the content fo the home page between
}

//if home.php (that script) is called from a form, it's impossible to target a function, so when the script is called

$id=isset($_POST['idixi'])?trim($_POST['idixi']):'';			//first get the data from the form, such as the content and the ID
$content=isset($_POST['content'])?trim($_POST['content']):''; 

if (!empty($id)) {								//if the ID is set, it mean a form called that script and it's the modify content form on the homepage

    $currentDirectory = dirname (getcwd());		//get the curret directory to set dynamically 

    require($currentDirectory . "/model/contentBD.php");	
    updateContent($id, $content);				//call the function to update the content

	$nexturl = "http://localhost/UMKC-Researche-Lab/index.php?controle=home&action=home";
    header ("Location:" . $nexturl);  //refresh the page
}



?>