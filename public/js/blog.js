$(document).ready(()=>{
  $("time.timeago").timeago()
  if(location.pathname === "/"){
    let text = $(".post-text").children('p')
    for (let t of text){
      if($(t).text().length >= 25){
        $(t).text($(t).text().substr(0, 25) + "...")
      }
    }
  }else {
    let move = $(".move-btn")
    move.attr("href","/")
    move.text("top ->")
  }
})

