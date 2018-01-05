
            $(document).ready(function () {
                $("#btn-menu").attr('checked', false);
            });

//            $(".submenu").click(function () {
//                $(this).children("ul").slideToggle("slow").show();
//                $(this).children("ul").toggleClass('active');
//            });

//            $(".submenu2").click(function () {
//                $(this).children("ul").toggleClass('active');
//            });

            $(".boton").click(function () {
                $("#btn-menu").attr('checked', false);
                 $("#mynotes").hide();
                 $("#mycandis").hide();
            });

            $(".submenu").children("ul").click(function () {
                $("#btn-menu").attr('checked', false);
            });
//----------TODO ESTO ES NUEVO----------//    
            $(".InBox").children("a").click(function () {
                $(".PopUpIn").hide();
            });
            
            $(".EatBox").children("a").click(function () {
                $(".PopUpEat").hide();
            });
            
            $(".OutBox").children("a").click(function () {
                $(".PopUpOut").hide();
            });
            
           //--------------COSAS MAS NUEVAS-------------------------
            
            $("#mynotes").children('a').click(function(){
                $("#btn-notificaciones").hide();
                $("#btn-candidaturas").prop('checked', false);
                if ($("#btn-notificaciones").prop('checked')){
                    $("#btn-notificaciones").prop('checked', false);
                }else 
                {$("#btn-notificaciones").prop('checked', true);}
                
            });
            
            $("#mycandis").children('a').click(function(){
                $("#btn-candidaturas").hide();
                $("#btn-notificaciones").prop('checked', false);
                if ($("#btn-candidaturas").prop('checked')){
                    $("#btn-candidaturas").prop('checked', false);
                }else 
                {$("#btn-candidaturas").prop('checked', true);}
                
            });
            
            $(".submenu2").click(function () {
                $(this).children("ul").slideToggle();
            });
            
            $(".submenu2").children("ul").slideToggle().hide();

