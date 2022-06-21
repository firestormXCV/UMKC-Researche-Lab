


function initNews() {


    let addLink = document.getElementById("addLink");
    let addList = document.getElementById("addList");
    let addTitle = document.getElementById("addTitle");
    let addBr = document.getElementById("addBr");
    let addParagraph = document.getElementById("addParagraph");
    
    window.onscroll = function() {scrollFunction()};
    addLink.addEventListener("click", addLinkContent);
    addList.addEventListener("click", addListContent);
    addTitle.addEventListener("click", addTitleContent);
    addBr.addEventListener("click", addBrContent);
    addParagraph.addEventListener("click", addParagraphContent);
}

function addParagraphContent() {
  var curPos = document.getElementById("message-text").selectionStart;
  let x = $("#message-text").val();
  let text_to_insert = $("#insert").val();
  $("#message-text").val(
  x.slice(0, curPos) + '<p>Your Text</p>' + x.slice(curPos));
}

function addListContent() {

    var curPos = document.getElementById("message-text").selectionStart;
    let x = $("#message-text").val();
    let text_to_insert = $("#insert").val();
    $("#message-text").val(
    x.slice(0, curPos) + '<ul> <li>element 1</li> <li>element 2</li> <li>element 3</li></ul>' + x.slice(curPos));

 }

 function addBrContent() {

  var curPos = document.getElementById("message-text").selectionStart;
  let x = $("#message-text").val();
  let text_to_insert = $("#insert").val();
  $("#message-text").val(
  x.slice(0, curPos) + '<br>' + x.slice(curPos));

}

 function addLinkContent() {

  var curPos = document.getElementById("message-text").selectionStart;
  let x = $("#message-text").val();
  let text_to_insert = $("#insert").val();
  $("#message-text").val(
  x.slice(0, curPos) + '<a href=Your Link" target="_blank">The text of the link</a>' + x.slice(curPos));

}  

function addTitleContent() {
  var curPos = document.getElementById("message-text").selectionStart;
  let x = $("#message-text").val();
  let text_to_insert = $("#insert").val();
  $("#message-text").val(
  x.slice(0, curPos) + '<h5 class="hometitle" >Your title text here</h5>' + x.slice(curPos));

  //text.value += '<h5 class="hometitle" >Your title text here</h5>'
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

function modifyProfile() {
  $.ajax({    
    type: "POST",
    url: "model/adminBD.php",             
    dataType: "html",
    
    success: function(data){       
        console.log(data);
        $("#recipient-name-modify").val(data.split("¤")[0])
        $("#recipient-title-modify").val(data.split("¤")[1])
        $("#recipient-contact-modify").val(data.split("¤")[2])
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

function scrollFunction() {
  let mybutton = document.getElementById("myBtn");

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

function updateHoverMenu(newId) {
  
  let actual = document.getElementsByClassName("active")[0];
  actual.classList.remove('active');
  newId.classList.add('active');

}