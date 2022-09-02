$(document).ready(function() {
    $('.Regulament').hide(0)
    window.addEventListener("message", function(event) {
        var item = event.data;
        if (item.adam == true) {
            $('.Regulament').show(650)
            $('.image').show(100)
        }

    })
    
    $(document).on("click", "#fagiio", function(event) {
        $.post(`https://${GetParentResourceName()}/spawnfaggio`, JSON.stringify({}));
        $('.Regulament').hide(100)
    })
    $(document).on("click", "#dacia", function(event) {
        $.post(`https://${GetParentResourceName()}/daciaspown`, JSON.stringify({}));
        $('.Regulament').hide(100)
    })
    $(document).on("click", "#bmw", function(event) {
        $.post(`https://${GetParentResourceName()}/bmwspawn`, JSON.stringify({}));
        $('.Regulament').hide(100)
    })
    $(document).on("click", "#Nextv2", function(event) {
        $.post(`https://${GetParentResourceName()}/exitjob`, JSON.stringify({}));
        $('.image').hide(100)
        $('.Regulament').hide(100)
    })

})