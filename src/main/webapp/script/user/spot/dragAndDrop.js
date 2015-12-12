function allowDrop(ev) {
  /* The default handling is to not allow dropping elements. */
  /* Here we allow it by preventing the default behaviour. */
  ev.preventDefault();
}

function drag(ev) {
  /* Here is specified what should be dragged. */
  /* This data will be dropped at the place where the mouse button is released */
  /* Here, we want to drag the element itself, so we set it's ID. */
  ev.dataTransfer.setData("text/html", ev.target.id);
}

function dropCopy(ev) {
  /* The default handling is not to process a drop action and hand it to the next 
     higher html element in your DOM. */
  /* Here, we prevent the default behaviour in order to process the event within 
     this handler and to stop further propagation of the event. */
  ev.preventDefault();
  /* In the drag event, we set the *variable* (it is not a variable name but a 
     format, please check the reference!) "text/html", now we read it out */
  var data=ev.dataTransfer.getData("text/html");
  /* As we put the ID of the source element into this variable, we can now use 
     this ID to manipulate the dragged element as we wish. */
  /* Let's just move it through the DOM and append it here */
  
  //ev.target.appendChild(document.getElementById(data));  
  
  var nodeCopy = document.getElementById(data).cloneNode(true);
  nodeCopy.id = "newId"; /* We cannot use the same ID */
  ev.target.appendChild(nodeCopy);
}

function drop(ev) {
	  /* The default handling is not to process a drop action and hand it to the next 
	     higher html element in your DOM. */
	  /* Here, we prevent the default behaviour in order to process the event within 
	     this handler and to stop further propagation of the event. */
	  ev.preventDefault();
	  /* In the drag event, we set the *variable* (it is not a variable name but a 
	     format, please check the reference!) "text/html", now we read it out */
	  var data=ev.dataTransfer.getData("text/html");
	  /* As we put the ID of the source element into this variable, we can now use 
	     this ID to manipulate the dragged element as we wish. */
	  /* Let's just move it through the DOM and append it here */
	  var nodeCopy = document.getElementById(data).cloneNode(true);
	  nodeCopy.id = "newId"; /* We cannot use the same ID */
	  nodeCopy.firstChild.value="aaa";
	  ev.target.appendChild(nodeCopy);
	}