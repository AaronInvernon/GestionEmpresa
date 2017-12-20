document.addEventListener('DOMContentLoaded', main, false);

function main() {
    var myForm = document.getElementById("myForm");

    myForm.txtNombre.addEventListener("blur", validarNombre, false);
    myForm.txtApe1.addEventListener("blur", validarApellido1, false);
    myForm.txtApe2.addEventListener("blur", validarApellido2, false);
    myForm.txtEmail.addEventListener("blur", validarEmail, false);
    myForm.txtNss.addEventListener("blur", validarNss, false);
    myForm.txtId.addEventListener("blur",validarDNI, false);
    myForm.txtTlfno.addEventListener("blur", validarTlfno, false)



    function validarNombre(cadena) {
        cadena.target.nextElementSibling.className = "ok";
        var error = document.getElementById("errorNombre");
        if (cadena.target.value.trim().match(/^([A-ZÑÁÉÍÓÚa-zñáéíóú]+[\s]?){2,25}$/) == null) {
            error.className = "error";
            cadena.target.className = "form-control errorInput";
            error.style.visibility = "visible";
            return false;
        } else {
            cadena.target.className = "form-control okInput";
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
            cadena.target.className = "form-control errorInput";
            error.style.visibility = "visible";
            return false;
        } else {
            cadena.target.className = "form-control okInput";
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
            cadena.target.className = "form-control errorInput";
            error.style.visibility = "visible";
            return false;
        } else {
            cadena.target.className = "form-control okInput";
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
            email.target.className = "form-control errorInput";
            error.style.visibility = "visible";
            return false;
        } else {
            email.target.className = "form-control okInput";
            error.style.visibility = "hidden";
        }
        return true;
    }
    
    function validarDNI(cadena){
     var error = document.getElementById("errorDNI");
        if (cadena.target.value.trim().match(/^([A-Za-z0-9][\s]?){9}$/) == null) {
           error.className = "error";
            cadena.target.className = "form-control errorInput";
            error.style.visibility = "visible";
            return false;
        } else {
            cadena.target.className = "form-control okInput";
            error.style.visibility = "hidden";
        }
        
        return true;
    }
    
    function validarNss(numero){
        var error = document.getElementById("errorNss");
        if (numero.target.value.trim().match(/^([0-9][\s]?){12}$/) == null) {
            error.className = "error";
            numero.target.className = "form-control errorInput";
            error.style.visibility = "visible";
            return false;
        } else {
            numero.target.className = "form-control okInput";
            error.style.visibility = "hidden";
        }
        
        return true;
    }
    
    function validarTlfno(numero){
        var error = document.getElementById("errorTlfno");
        if (numero.target.value.trim().match(/^([0-9][\s]?){9}$/) == null) {
            error.className = "error";
            numero.target.className = "form-control errorInput";
            error.style.visibility = "visible";
            return false;
        } else {
            numero.target.className = "form-control okInput";
            error.style.visibility = "hidden";
        }
        
        return true;
    }
    
}