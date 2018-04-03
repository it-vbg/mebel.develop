<form class="sendform UniForm" action="/utils/mail.php" method="post" enctype="multipart/form-data" id="form-raschet">
    <div id="field1-container" class="field radio-group">
        <label for="field1-1">
            Шаг 1.	Выбор категории (гостинная, шкаф, детская, прихожая, кухня, спальня)
        </label>
        <div class="option clearfix">
            <div class="form-imgbg xs-50 sm-50 md-33 lg-20 xl-15">
                <input type="radio" class="ventaform" name="kategoriya" value="Расчет гостинной" aria-required="true" onChange="Selected(this)" required>
                <span class="option-title">
                         Гостинная
                </span>
                <img src="/image/cache/catalog/category/gostinnaya-20-250x250.jpg" width="100%" alt="расчет гостинной" />
            </div>
            <div class="form-imgbg xs-50 sm-50 md-33 lg-20 xl-15">
                <input type="radio" class="ventaform" name="kategoriya" value="Расчет шкафа" aria-required="true" onChange="Selected(this)">
                <span class="option-title">
                         Шкаф
                    </span><br />
                <img src="/image/cache/catalog/category/shkafy-250x250.jpg" width="100%" alt="расчет шкафа" />
            </div>
            <div class="form-imgbg xs-50 sm-50 md-33 lg-20 xl-15">
                <input type="radio" class="ventaform" name="kategoriya" value="Расчет детской" aria-required="true" onChange="Selected(this)">
                <span class="option-title">
                         Детская
                    </span>
                <img src="/image/cache/catalog/category/children-250x250.jpg" width="100%" alt="расчет детской" />
            </div>
            <div class="form-imgbg xs-50 sm-50 md-33 lg-20 xl-15">
                <input type="radio" class="ventaform" name="kategoriya" value="Расчет прихожей" aria-required="true" onChange="Selected(this)">
                <span class="option-title">
                         Прихожая
                    </span><br />
                <img src="/image/cache/catalog/category/prihozhaya-250x250.jpg" width="100%" alt="расчет прихожей" />
            </div>
            <div class="form-imgbg xs-50 sm-50 md-33 lg-20 xl-15">
                <input type="radio" class="ventaform" name="kategoriya" value="Расчет кухни" aria-required="true" onChange="Selected(this)">
                <span class="option-title">
                         Кухня
                    </span>
                <img src="/image/cache/catalog/category/kuhnya-24-250x250.jpg" width="100%" alt="Расчет кухни" />
            </div>
            <div class="form-imgbg xs-50 sm-50 md-33 lg-20 xl-15">
                <input type="radio" class="ventaform" name="kategoriya" value="Расчет спальни" aria-required="true" onChange="Selected(this)">
                <span class="option-title">
                         Спальня
                    </span>
                <img src="/image/cache/catalog/category/bedroom-34-250x250.jpg" width="100%" alt="расчет спальни" />
            </div>



        <!--<input type="hidden" name="style" value="">-->
    </div>


       <select id="gostinnaya" style='display: none;' class="ventaform" name="subkategorii">
            <option value="Стеллажи - гостинная">Стеллажи</option>
            <option value="Стенки - гостинная">Стенки</option>
            <option value="Тумбы под ТВ - гостинная">Тумбы под ТВ</option>
            <option value="Комоды - гостинная">Комоды</option>
            <option value="Журнальные столы - гостинная">Журнальные столы</option>
            <option value="Гостинная под заказ">Гостинная под заказ</option>
       </select>
       <select id="shkafy" style='display: none;' class="ventaform" name="subkategorii">
            <option value="Шкафы серии Старт">Шкафы серии "Старт"</option>
            <option value="Шкафы купе">Шкафы купе</option>
            <option value="Шкафы распашные">Шкафы распашные</option>
            <option value="Встроенные шкафы">Встроенные шкафы</option>
            <option value="Шкафы радиусные">Шкафы радиусные</option>
            <option value="Гардеробные">Гардеробные</option>
            <option value="Двери купе">Двери купе</option>
            <option value="Шкафы на заказ">Шкафы на заказ</option>
       </select>
        <select id="children" style='display: none;' class="ventaform" name="subkategorii">
            <option value="Стеллажи - детская">Стеллажи</option>
            <option value="Кровати - детская">Кровати</option>
            <option value="Комоды - детская">Комоды</option>
            <option value="Комплект мебели - детская">Комплект мебели</option>
            <option value="Детская на заказ">Детская на заказ</option>
        </select>
        <select id="prihozhaya" style='display: none;' class="ventaform" name="subkategorii">
            <option value="Прихожие стенки">Прихожие стенки</option>
            <option value="Тумбы для обуви - прихожая">Тумбы для обуви</option>
            <option value="Комоды - прихожая">Комоды</option>
            <option value="Прихожая на заказ">Прихожая на заказ</option>
        </select>
        <select id="kuhnya" style='display: none;' class="ventaform" name="subkategorii">
            <option value="Современная - кухни">Современные</option>
            <option value="Неоклассика - кухни">Неоклассика</option>
            <option value="Классика - кухни">Классика</option>
            <option value="КЭконом - кухни">Эконом</option>
            <option value="На заказ - кухни">Кухня на заказ</option>
        </select>
        <select id="bedroom" style='display: none;' class="ventaform" name="subkategorii">
            <option value="Кровати - спальня">Кровати</option>
            <option value="Прикроватные тумбы - спальня">Прикроватные тумбы</option>
            <option value="Комоды - спальня">Комоды</option>
            <option value="Туалетные столики - спальня">Туалетные столики</option>
            <option value="Зеркала - спальня">Зеркала</option>
            <option value="На заказ - спальня">Зеркала</option>
        </select>



    </div>


    <div id="field2-container" class="field radio-group">
            <label for="field1-2">
                Шаг 2.	Планировка
            </label>
            <div class="option clearfix">

                <div class="form-imgbg xs-50 sm-50 md-33 lg-19 xl-16">
                    <input type="radio" class="ventaform" name="planirovka" value="Прямая" required>
                    <span class="option-title">
                        Прямая
                </span><br />
                    <img src="/image/calcs/pramaya.png" width="200px" height="134px" alt="Прямая" />
                </div>

                <div class="form-imgbg xs-50 sm-50 md-33 lg-19 xl-16">
                    <input type="radio" class="ventaform" name="planirovka" value="Угловая левая">
                    <span class="option-title">
                         Угловая
                    </span><br />
                    <img src="/image/calcs/uglovaya.png" width="200px" height="134px" alt="Угловая левая" />
                </div>

                <div class="form-imgbg xs-50 sm-50 md-33 lg-19 xl-16">
                    <input type="radio" class="ventaform" name="planirovka" value="П-образная">
                    <span class="option-title">
                         П-образная
                    </span><br />
                    <img src="/image/calcs/p-obraz.png" width="200px" height="134px" alt="П-образная" />
                </div>

                <div class="form-imgbg xs-50 sm-50 md-33 lg-19 xl-16">
                    <input type="radio" class="ventaform" name="planirovka" value="П-образная">
                    <span class="option-title">
                        Остров
                    </span><br />
                    <img src="/image/calcs/ostrov.png" width="200px" height="134px" alt="П-образная" />
                </div>
                <div class="form-imgbg xs-50 sm-50 md-33 lg-19 xl-16">
                    <input type="radio" class="ventaform" name="planirovka" value="Угловая правая">
                    <span class="option-title">
                         На 2 стены
                    </span><br />
                    <img src="/image/calcs/dve-steny.png" width="200px" height="134px" alt="Угловая правая" />
                </div>
            </div>
    </div>

    <div id="field3-container" class="field input">
    <label for="field1-3">
        Шаг 3.	Укажите длину стен
    </label>
    <input name="gabarits" placeholder="AxBxC" required="required" type="text">
    </div>

    <div id="field4-container" class="field input-group">
        <label for="field1-4">
            Шаг 4.	Контактные данные
        </label>
        <input name="name" placeholder="Ваше имя" required="required" type="text">
        <input name="ip" type="hidden" value="<?php echo $_SERVER['REMOTE_ADDR']; ?>">
        <input name="phone" placeholder="Телефон" required="required" type="tel">
        <input name="email" placeholder="E-mail" required="required" type="email">
        <textarea placeholder="Ваш коментарий" name="message"></textarea>
    </div>

    <div id="field5-container" class="field file">
        <label for="field1-3">
            Шаг 5.	Прикрепить эскиз
        </label>
        <input class="ventaform" name="file[]" id="field5" type="file" multiple="multiple">
    </div>

    <div id="form-submit" class="field clearfix submit">
        <!--noindex-->
        <div>Нажимая кнопку «Отправить»  вы даете свое согласие на обработку своих персональных данных в соответстии с законом №152-ФЗ «О персональных данных» от 27.07.2006 и принимаете условия <a href="/terms.html">Пользовательского соглашения</a>.</div>
        <!--/noindex-->

        <button type="submit" data-loading-text="Загрузка..." class="btn btn-buy"><i class="fa fa-paint-brush" aria-hidden="true"></i> Отправить заявку на дизайн</button>

    </div>


