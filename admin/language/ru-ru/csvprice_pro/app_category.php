<?php
// Settings
$_['setting_replace_eol'] = '0';

// Heading
$_['heading_title'] = 'Категории';
$_['heading_title_normal'] = 'CSV Price Pro import/export 4';

// Text global
$_['text_module'] = 'Модули';
$_['text_extension'] = 'Расширения';
$_['text_default'] = ' <b>(По умолчанию)</b>';
$_['text_yes'] = 'Да';
$_['text_no'] = 'Нет';
$_['text_enabled'] = 'Включено';
$_['text_disabled'] = 'Отключено';
$_['text_select_all'] = 'Выделить все';
$_['text_unselect_all'] = 'Снять выделение';
$_['text_select'] = 'Выбрать';
$_['text_show_all'] = 'Показать все';
$_['text_hide_all'] = 'Скрыть не отмеченные';
$_['text_all'] = 'Все';
$_['text_no_results'] = 'Нет данных!';
$_['text_none'] = ' --- Не выбрано --- ';
$_['text_as'] = 'В виде %s';
$_['text_confirm_delete'] = 'Удаление невозможно отменить! Вы уверены, что хотите это сделать?';

// Text
$_['text_success_macros'] = 'Настройки макросов успешно обновлены!';
$_['text_import_mode_both'] = 'Обновить и Добавить';
$_['text_import_mode_delete'] = '* Удалить навсегда *';
$_['text_import_mode_insert'] = 'Только добавить';
$_['text_import_mode_update'] = 'Только обновить';
$_['text_success_import'] = 'Импорт данных завершён!<br />Всего обработано <b>%s</b> строк!<br /><br /> Обновлено: <b>%s</b><br />Добавлено: <b>%s</b></b><br />Пропущено: <b>%s</b>';

// Tabs
$_['tab_export'] = 'Экспорт';
$_['tab_import'] = 'Импорт';
$_['tab_macros'] = 'Макросы';
$_['tab_setting'] = 'Настройки';

// Button
$_['button_default'] = 'По умолчанию';
$_['button_export'] = 'Экспорт';
$_['button_import'] = 'Импорт';
$_['button_insert'] = 'Добавить';
$_['button_remove'] = 'Удалить';
$_['button_save'] = 'Сохранить';
$_['button_exec'] = 'Выполнить';
$_['button_load'] = 'Загрузить';
$_['button_delete'] = 'Удалить';

// Entry
$_['entry_file_encoding'] = 'Кодировка файла:';
$_['entry_languages'] = 'Локализация:';
$_['entry_category'] = 'Категории:';
$_['entry_category_delimiter'] = 'Разделитель для категорий:';
$_['entry_csv_delimiter'] = 'Разделитель полей CSV:';
$_['entry_csv_text_delimiter'] = 'Разделитель текста:';
$_['entry_store'] = 'Магазины:';
$_['entry_category_parent'] = 'Экспортировать с родительскими категориями:';
$_['entry_table'] = 'Таблица';
$_['entry_field_name'] = 'Имя поля';
$_['entry_csv_name'] = 'Заголовок CSV';
$_['entry_caption'] = 'Название';
$_['entry_import_mode'] = 'Режим импорта:';
$_['entry_key_field'] = 'Ключевое поле для обновления:';
$_['entry_sort_order'] = 'Порядок сортировки';
$_['entry_status'] = 'Статус:';
$_['entry_import_category_disable'] = 'Отключить все категории перед импортом:';
$_['entry_import_file'] = 'Импорт данных из файла:';
$_['entry_import_img_download'] = 'Включить докачку изображений по URL:';
$_['entry_image_url'] = 'URL изображений:';

// Error
$_['error_permission'] = 'У Вас нет прав для управления этим модулем!';
$_['error_directory_not_available'] = 'Директория <b>system/csvprice_pro</b> не доступна для записи или не существует';
$_['error_move_uploaded_file'] = 'Ошибка копирования файла!';
$_['error_uploaded_file'] = 'Файл не загружен!';
$_['error_copy_uploaded_file'] = 'Не удалось скопировать файл!';
$_['error_export_empty_rows'] = 'Нет данных для экспорта!';

