<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
require 'smsru_php/sms.ru.php';
require 'PHPMailer/config.php';
require 'PHPMailer/PHPMailerAutoload.php';
$mail = new PHPMailer;

/* Задаем переменные */
if (isset($_POST['kategoriya'])) {$kategoriya = htmlspecialchars($_POST['kategoriya']);}
if (isset($_POST['subkategorii'])) {$subkategorii = htmlspecialchars($_POST['subkategorii']);}
if (isset($_POST['planirovka'])) {$planirovka = htmlspecialchars($_POST['planirovka']);}
if (isset($_POST['gabarits'])) {$gabarits = htmlspecialchars($_POST['gabarits']);}

if (isset($_POST['name'])) {$name = htmlspecialchars($_POST['name']);}
if (isset($_POST['email'])) {$email = htmlspecialchars($_POST['email']);}
if (isset($_POST['phone'])) {$phone = htmlspecialchars($_POST['phone']);}
if (isset($_POST['message'])) {$message = htmlspecialchars($_POST['message']);}
if (isset($_POST['bezspama'])) {$bezspama = htmlspecialchars($_POST['bezspama']);}
if (isset($_POST['from'])) {$from = htmlspecialchars($_POST['from']);}
if (isset($_FILES['file']) &&
    $_FILES['file']['error'] == UPLOAD_ERR_OK) {
    $mail->AddAttachment($_FILES['file']['tmp_name'],
        $_FILES['file']['name']);
}
$ip = $_POST["ip"];
$order_product = $_POST["order_product"];

$site = 'mebel.furniture';

/*
//Отправляем СМСки
    if (isset($_POST['phone'])) {
        $smsru = new SMSRU('738AEF57-12E6-3C31-EA70-CFD8D0A28F80'); // Ваш уникальный программный ключ, который можно получить на главной странице
        $data = new stdClass();
        $data->to = $phone;
        $data->text = 'Hello World'; // Текст сообщения
        $data->from = 'VENTA-MEBEL'; // Если у вас уже одобрен буквенный отправитель, его можно указать здесь, в противном случае будет использоваться ваш отправитель по умолчанию
// $data->time = time() + 7*60*60; // Отложить отправку на 7 часов
// $data->translit = 1; // Перевести все русские символы в латиницу (позволяет сэкономить на длине СМС)
// $data->test = 1; // Позволяет выполнить запрос в тестовом режиме без реальной отправки сообщения
// $data->partner_id = '1'; // Можно указать ваш ID партнера, если вы интегрируете код в чужую систему
        $sms = $smsru->send_one($data); // Отправка сообщения и возврат данных в переменную

        if ($sms->status == "OK") { // Запрос выполнен успешно
            //echo "Сообщение отправлено успешно. ";
            //echo "ID сообщения: $sms->sms_id.";
        } else {
            //echo "Сообщение не отправлено. ";
            //echo "Код ошибки: $sms->status_code. ";
            //echo "Текст ошибки: $sms->status_text.";
        }
    }
//Конец отправки СМСок
*/



$mail->isHTML(true);
$mail -> CharSet = "UTF-8";
$mail->setFrom('noreply@venta-mebel.ru', 'Вента Мебель');
$mail->addAddress('venta-mebel@yandex.com', 'Заявка');     // Add a recipient
//$mail->addAddress('ellen@example.com');               // Name is optional
$mail->addReplyTo('venta-mebel@yandex.com', 'Information');



//Attach multiple files one by one
for ($ct = 0; $ct < count($_FILES['file']['tmp_name']); $ct++) {
    $uploadfile = tempnam(sys_get_temp_dir(), sha1($_FILES['file']['name'][$ct]));
    $filename = $_FILES['file']['name'][$ct];
    if (move_uploaded_file($_FILES['file']['tmp_name'][$ct], $uploadfile)) {
        $mail->addAttachment($uploadfile, $filename);
    } else {
        echo 'Ошибка загрузки файла ' . $uploadfile;
    }
}


$mail->Subject = 'Заявка с сайта - '.$site;

$msg = '<div style="border: 1px solid #000; padding: 10px;">';
$msg .= "<h3 style='text-align: center;'>Вам пришла заявка с сайта - $site</h3>";
if(isset($from))$msg .= "<p>Заявка отправлена <strong>$from</strong></p>";
if(isset($order_product))$msg .= "<p>Заявка отправлена со страницы: <strong>$order_product</strong></p>";
if(isset($name))$msg .= "<p>Имя клиента: <strong>$name</strong></p>";
if(isset($phone))$msg .= "<p>Телефон клиента: <strong>$phone</strong></p>";
if(isset($email))$msg .= "<p>E-mail клиента: <strong>$email</strong></p>";
if(isset($msg))$message .= "<p>Комментарий: $message </p>";
if(isset($ip))$msg .= "<p>IP клиента: $ip </p>";

if(isset($kategoriya))$msg .= "<h3 style='text-align: center;'>Нужно расчитать</h3><p>Категория: <strong >$kategoriya</strong ></p>";
if(isset($subkategorii))$msg .= "<p>Подкатегория <strong>$subkategorii</strong></p>";
if(isset($planirovka))$msg .= "<p>Планировка: <strong >$planirovka</strong></p>";
if(isset($gabarits))$msg .= "<p>Габариты: <strong>$gabarits</strong></p>";
$msg .= "</div>";



$mail->Body    = $msg;

$mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

if(!$mail->send()) {
    echo '
<div class="modal-header"><h2>Ошибка</h2></div>
<div class="modal-body"><h3>Сообщение не отправлено! Проверьте корректность ввода данных</h3></div>';
} else {
    echo '
<div class="modal-header"><h2>Сообщение отправлено</h2></div>
<div class="modal-body"><h3>Наш менеджер в ближайшее время с Вами свяжется!</h3></div>';
}
}
else {
    http_response_code(403);
    echo "Попробуйте еще раз";
}
?>