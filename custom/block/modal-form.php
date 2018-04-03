<div class="remodal" data-remodal-id="modal" role="dialog" id="form-modal" aria-labelledby="modal1Title" aria-describedby="modal1Desc">
    <div class="remodalBorder">
        <button data-remodal-action="close" class="remodal-close" aria-label="Close"></button>
        <form id="form" class="form-modal sendform">
            <div class="modal-header">
                <h2 class="modal-title" id="product_name"><?php echo $heading_title; ?></h2>
            </div>
            <div class="modal-body">
                <div class="input-group"><i class="fa fa-2x fa-fw fa-user" aria-hidden="true"></i><input type="text" class="putName" name="name" placeholder="Ваше ваше имя" required></div>
                <div class="input-group"><i class="fa fa-2x fa-fw fa-phone" aria-hidden="true"></i><input name="phone" type="tel" class="putPhone" placeholder="Введите номер телефона" required></div>
                <div class="input-group"><i class="fa fa-2x fa-fw fa-envelope" aria-hidden="true"></i><input name="email" type="email" class="putPhone" placeholder="Введите E-mail"></div>
                <div style="display:none">
                    <input name="order_product" id="order_product" type="text" value="<a href='https://mebel.furniture<?php echo $_SERVER['REQUEST_URI']; ?>'><?php echo $heading_title; ?></a>">
                    <input name="ip" type="hidden" value="<?php echo $_SERVER['REMOTE_ADDR']; ?>">
                </div>
            </div>
            <div class="modal-footer">
                <input type="submit" name="submit" class="btn btn-modal-send btn-orange" value="ОТПРАВИТЬ" onclick="yaCounter45925443.reachGoal('modal-send'); ga ('send', 'event', 'form', 'submit', 'modal-send'); return true;">
                <input type="hidden" name="formData" value="Заявка с сайта">
            </div>
        </form>
    </div>
</div>