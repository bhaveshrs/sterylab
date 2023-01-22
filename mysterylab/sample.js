//add two numbers ?
var cal = prompt("Please enter what type of calculation you want to do\n" +
  "if you want to add enter = 1\n" +
  "if you want to minus enter = 2\n" +
  "if you want to divide enter = 3\n" +
  "if you want to multiply enter = 4");

if (cal == 1) {
    var a = prompt("Please enter your first number");
    var b = prompt("please enter your second number");

    alert("The result is , " + (Number(a) + Number(b)));
}

else if (cal == 2) {
    var c = prompt("Please enter your first number");
    var d = prompt("please enter your second number");

    alert("the result is , " + (Number(c) - Number(d)));
}







