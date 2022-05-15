


function initNews() {

    let newsAddButton = document.getElementById("newsAdd");

    mybutton = document.getElementById("myBtn");

    // When the user scrolls down 20px from the top of the document, show the button
    window.onscroll = function() {scrollFunction()};
    newsAddButton.addEventListener("click", addLink);
}


function addLink() {

    let text = document.getElementById("message-text");
    text.value += "<a href=\"Your Link\" target=\"_blank\">The text of the link</a>"
    
 }  

 //Get the button:


function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0; // For Safari
  document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
}

function modify(id) {

    $.ajax({    
        type: "POST",
        url: "modele/modifyBD.php",             
        dataType: "html",
        data: {id},         
        success: function(data){       
          console.log(data.split("¤")[5]);
            $("#recipient-title-modify").val(data.split("¤")[0])
            $("#recipient-autor-modify").val(data.split("¤")[1])
            $("#recipient-date-modify").val(data.split("¤")[2])
            $("#recipient-bibtex-modify").val(data.split("¤")[3])
            $("#recipient-place-modify").val(data.split("¤")[4])
            $("#recipient-type-modify").val(data.split("¤")[5])
            $("#recipient-id-modify").val(id)
        }
        
    });   
}

function modifyNews(id) {
  $.ajax({    
    type: "POST",
    url: "modele/modifyNewsBD.php",             
    dataType: "html",
    data: {id},         
    success: function(data){       
        console.log(data);
        $("#recipient-title-modify").val(data.split("¤")[0])
        $("#recipient-content-modify").val(data.split("¤")[1])
        $("#recipient-date-modify").val(data.split("¤")[2])
        $("#recipient-id-modify").val(id)
    }   
});  
}

function deleteArticle(id) {
  console.log('a')
  $.ajax({    
    type: "POST",
    url: "modele/deleteArticleBD.php",             
    dataType: "html",
    data: {id},         
    success: function(data){       
        console.log(data);
        
    }   
});  
}