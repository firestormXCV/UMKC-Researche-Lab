


function initNews() {


    let addLink = document.getElementById("addLink");
    let addList = document.getElementById("addList");
    let addTitle = document.getElementById("addTitle");

    // When the user scrolls down 20px from the top of the document, show the button
    window.onscroll = function() {scrollFunction()};
    addLink.addEventListener("click", addLinkContent);
    addList.addEventListener("click", addListContent);
    addTitle.addEventListener("click", addTitleContent);
    
}


function addListContent() {
    let text = document.getElementById("message-text");
    text.value += '<ul> <li>element 1</li> <li>element 2</li> <li>element 3</li></ul>'
 }

 function addLinkContent() {
  let text = document.getElementById("message-text");
  text.value += '<a href=Your Link" target="_blank">The text of the link</a>'
}  

function addTitleContent() {
  let text = document.getElementById("message-text");
  text.value += '<h5 class="homeTitle" >Your title text here</h5>'
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

function modifyContent(id) {
  
  $.ajax({
    type: "POST",
    url:"model/modifyContent.php",
    dataType: "html",
    data: {id},
    success: function(data){
      
      console.log(data);
      
      $("#message-text").val(data);
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