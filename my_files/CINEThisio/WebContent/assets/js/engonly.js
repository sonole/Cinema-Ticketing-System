var fname = document.getElementById("signup-fname");
fname.addEventListener('keyup', function(e){
    if (e.keyCode >= 65 && e.keyCode <= 90 || e.keyCode === 190) {
        var start = fname.selectionStart,
            end = fname.selectionEnd,
            output = toEng(fname.value);
        fname.value = output;
        fname.setSelectionRange(start, end);
    }
});
var lname = document.getElementById("signup-lname");
lname.addEventListener('keyup', function(e){
    if (e.keyCode >= 65 && e.keyCode <= 90 || e.keyCode === 190) {
        var start = lname.selectionStart,
            end = lname.selectionEnd,
            output = toEng(lname.value);
        lname.value = output;
        lname.setSelectionRange(start, end);
    }
});
var email = document.getElementById("signup-email");
email.addEventListener('keyup', function(e){
    if (e.keyCode >= 65 && e.keyCode <= 90 || e.keyCode === 190) {
        var start = email.selectionStart,
            end = email.selectionEnd,
            output = toEng(email.value);
        email.value = output;
        email.setSelectionRange(start, end);
    }
});
var usr = document.getElementById("signup-usr");
usr.addEventListener('keyup', function(e){
    if (e.keyCode >= 65 && e.keyCode <= 90 || e.keyCode === 190) {
        var start = usr.selectionStart,
            end = usr.selectionEnd,
            output = toEng(usr.value);
        usr.value = output;
        usr.setSelectionRange(start, end);
    }
});
var user = document.getElementById("login-usr");
user.addEventListener('keyup', function(e){
    if (e.keyCode >= 65 && e.keyCode <= 90 || e.keyCode === 190) {
        var start = user.selectionStart,
            end = user.selectionEnd,
            output = toEng(user.value);
        user.value = output;
        user.setSelectionRange(start, end);
    }
});
var pass = document.getElementById("login-pwd");
pass.addEventListener('keyup', function(e){
    if (e.keyCode >= 65 && e.keyCode <= 90 || e.keyCode === 190) {
        var start = pass.selectionStart,
            end = pass.selectionEnd,
            output = toEng(pass.value);
        pass.value = output;
        pass.setSelectionRange(start, end);
    }
});
var toEng = (function() {
    var grToEngArray = {
    	"Α" : "A",
      "Β" : "C",
      "Ψ" : "C",
      "Δ" : "D",
      "Ε" : "E",
      "Φ" : "F",
      "Γ" : "G",
      "Η" : "H",
      "Ι" : "I",
      "Ξ" : "J",
      "Κ" : "K",
      "Λ" : "L",
      "Μ" : "M",
      "Ν" : "N",
      "Ο" : "O",
      "Π" : "P",
      ";" : "Q",
      "Ρ" : "R",
      "ς" : "W",
      "Τ" : "T",
      "Θ" : "U",
      "Ω" : "V",
      "Σ" : "S",
      "Χ" : "X",
      "Υ" : "Y",
      "Ζ" : "Z",
      "α" : "a",
      "β" : "b",
      "ψ" : "c",
      "δ" : "d",
      "ε" : "e",
      "φ" : "f",
      "γ" : "g",
      "η" : "h",
      "ι" : "i",
      "ξ" : "j",
      "κ" : "k",
      "λ" : "l",
      "μ" : "m",
      "ν" : "n",
      "ο" : "o",
      "π" : "p",
      ";" : "q",
      "ρ" : "r",
      "σ" : "w",
      "τ" : "t",
      "θ" : "u",
      "ω" : "v",
      "ς" : "s",
      "χ" : "x",
      "υ" : "y",
      "ζ" : "z"
   };
    
    return function(input){
        var i,
            len,
            result = [];
        for (i = 0, len = input.length; i < len; i+= 1) {
            result[i] = grToEngArray[input[i]] || input[i];
        }
        return result.join('');
    };    
}());