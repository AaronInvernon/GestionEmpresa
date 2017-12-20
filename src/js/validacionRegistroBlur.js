document.addEventListener('DOMContentLoaded', main, false);

function main() {
    var myForm = document.getElementById("myForm");

    myForm.txtNombre.addEventListener("blur", validarNombre, false);
    myForm.txtApe1.addEventListener("blur", validarApellido1, false);
    myForm.txtApe2.addEventListener("blur", validarApellido2, false);
    myForm.txtEmail.addEventListener("blur", validarEmail, false);



    function validarNombre(cadena) {
        cadena.target.nextElementSibling.className = "ok";
        var error = document.getElementById("errorNombre");
        if (cadena.target.value.trim().match(/^([A-ZÑÁÉÍÓÚa-zñáéíóú]+[\s]?)+$/) == null) {
            error.className = "error";
            error.style.visibility = "visible";
            return false;
        } else {
            error.style.visibility = "hidden";
        }
        cadena.target.value = cadena.target.value.charAt(0).toUpperCase() + cadena.target.value.slice(1);
        return true;
    }

    function validarApellido1(cadena) {
        cadena.target.nextElementSibling.className = "ok";
        var error = document.getElementById("errorApe1");
        if (cadena.target.value.trim().match(/^([A-ZÑÁÉÍÓÚa-zñáéíóú]+[\s]?)+$/) == null) {
            error.className = "error";
            error.style.visibility = "visible";
            return false;
        } else {
            error.style.visibility = "hidden";
        }
        cadena.target.value = cadena.target.value.charAt(0).toUpperCase() + cadena.target.value.slice(1);
        return true;
    }

    function validarApellido2(cadena) {
        cadena.target.nextElementSibling.className = "ok";
        var error = document.getElementById("errorApe2");
        if (cadena.target.value.trim().match(/^([A-ZÑÁÉÍÓÚa-zñáéíóú]+[\s]?)+$/) == null) {
            error.className = "error";
            error.style.visibility = "visible";
            return false;
        } else {
            error.style.visibility = "hidden";
        }
        cadena.target.value = cadena.target.value.charAt(0).toUpperCase() + cadena.target.value.slice(1);
        return true;
    }

    function validarEmail(email) {
        email.target.nextElementSibling.className = "ok";
        var error = document.getElementById("errorMail");
        if (email.target.value.trim().match(/^[a-z0-9](\.?[a-z0-9_-]){0,}@[a-z0-9-]+\.([a-z]{1,6}\.)?[a-z]{2,6}$/) == null) {
            error.className = "error";
            error.style.visibility = "visible";
            return false;
        } else {
            error.style.visibility = "hidden";
        }
        return true;
    }
}