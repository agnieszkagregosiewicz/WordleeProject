const firstAvailableWord = document.querySelector("div .gactive");
const letterButtons = document.querySelectorAll(".btkey")
let i = 0;
letterButtons.forEach(function (letterButton) {
    letterButton.addEventListener('click', function () {
        let firstAvailableWord = document.querySelector("div .gactive")
        let cells = firstAvailableWord.firstElementChild.children;
        if (i < cells.length-1) {
            cells[i].innerText = letterButton.innerText;
            i++;
        } else if (i === cells.length - 1){
            cells[i].innerText = letterButton.innerText;
            let wordToCheck = '';
            for (let j = 0; j < cells.length; j++) {
            wordToCheck += cells[j].innerText;}
            sendWordToCheck(wordToCheck);
            //console.log(response);
            i = 0;
            firstAvailableWord.classList.remove("gactive");
            firstAvailableWord.nextElementSibling.classList.add("gactive");

        }


    })
})
const backspaceButton = document.querySelector(".bkspc")
backspaceButton.addEventListener('click', function () {
    const cells = firstAvailableWord.children;
    cells[i - 1].innerHTML = "&nbsp";
    i--;
})

function sendWordToCheck(wordToCheck) {
    let word = {}
    word["word"] = wordToCheck;
    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "/user/api/word",
        data: JSON.stringify(word),
        dataType: 'json',
        cache: false,
        timeout: 600000,

    })

}
