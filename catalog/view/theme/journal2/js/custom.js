// alert('ok2');
//Форма ремодал
$(document).ready(function () {
    $("form.sendform").submit(function () {
        // Получение ID формы
        var formID = $(this).attr('id');
        // Добавление решётки к имени ID
        var formNm = $('#' + formID);
        $.ajax({
            type: "POST",
            url: '/utils/mail.php',
            data: formNm.serialize(),
            success: function (data) {
                // Вывод текста результата отправки
                $(formNm).html(data);
            },
            error: function (jqXHR, text, error) {
                // Вывод текста ошибки отправки
                $(formNm).html(error);
            }
        });
        return false;
    });
});
//Свернуть развернуть меню на главной в мобильной версии
$(function(){
    $('.button_readmore_3.journal-cms-block-263').click(function(){
        $('ul.journal-cms-block-263, .button_readmore_4.journal-cms-block-263, .button_readmore_3.journal-cms-block-263').toggleClass('svernuto');
    });
    $('.button_readmore_4.journal-cms-block-263').click(function(){
        $('ul.journal-cms-block-263, .button_readmore_3.journal-cms-block-263, .button_readmore_4.journal-cms-block-263').toggleClass('svernuto');
    });
});
