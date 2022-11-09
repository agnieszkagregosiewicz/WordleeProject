const repeatPassword = document.querySelector('#repeatPassword');
const password = document.querySelector('#password');
const message = document.querySelector('#warningPass');
const submit = document.querySelector('#submit');

(repeatPassword, password).addEventListener('keydown', check_pass);

function check_pass() {
    if (password.value === repeatPassword.value) {
        submit.disabled = false;
        message.classList.add("d-none");
    } else {
        submit.disabled = true;
        message.classList.remove("d-none")
        message.innerHTML= "Hasła do siebie nie pasują";
    }
}