</form>

<link rel="stylesheet" href="/utils/uniform/css/venta-raschet.css">
<script type="text/javascript" src="/utils/uniform/js/jquery.uniform.bundled.js"></script>
<script type="text/javascript">
    $(function(){ $("input.ventaform, input.ventaform:file, select.ventaform").uniform(); });
</script>
<script type="text/javascript">
    function Selected(a) {
        var label = a.value;
        if (label=="Расчет гостинной") {
            document.getElementById("uniform-gostinnaya").style.display='block';
            document.getElementById("gostinnaya").style.display='block';
        } else {
            document.getElementById("uniform-gostinnaya").style.display='none';
            document.getElementById("gostinnaya").style.display='none';
        }
        if (label=="Расчет шкафа") {
            document.getElementById("uniform-shkafy").style.display='block';
            document.getElementById("shkafy").style.display='block';
        } else {
            document.getElementById("uniform-shkafy").style.display='none';
            document.getElementById("shkafy").style.display='none';
        }
        if (label=="Расчет детской") {
            document.getElementById("uniform-children").style.display='block';
            document.getElementById("children").style.display='block';
        } else {
            document.getElementById("uniform-children").style.display='none';
            document.getElementById("children").style.display='none';
        }
        if (label=="Расчет прихожей") {
            document.getElementById("uniform-prihozhaya").style.display='block';
            document.getElementById("prihozhaya").style.display='block';
        } else {
            document.getElementById("uniform-prihozhaya").style.display='none';
            document.getElementById("prihozhaya").style.display='none';
        }
        if (label=="Расчет кухни") {
            document.getElementById("uniform-kuhnya").style.display='block';
            document.getElementById("kuhnya").style.display='block';
        } else {
            document.getElementById("uniform-kuhnya").style.display='none';
            document.getElementById("kuhnya").style.display='none';
        }
        if (label=="Расчет спальни") {
            document.getElementById("uniform-bedroom").style.display='block';
            document.getElementById("bedroom").style.display='block';
        } else {
            document.getElementById("uniform-bedroom").style.display='none';
            document.getElementById("bedroom").style.display='none';
        }
    }
</script>