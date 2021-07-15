
function popErrors() {
	document.getElementById("popErrors").click();
}

let tempErrors = JSON.parse("<%- JSON.stringify(errors).replace(/\"/g, '\\\"') %>")
if(tempErrors.length) { 
	popErrors();
}