// Fields
$_['_ID_'] = 'id категории';
$_['_NAME_'] = 'Наименование';
$_['_FILTERS_'] = 'Фильтры';
$_['_SEO_KEYWORD_'] = 'SEO Keyword';
$_['_META_H1_'] = 'HTML-тег H1';
$_['_META_TITLE_'] = 'Мета-тег Title';
$_['_META_KEYWORDS_'] = 'Мета-тег Keywords';
$_['_META_DESCRIPTION_'] = 'Мета-тег Description';
$_['_DESCRIPTION_'] = 'Текст с описанием';
$_['_IMAGE_'] = 'Изображение';
$_['_SORT_ORDER_'] = 'Порядок сортировки';
$_['_STATUS_'] = 'Статус';
$_['_COLUMN_'] = 'Количество колонок';
$_['_TOP_'] = 'Главное меню';
$_['_PARENT_ID_'] = 'id родительской категории';
$_['_STORE_ID_'] = 'id магазинов';
$_['_URL_'] = 'URL категории';

$_['prop_descr'] = ' 
prop_descr[0]="<p><b>Кодировка CSV-файла</b></p><p>Ваш магазин работает в кодировке UTF-8, что бы избежать проблем с импортом и экспортом используйте кодировку UTF-8.</p>";
prop_descr[1]="<p><b>Разделитель полей CSV</b></p><p>Символ, который будет использован в качестве разделителя для отдельных колонок (значений) в CSV-файле.</p>";
prop_descr[2]="<p><b>Локализация</b></p><p>На каком языке будут экспортироваться данные, например название товара или описание товара</p>";
prop_descr[3]="<p><b>Категории</b></p><p>Если категории не выбраны - экспортирует все категории (по умолчанию).</p>";
prop_descr[4]="<p><b>Разделитель для категорий</b></p><p>Разделитель между названиями категорий (вложенность категорий) например:<br /><br /><i>Главная категория</i>|<i>Подкатегория</i></p><p>Если у товара категорий несколько, то категори категории будут записаны в виде наименований категорий списком, каждая категория будет записана с новой строки (многострочное поле), например: <br /><br /><i>Главная категория 1</i>|<i>Подкатегория 2</i><br /><i>Главная категория 3</i>|<i>Подкатегория 4</i></p>";
prop_descr[5]="<p><b>Экспортировать с родительскими категориями</b></p><p>В название категории будут включены все родительские категории, например:<br /><br /><i>Главная категория</i>|<i>Подкатегория|Категория</i></p>";
prop_descr[6]="<p><b>Локализация</b></p><p>На каком языке будут импортироваться данные, например название товара или описание товара</p>";
prop_descr[7]="<p><b>Режим импорта</p></b><p><i>Только обновить</i> - в этом режиме осуществляется поиск категории по ключевому полю и если совпадение найдено то категория будет обновлена из CSV-файла.</p><p><i>Только добавить</i> - в этом режиме все категории будут добавлены как новые из CSV-файла независимо пристуствуют эти категории в базе магазина или нет.</p><p><i>Обновить и Добавить</i> - в этом режиме осуществляется поиск товара по ключевому полю, если совпадение найдено то категория будет обновлена из CSV-файла, если совпадений нет то категория будет добавлена как новая.</p>";
prop_descr[8]="<p><b>Ключевое поле</b></p><p>Ключевое поле, по которому ищется совпадение категории в базе магазина, используется в режимах <i>Только обновить</i>, <i>Обновить и Добавить</i>.</p>";
prop_descr[9]="<p><b>Разделитель для поля _CATEGORY_</b></p><p>Разделитель между названиями категорий (вложенность категорий) например:<br /><br /><i>Главная категория</i>|<i>Подкатегория</i></p>";
prop_descr[10]="<p><b>Включить докачку изображений по URL</b></p><p>Закачивает изображения по ссылкам в полях _IMAGE_ и _IMAGES_.</p><p>Ссылки должны быть вида:<br /> http://www.example.com/dir/image_name.jpg</p>";
prop_descr[11]="<p><b>Разделитель текста</b></p><p>Символ для обрамления текстовых полей, а так же значений, содержащих зарезервированные символы (двойная кавычка, запятая, точка с запятой, новая строка)</p>";
prop_descr[32]="<p><b>URL изображений</b></p><p>Экспортирует значения _IMAGE_ и _IMAGES_ как ссылку на изображение вида http://www.example.com/dir/image_name.jpg</p>";
';