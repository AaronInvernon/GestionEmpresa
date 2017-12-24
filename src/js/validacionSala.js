document.addEventListener('DOMContentLoaded', main, false);

function main(){
    var formulario = document.getElementById("formReserva");
    var btn = document.getElementById("Enviar");
    formulario.txtNombre.addEventListener('blur', validarNombre, false)
    
    btn.addEventListener("click", comprobarForm, true);
    formulario.addEventListener("reset", limpiarSpans, false);
    
    
    function validarNombre(cadena) {
        cadena.target.nextElementSibling.className = "ok";
        var error = document.getElementById("errorNombre");
        if (cadena.target.value.trim().match(/^([0-9A-ZÑÁÉÍÓÚa-zñáéíóú][\s]?){5,25}$/) == null) {
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
    
    function comprobarForm(){
        var nombre = formulario.txtNombre.value;
        
        if(nombre == ""){
            alert("El campo nombre es requerido");
            formulario.txtNombre.focus();
        }else{
            formulario.submit();
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
}
