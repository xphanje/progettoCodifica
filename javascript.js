function gestoreTornaSu () {
    try {
        if (window.pageYOffset>300) {
            nodoTornaSu.style.display= "block";
            }
            
            else if (window.pageYOffset<300) {
            nodoTornaSu.style.display= "none";
            }
            
    } catch(e) {
        alert("gestoreTornaSu" + e)
    }
}

function gestoreChiudi0 () {
    try {
        nodiDivZoom[0].style.visibility = "hidden";
    } catch(e) {
        alert("gestoreChiudi0" + e)
    }
}
function gestoreChiudi1 () {
    try {
        nodiDivZoom[1].style.visibility = "hidden";
    } catch(e) {
        alert("gestoreChiudi1" + e)
    }
}
function gestoreChiudi2 () {
    try {
        nodiDivZoom[2].style.visibility = "hidden";
    } catch(e) {
        alert("gestoreChiudi2" + e)
    }
}

function gestoreZoom0 () {
    try {
        nodiDivZoom[0].style.visibility = "visible";
         
    } catch(e) {
        alert("gestoreZoom" + e)
    }
}

function gestoreZoom1 () {
    try {
        nodiDivZoom[1].style.visibility = "visible";
         
    } catch(e) {
        alert("gestoreZoom" + e)
    }
}

function gestoreZoom2 () {
    try {
        nodiDivZoom[2].style.visibility = "visible";
         
    } catch(e) {
        alert("gestoreZoom" + e)
    }
}
/*    Gestore che espande le forme abbreviate    */
function gestoreExpan () {
    try {
        var j;
        for (j=0; j < nodiTestoAbbr.length; j++) {
            nodiTestoAbbr[j].style.display = "unset";
            nodiTestoExpan[j].style.display = "none";
        }
        var i;
        for (i = 0; i < nodiExpan.length; i++) {
            nodiExpan[i].style.display = "unset";
            nodiAbbr[i].style.display = "none";
        }

    } catch(e) {
        alert("gestoreAbbr" + e)
    }
}

/*    Gestore che abbrevia le forme espanse    */
function gestoreAbbr () {
    try {
        var j;
        for (j=0; j < nodiTestoAbbr.length; j++) {
            nodiTestoAbbr[j].style.display = "none";
            nodiTestoExpan[j].style.display = "unset";
        }
        var i;
        for (i = 0; i < nodiExpan.length; i++) {
            nodiAbbr[i].style.display = "unset";
            nodiExpan[i].style.display = "none";
        }
        
    } catch(e) {
        alert("gestoreAbbr" + e)
    }
}

/*    Gestore che apre e chiude il menu    */
function gestoreMenu () {
    try {
        if (nodoMenu.getAttribute("class") == "menuChiuso") {
            nodoMenu.setAttribute("class", "menuAperto");
            nodobar1.setAttribute("class", "barraRuotata");
            nodobar2.setAttribute("class", "barraRuotata");
            nodobar3.setAttribute("class", "barraRuotata");
            
        } else { 
            nodoMenu.setAttribute("class", "menuChiuso");
            nodobar1.setAttribute("class", "barraNormale");
            nodobar2.setAttribute("class", "barraNormale");
            nodobar3.setAttribute("class", "barraNormale");   
        }
    } catch(e) {
        alert("gestoreMenu" + e)
    }
}

/*    Variabili    */
var nodoMenu;
var nodoAprichiudi;
var nodobar1;
var nodobar2;
var nodobar3;

var nodiExpan;
var nodiAbbr;
var nodiTestoExpan;
var nodiTestoAbbr;
var nodiClickExpan;
var nodiClickAbbr;

var nodiSpanRetro;
var nodiDivZoom;
var nodiChiudi;

var nodoTornaSu;

/*    Gestore load    */
function gestoreLoad () {
    try {
        nodoMenu = document.getElementById("menu");
        nodoAprichiudi = document.getElementById("aprichiudi");
        nodobar1 = document.getElementById("bar1");
        nodobar2 = document.getElementById("bar2");
        nodobar3 = document.getElementById("bar3");
        nodoAprichiudi.onclick = gestoreMenu;
        
        nodiTestoExpan = document.getElementsByClassName("estendi");
        nodiTestoAbbr = document.getElementsByClassName("abbrevia");
        var j;
        for (j = 0; j < nodiTestoExpan.length; j++) {
            nodiTestoAbbr[j].style.display = "none";
        }
        
        nodiExpan = document.getElementsByClassName("expan");
        nodiAbbr = document.getElementsByClassName("abbr");
        var i;
        for (i = 0; i < nodiExpan.length; i++) {
            nodiExpan[i].style.display = "none";
        } 
        
        nodiClickExpan = document.getElementsByClassName("clickExpan");
        nodiClickAbbr = document.getElementsByClassName("clickAbbr");
        var h;
        for (h = 0; h < nodiClickExpan.length; h++) {
            nodiClickExpan[h].onclick = gestoreExpan;
            nodiClickAbbr[h].onclick = gestoreAbbr;
        }

        nodiSpanRetro = document.getElementsByClassName("retro");
        nodiDivZoom = document.getElementsByClassName("zoom");
        
        var child0 = nodiSpanRetro[0].firstChild;
        var child1 = nodiSpanRetro[1].firstChild;
        var child2 = nodiSpanRetro[2].firstChild;
        child0.onclick = gestoreZoom0;
        child1.onclick = gestoreZoom1;
        child2.onclick = gestoreZoom2;

        nodiChiudi = document.getElementsByClassName("chiudi");
        nodiChiudi[0].onclick = gestoreChiudi0;
        nodiChiudi[1].onclick = gestoreChiudi1;
        nodiChiudi[2].onclick = gestoreChiudi2;
       
        nodoTornaSu = document.getElementById ("tornasu");
        window.onscroll = gestoreTornaSu;

        

    
    } catch (e) {
        alert("gestoreLoad" + e)
    }
}
window.onload = gestoreLoad;
