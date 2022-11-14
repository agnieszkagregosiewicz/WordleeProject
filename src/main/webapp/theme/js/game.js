const letterButtons = document.querySelectorAll(".btkey")
let i = 0;
letterButtons.forEach(function (letterButton) {
    letterButton.addEventListener('click', function () {
        let firstAvailableWord = document.querySelector("div .gactive");
        let cells = firstAvailableWord.firstElementChild.children;
        if (i < cells.length - 1) {
            cells[i].innerText = letterButton.innerText;
            i++;
        } else if (i === cells.length - 1) {
            cells[i].innerText = letterButton.innerText;
            let wordToCheck = '';
            for (let j = 0; j < cells.length; j++) {
                wordToCheck += cells[j].innerText;
            }
            i++;
            sendWordToCheck(wordToCheck);
        }
    })
})
const backspaceButton = document.querySelector(".bkspc")
backspaceButton.addEventListener('click', function () {
    let firstAvailableWord = document.querySelector("div .gactive");
    let cells = firstAvailableWord.firstElementChild.children;
    if (i > 0) {
        cells[i - 1].innerHTML = "&nbsp";
        i--;
        const btn = document.querySelector("#warning");
        btn.setAttribute("hidden", "hidden");
    }
})

function sendWordToCheck(wordToCheck) {
    let word = {}
    word["word"] = wordToCheck;
    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "/api/word",
        data: JSON.stringify(word),
        dataType: 'json',
        cache: false,
        timeout: 600000,
        success: function (data) {
            const json = JSON.stringify(data);
            cellsManaging(json, wordToCheck);
        },
        error: function (e) {
            var json = e.responseText;
            const btn = document.querySelector("#warning");
            btn.removeAttribute("hidden");
            $('#warning').html("Takie słowo nie istnieje");
        }
    })
}


function cellsManaging(json, wordToCheck) {
    let result = json.split(":");
    let firstAvailableWord = document.querySelector("div .gactive");
    let cells = firstAvailableWord.firstElementChild.children;
    for (let j = 1; j < result[1].length; j++) {
        if (result[1].substring(1, 6) === "11111") {
            cells[j - 1].style.backgroundColor = "green";
            cells[j - 1].style.color = "white";
            const btnS = document.querySelector("#success");
            btnS.removeAttribute("hidden");
            $('#success').html("Gratulacje!");
            const btnPlay = document.querySelector('#playAgain');
            btnPlay.removeAttribute('hidden');
        }
        if (result.length === 3) {
            showHeadword(result);
        }
        if (result[1].charAt(j) === "1") {
            coloringCells(j, "green", cells, wordToCheck);
        }
        if (result[1].charAt(j) === "2") {
            coloringCells(j, "orange", cells, wordToCheck);
        }
        if (result[1].charAt(j) === "0") {
            coloringCells(j, "grey", cells, wordToCheck);
        }
    }
    i = 0;
    firstAvailableWord.classList.remove("gactive");
    firstAvailableWord.nextElementSibling.classList.add("gactive");
}

function coloringCells(j, color, cells, wordToCheck) {
    cells[j - 1].style.backgroundColor = color;
    cells[j - 1].style.color = "white";
    letterButtons.forEach(function (letterButton) {
        if (letterButton.innerText === wordToCheck.charAt(j - 1)) {
            if (letterButton.style.color !== "white") {
            letterButton.style.backgroundColor = color;
            letterButton.style.color = "white";
        } else if (letterButton.style.backgroundColor !== "green") {
                letterButton.style.backgroundColor = color;
                letterButton.style.color = "white";
            }
        }
    })
}
const btnPlay = document.querySelector('#playAgain');
btnPlay.addEventListener('click', drawNewWord);
function drawNewWord() {
    fetch('localhost:8080/user/game');
}
function showHeadword(result) {
    const btnShow = document.querySelector("#showWord");
    btnShow.removeAttribute("hidden");
    let headword = result[2].substring(1,6);
    btnShow.innerHTML= 'Prawidłowe słowo to: ' + headword;
    const btnPlay = document.querySelector('#playAgain');
    btnPlay.removeAttribute('hidden');
}

document.addEventListener('keypress', (event) => {
    letterButtons.forEach(function (letterButton) {
        if (event.key.toUpperCase() === letterButton.innerText) {
            let firstAvailableWord = document.querySelector("div .gactive");
            let cells = firstAvailableWord.firstElementChild.children;
            if (i < cells.length - 1) {
                cells[i].innerText = letterButton.innerText;
                i++;
            } else if (i === cells.length - 1) {
                cells[i].innerText = letterButton.innerText;
                let wordToCheck = '';
                for (let j = 0; j < cells.length; j++) {
                    wordToCheck += cells[j].innerText;
                }
                i++;
                sendWordToCheck(wordToCheck);
            }
        }
    })
})
document.addEventListener('keydown', function (event) {
    const key = event.key; // const {key} = event; ES6+
    if (key === "Backspace") {
        let firstAvailableWord = document.querySelector("div .gactive");
        let cells = firstAvailableWord.firstElementChild.children;
        if (i > 0) {
            cells[i - 1].innerHTML = "&nbsp";
            i--;
            const btn = document.querySelector("#warning");
            btn.setAttribute("hidden", "hidden");
        }
    }
})

