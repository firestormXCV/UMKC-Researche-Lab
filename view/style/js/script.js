

console.log('ezefz ');


function initNews() {
    console.log('hiiiii');
    let newsAddButton = document.getElementById("newsAdd");
    console.log(newsAddButton);

    mybutton = document.getElementById("myBtn");

    // When the user scrolls down 20px from the top of the document, show the button
    window.onscroll = function() {scrollFunction()};
    newsAddButton.addEventListener("click", addLink);
}


function addLink() {
    console.log("im in");
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
    

    let inputTitle = document.getElementById("recipient-title-modify");
    let inputAutor = document.getElementById("recipient-autor-modify");
    let inputDate = document.getElementById("recipient-date-modify");
    let title;
    let autor;
    let date;
   
    $.ajax({    
        type: "POST",
        url: "modele/modifyBD.php",             
        dataType: "html",
        data: {id},         
        success: function(data){       
            //console.log(data) 
            $("#recipient-title-modify").val(data.split("¤")[0])
            $("#recipient-autor-modify").val(data.split("¤")[1])
            $("#recipient-date-modify").val(data.split("¤")[2])
            //inputTitle.value = 
            console.log('aa') 
            autor = data.split("¤")[1]
            console.log('aa') 
            date = data.split("¤")[2]
            console.log('aa')  
        }
    });
    
    
    
    inputAutor.value = autor;
    inputDate.value = date;
   
}