<style>
.sucess {text-align: center; width: 600px; height: 150px; margin: 150px auto; background: url("/image/data/mail/sucess.png") no-repeat;}
h2 {font-size: 30px; padding-top: 30px;}
    p{font-size: 24px;}


</style>




<?php
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
$site = 'mebel.furniture';



$mail->isHTML(true);
$mail -> CharSet = "UTF-8";
$mail->setFrom('from@example.com', 'Mailer');
$mail->addAddress('itvbg@mail.ru', 'Joe User');     // Add a recipient
//$mail->addAddress('ellen@example.com');               // Name is optional
$mail->addReplyTo('info@example.com', 'Information');



//Attach multiple files one by one
for ($ct = 0; $ct < count($_FILES['file']['tmp_name']); $ct++) {
    $uploadfile = tempnam(sys_get_temp_dir(), sha1($_FILES['file']['name'][$ct]));
    $filename = $_FILES['file']['name'][$ct];
    if (move_uploaded_file($_FILES['file']['tmp_name'][$ct], $uploadfile)) {
        $mail->addAttachment($uploadfile, $filename);
    }
    /*else {
        echo 'Ошибка загрузки файла ' . $uploadfile;
    }*/
}


$mail->Subject = 'Заявка с сайта - '.$site;

$msg = '<div style="border: 1px solid #000; padding: 10px;">';
$msg .= "<h3 style='text-align: center;'>Вам пришла заявка с сайта - $site</h3>";
if(!empty($from))$msg .= "<p>Заявка отправлена <strong>$from</strong></p>";
if(!empty($name))$msg .= "<p>Имя клиента: <strong>$name</strong></p>";
if(!empty($phone))$msg .= "<p>Телефон клиента: <strong>$phone</strong></p>";
if(!empty($email))$msg .= "<p>E-mail клиента: <strong>$email</strong></p>";
if(!empty($msg))$message .= "<p>Комментарий: $message </p>";
if(!empty($ip))$msg .= "<p>IP клиента: $ip </p>";

if(!empty($kategoriya))$msg .= "<h3 style='text-align: center;'>Нужно расчитать</h3><p>Категория: <strong >$kategoriya</strong ></p>";
if(!empty($subkategorii))$msg .= "<p>Подкатегория <strong>$subkategorii</strong></p>";
if(!empty($planirovka))$msg .= "<p>Планировка: <strong >$planirovka</strong></p>";
if(!empty($gabarits))$msg .= "<p>Габариты: <strong>$gabarits</strong></p>";
$msg .= "</div>";



$mail->Body    = $msg;

$mail->AltBody = 'This is the body in plain text for non-HTML mail clients';
?>



<?php if(!$mail->send()) : ?>
<div class="false">
    <p>Письмо не отправлено.</p>
    <p><?php echo 'Mailer Error: ' . $mail->ErrorInfo; ?></p>
</div>
<?php else : ?>

<div class="sucess">
    <h2>Спасибо!</h2>
    <p>Ваш запрос отправлен! Наш специалист в ближайшее время с Вами свяжется!</p>
</div>


<?php echo "<meta http-equiv=\"refresh\" content=\"2;url=" . $_SERVER['HTTP_REFERER'] . "\">"; ?>
<?php endif; ?>




