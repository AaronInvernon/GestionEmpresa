document.addEventListener("DOMContentLoaded",main, false);

function main(){
    var formularioRegistro = document.getElementById("formularioRegistro");
    formularioRegistro.addEventListener("submit", comprobarForm, false);
    formularioRegistro.addEventListener("reset", limpiarSpans, false);

    function comprobarForm(e) {

        var valido = true;

        valido = validarNombreUsuario(formularioRegistro.userName);
        valido &= validarContra(formularioRegistro.password);
        valido &= comprobarContra(formularioRegistro.rePassword);
        valido &= validarNombreApellidos(formularioRegistro.userNameReal);
        valido &= validarNombreApellidos(formularioRegistro.firstSurname);
        valido &= validarNombreApellidos(formularioRegistro.secondSurname);
        valido &= validarEmail(formularioRegistro.mail);

        if (valido) return;
        e.preventDefault();
    }
    
    function limpiarSpans() {
        var spans = document.getElementsByTagName("span");
        for (var i = 0; i < spans.length; i++) {
            spans[i].textContent = "";
            spans[i].className = "ok";
        }
    }
    
    function validarNombreUsuario(nombre) {
        nombre.nextElementSibling.textContent = "";
        nombre.nextElementSibling.className = "ok";
        if (nombre.value.trim().match(/^[A-Za-z0-9]{2,25}$/) == null) {
            nombre.nextElementSibling.className = "alert alert-danger alert-white rounded";
            nombre.nextElementSibling.textContent = "Introduce " + nombre.title + " entre 2 y 25 carácteres alfanúmericos";
            return false;
        }
        return true;
    }
    
    function validarApellido1(ape1) {
        ape1.nextElementSibling.textContent = "";
        ape1.nextElementSibling.className = "ok";
        if (ape1.value.trim().match(/^[A-Za-z0-9]{2,20}$/) == null) {
            ape1.nextElementSibling.className = "alert alert-danger alert-white rounded";
            ape1.nextElementSibling.textContent = "Introduce " + ape1.title + " entre 4 y 15 carácteres alfanúmericos";
            return false;
        }
        return true;
    }
    
    function validarApe2(ape2) {
        ape2.nextElementSibling.textContent = "";
        ape2.nextElementSibling.className = "ok";
        if (ape2.value.trim().match(/^[A-Za-z0-9]{2,25}$/) == null) {
            ape2.nextElementSibling.className = "alert alert-danger alert-white rounded";
            ape2.nextElementSibling.textContent = "Introduce " + ape2.title + " entre 4 y 15 carácteres alfanúmericos";
            return false;
        }
        return true;
    }

    function validarEmail(email) {
        email.nextElementSibling.textContent = "";
        email.nextElementSibling.className = "ok";
        if (email.value.trim().match(/^[a-z0-9](\.?[a-z0-9_-]){0,}@[a-z0-9-]+\.([a-z]{1,6}\.)?[a-z]{2,6}$/) == null) {
            email.nextElementSibling.className = "alert alert-danger alert-white rounded";
            email.nextElementSibling.textContent = "Introduce " + email.title + " válido, hola@mundo.com";
            return false;
        }
        return true;
    }
    
};  