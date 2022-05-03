

console.log('ezefz ');


function initNews() {
    console.log('hiiiii');
    let newsAddButton = document.getElementById("newsAdd");
    console.log(newsAddButton);
    
    newsAddButton.addEventListener("click", addLink);
}


function addLink() {
    console.log("im in");
    let text = document.getElementById("message-text");
    text.value += "<a href=\"Your Link\" target=\"_blank\">The text of the link</a>"
    
 }  
