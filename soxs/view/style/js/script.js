function initNews() {

    let newsAddButton = document.getElementById("newsAdd");
    let newsAddModifyButton = document.getElementById("newsAddModify");


    
    mybutton = document.getElementById("myBtn");

    // When the user scrolls down 20px from the top of the document, show the button
    window.onscroll = function() {scrollFunction()};
    newsAddButton.addEventListener("click", addLinkNews);
    newsAddModifyButton.addEventListener("click", addLinkNews);
    
    
}

function updateHoverMenu(newId) {
  
  let actual = document.getElementsByClassName("active")[0];
  actual.classList.remove('active');
  newId.classList.add('active');

}

function addLinkNews() {
    console.log('lol')
    let text = document.getElementById("message-text");
    let content = document.getElementById("recipient-content-modify");
    text.value += "<a href=\"Your Link\" target=\"_blank\">The text of the link</a>"
    content.value += "<a href=\"Your Link\" target=\"_blank\">The text of the link</a>"
    
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
        url: "model/modifyBD.php",             
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
    url: "model/modifyNewsBD.php",             
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

function modifyTeam(id) {
  $.ajax({    
    type: "POST",
    url: "model/modifyTeamBD.php",             
    dataType: "html",
    data: {id},         
    success: function(data){       
        console.log(data);
        $("#recipient-firstName-modify").val(data.split("¤")[0])
        $("#recipient-lastName-modify").val(data.split("¤")[1])
        $("#recipient-email-modify").val(data.split("¤")[7])
        $("#recipient-homepage-modify").val(data.split("¤")[8])
        $("#recipient-diploma-modify").val(data.split("¤")[2])
        $("#recipient-researchInterest-modify").val(data.split("¤")[6])
        $("#recipient-startDate-modify").val(data.split("¤")[4])
        $("#recipient-endDate-modify").val(data.split("¤")[5])
        $("#recipient-id-modify").val(data.split("¤")[9])

    }   
});
}

function deleteArticle(id, table) {
  
  console.log(table)
  $.ajax({    
    type: "POST",
    url: "model/deleteBD.php",             
    dataType: "html",
    data: {id, table},         
    success: function(data){       
        console.log(data);
        document.location.reload(true)
    }   
});  
}

function jsonDisplay() {
  
  let result;
  $.ajax({
    dataType: "json",
    url: "ressources/Bio.json",
    success: function(data){       
      result = data;  
      
      $("#JsonContent").val(JSON.stringify(result).replace(/(\r\n|\n\r|\r|\n)/g, '\n'));
      console.log('aaa') 
      console.log(JSON.stringify(result, null, 3  ));  
      console.log('aaa') 
    }   
  });
  console.log('zzz') 
  console.log(result);  
  console.log('zzz') 
  const obj = {name: "John", age: 30, city: "New York"};
  const myJSON = JSON.stringify(obj);
  const test = JSON.stringify(result);
  console.log(typeof myJSON);
  console.log(typeof result);
  

}