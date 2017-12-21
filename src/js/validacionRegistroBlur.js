document.addEventListener('DOMContentLoaded', main, false);

function main() {
    var myForm = document.getElementById("myForm");
    var btn = document.getElementById("Enviar");
    
    btn.addEventListener("click", comprobarForm, true);
    myForm.addEventListener("reset", limpiarSpans, false);

    myForm.txtNombre.addEventListener("blur", validarNombre, false);
    myForm.txtApe1.addEventListener("blur", validarApellido1, false);
    myForm.txtApe2.addEventListener("blur", validarApellido2, false);
    myForm.txtEmail.addEventListener("blur", validarEmail, false);
    myForm.txtNss.addEventListener("blur", validarNss, false);
    myForm.txtId.addEventListener("blur",validarDNI, false);
    myForm.txtTlfno.addEventListener("blur", validarTlfno, false)

    function comprobarForm() {

        var nombre = myForm.txtNombre.value;
        var ape1 = myForm.txtApe1.value;
        var ape2 = myForm.txtApe2.value;
        var email = myForm.txtEmail.value;
        var nss = myForm.txtNss.value;
        var dni = myForm.txtId.value;
        var tlfno = myForm.txtTlfno.value;
        
        if(nombre == ""){
            alert("El campo nombre es requerido");
            myForm.txtNombre.focus();
        }else if(ape1 == ""){
            alert("El campo primer apellido es requerido");
            myForm.txtApe1.focus();
        }else if(ape2 == ""){
            alert("El campo segundo apellido es requerido");
            myForm.txtApe2.focus();
        }else if(dni == ""){
            alert("El campo identificación es requerido");
            myForm.txtId.focus();
        }else if(nss == ""){
            alert("El campo NSS es requerido");
            myForm.txtNss.focus();
        }else if(email == ""){
            alert("El campo email es requerido");
            myForm.txtEmail.focus();
        }else if(tlfno == ""){
            alert("El campo teléfono es requerido");
            myForm.txtTlfno.focus();
        }else{
            myForm.submit();
        }
           
    }
    
    function limpiarSpans() {
        var spans = document.getElementsByTagName("span");
        var inputs = document.getElementsByClassName("form-control");
        
        for (var i = 0; i < spans.length; i++) {
            spans[i].style.visibility = "hidden";
        }
        
        for (var i = 0; i < inputs.length; i++) {
            inputs[i].className = "form-control";
        }
    }

    function validarNombre(cadena) {
        cadena.target.nextElementSibling.className = "ok";
        var error = document.getElementById("errorNombre");
        if (cadena.target.value.trim().match(/^([A-ZÑÁÉÍÓÚa-zñáéíóú][\s]?){2,25}$/) == null) {
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
        if (cadena.target.value.trim().match(/^([A-ZÑÁÉÍÓÚa-zñáéíóú][\s]?){2,19}$/) == null) {
            error.className = "error";
            cadena.target.className = "form-control errorInput";
            error.style.visibility = "visible";
            return "false";
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
        if (cadena.target.value.trim().match(/^([A-ZÑÁÉÍÓÚa-zñáéíóú][\s]?){2,19}$/) == null) {
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
        if (cadena.target.value.trim().match(/^([A-Za-z0-9][\s]?){9,10}$/) == null) {
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
        if (numero.target.value.trim().match(/^([0-9]){12}$/) == null) {
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
        if (numero.target.value.trim().match(/^([0-9]){9}$/) == null) {
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