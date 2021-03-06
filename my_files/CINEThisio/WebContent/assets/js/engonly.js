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
    	"??" : "A",
      "??" : "C",
      "??" : "C",
      "??" : "D",
      "??" : "E",
      "??" : "F",
      "??" : "G",
      "??" : "H",
      "??" : "I",
      "??" : "J",
      "??" : "K",
      "??" : "L",
      "??" : "M",
      "??" : "N",
      "??" : "O",
      "??" : "P",
      ";" : "Q",
      "??" : "R",
      "??" : "W",
      "??" : "T",
      "??" : "U",
      "??" : "V",
      "??" : "S",
      "??" : "X",
      "??" : "Y",
      "??" : "Z",
      "??" : "a",
      "??" : "b",
      "??" : "c",
      "??" : "d",
      "??" : "e",
      "??" : "f",
      "??" : "g",
      "??" : "h",
      "??" : "i",
      "??" : "j",
      "??" : "k",
      "??" : "l",
      "??" : "m",
      "??" : "n",
      "??" : "o",
      "??" : "p",
      ";" : "q",
      "??" : "r",
      "??" : "w",
      "??" : "t",
      "??" : "u",
      "??" : "v",
      "??" : "s",
      "??" : "x",
      "??" : "y",
      "??" : "z"
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