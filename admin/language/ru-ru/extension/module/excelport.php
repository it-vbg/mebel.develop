<?php
// Heading
$_['heading_title']						= 'ExcelPort';
$_['heading_title_version']				= 'ExcelPort 2.5.2';

// Text
$_['text_module']         				= 'Modules';
$_['text_success']						= 'Success: You have modified module ExcelPort!';
$_['text_activate']						= 'Activate';
$_['text_not_activated']				= 'ExcelPort is not activated.';
$_['text_click_activate']				= 'Activate ExcelPort';
$_['text_success_activation']			= 'ACTIVATED: You have successfully activated ExcelPort!';
$_['text_content_top']					= 'Content Top';
$_['text_content_bottom']				= 'Content Bottom';
$_['text_column_left']					= 'Column Left';
$_['text_column_right']					= 'Column Right';
$_['text_datatype_option_products']		= 'Товары';
$_['text_datatype_option_categories']	= 'Категории';
$_['text_datatype_option_attributes']	= 'Атрибуты и группы атрибутов';
$_['text_datatype_option_coupons']		= 'Купоны';
$_['text_datatype_option_vouchers']		= 'Подарочные сертификаты';
$_['text_question_data']				= 'Какие данные ты хочешь экспортировать?';
$_['text_question_store']				= 'Из какого магазина экспортировать';
$_['text_question_language']			= 'Какой язык экспортировать?';
$_['text_note']							= 'Заметка:';
$_['text_supported_in_oc1541']			= 'Если выбьет ошибку 500 - сказать админу чтобы докрутил память у сервера.';
$_['text_learn_to_increase']			= 'Мануал.';
$_['text_feature_unsupported']			= 'This feature is supported only for OpenCart version {VERSION}';
$_['text_question_data_import']			= 'Какие данные ты хочешь импортировать?';
$_['text_question_store_import']		= 'В какой магазин вы хотите импортировать?';
$_['text_question_language_import']		= 'Какой язык вы хотите импортировать?';
$_['text_question_file_import']			= 'Выбери .xlsx or .zip файл для импорта:';
$_['text_file_generating']				= 'Generating file. Please wait...';
$_['text_file_downloading']				= 'Downloading file...';
$_['text_import_done']					= 'Import finished. {COUNT} {TYPE} were imported.';
$_['text_preparing_data']				= 'Preparing data...';
$_['text_export_entries_number']		= 'Количество записей на экспортируемую часть:<span class="help">Установите это значение ниже, если возникают проблемы с памятью. Чем ниже значение, тем больше экспортированных файлов вы получите. Не применяется к атрибутам.</span>';
$_['text_import_limit']					= 'Максимальное количество записей для чтения на каждом шаге импорта:<span class="help">Значение по умолчанию 100. Уменьшите его, если возникают проблемы с памятью при импорте. Не применяется для атрибутов и параметров.</span>';
$_['text_export_entries_number']		= '<span data-toggle="tooltip" title="Установите это значение ниже, если возникают проблемы с памятью. Чем ниже значение, тем больше экспортированных файлов вы получите. Не применяется для атрибутов.">Количество записей на экспортируемую часть</span>';
$_['text_import_limit']					= '<span data-toggle="tooltip" title="Значение по умолчанию 100. Уменьшите его, если возникают проблемы с памятью при импорте. Не применяется для атрибутов и параметров.">Максимальное количество записей для чтения на каждом шаге импорта.</span>';
$_['text_question_product_type']		= 'Как вы хотите структурировать экспортируемые товары?';
$_['text_question_delete_other']		= 'Удалить записи перед импортом? Сначала будут удалены все записи базы данных выбранного типа импорта. После этого импорт будет продолжен. Перед использованием этого параметра рекомендуется выполнить полное резервное копирование базы данных.';
$_['text_confirm_delete_other']			= 'This will delete all your entries before importing. It is advised to back up your database before the import. If you are sure you wish to continue, click OK.';
$_['text_question_product_type_quick']			= 'Основной экспорт - Однострочный экспорт продукции, исключая: Атрибуты, Повторяющиеся платежи, Профили, Опции, Скидки, Специальные предложения, Изображения, Наградные баллы и проекты.';
$_['text_question_product_type_full']			= 'Сгруппированный экспорт - экспортировать на один лист. Каждый товар представлен в сгруппированных строках.';
$_['text_question_product_type_bulk']			= 'Массовый экспорт-экспорт нескольких листов, подходит для массового редактирования целей. <a href="https://isenselabs.com/posts/excelport-introducing-bulk-mode" target="_blank"><i class="fa fa-external-link"></i> Подробнее</a>';
$_['text_question_add_as_new']			= 'Импортировать товары как новые - это будет игнорировать поле Product ID и импортировать товары, как если бы они были новыми. Имейте в виду, что Сопуствующие товары не будут работать на вручную добавленые ID&#39;s';
$_['text_toggle_filter']				= 'Фильтр';
$_['text_conjunction']					= 'Сопоставление фильтров';
$_['help_conjunction']					= 'If you use &quot;AND&quot;, then ALL of the conditiones must be met. If you choose &quot;OR&quot;, then the entity will be listed if at least 1 condition is met.';
$_['text_the_value']					= 'значение';
$_['text_datatype_option_customers']	= 'Покупатели';
$_['text_datatype_option_customer_groups'] = 'Группы Покупателей';
$_['text_datatype_option_options']		= 'Опции';
$_['text_datatype_option_orders']		= 'Заказы';
$_['text_datatype_option_manufacturers'] = 'Производители';
$_['text_last_import']                  = 'Your last import was the following:<br /><strong>{FILE}</strong>';

$_['text_openstock_installed'] = 'Your ExcelPort supports OpenStock!';

$_['text_export_product_description_html'] = '<span data-toggle="tooltip" title="Этот параметр влияет на экспорт товаров.">Правила обработки для описаний товара:</span>';
$_['option_encoded_html'] = 'Закодировать HTML символы: &amp;lt;p&amp;gt;';
$_['option_standard_html'] = 'Стандартные HTML символы: &lt;p&gt;';
$_['option_no_html'] = 'Без HTML символов';

// Entry
$_['entry_code']						= 'ExcelPort status:<br /><span class="help">Enable or disable ExcelPort</span>';
$_['entry_layouts_active']				= 'Activated on:<br /><span class="help">Choose on which pages ExcelPort to be active</span>';

// Error
$_['error_permission']					= 'Warning: You do not have permission to modify module ExcelPort!';
$_['error_no_file']						= 'File was not uploaded.';

// Button
$_['button_export']						= 'Экспортировать';
$_['button_import']						= 'Импортировать';
$_['button_add_condition']				= 'Добавить Фильтр';
$_['button_discard_condition']			= 'Убрать Фильтр';

$_['excelport_unable_cache']			= 'Could not set cache storage method.';
$_['excelport_unable_upload']			= 'Temp file was not moved to the target folder.';
$_['excelport_invalid_file']			= 'Недопустимый файл-он слишком большой или в неправильном формате.';
$_['excelport_folder_not_string']		= 'The passed variable is not a string.';
$_['excelport_file_not_exists']			= 'The file you wish to import does not exist on the server.';
$_['excelport_export_limit_invalid'] 	= 'Ivalid entry number per file. Please set it between 50 and 800.';
$_['excelport_invalid_import_file']		= 'The imported file does not exist in the file system!';
$_['excelport_unable_zip_file_open']	= 'Не получается открыть zip файл. Возможно он поврежден.';
$_['excelport_unable_zip_file_extract'] = 'Cannot extract the zip file.';
$_['excelport_unable_create_unzip_folder'] = 'Cannot create the unzip folder.';
$_['excelport_import_limit_invalid']	= 'Ivalid entry import limit. Please set it between 10 and 800.';
$_['excelport_mode_unknown']			= 'The first row (table header) of the imported table is invalid. Please use fields for either Quick Mode or Full Mode. Refer to the ExcelPort documentation for more information.';
$_['excelport_sheet_unknown'] = 'The first sheet in the .XLSX must be called &quot;Products&quot;';

$_['excelport_openstock_failed'] = 'OpenStock for ExcelPort has not been applied. Please copy the file %s to %s.';
$_['excelport_openstock_uninstall_failed'] = 'OpenStock for ExcelPort cannot get uninstalled. Please remove the file %s.';

$_['import_success']					= 'SUCCESS: The products have been imported.';

$_['license_your_license'] = 'Your License';
$_['license_enter_code'] = 'Please enter your product purchase license code:';
$_['license_placeholder'] = 'License Code e.g. XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX';
$_['license_activate'] = 'Activate License';
$_['license_get_code'] = 'Not having a code? Get it from here.';
$_['license_holder'] = 'License Holder';
$_['license_registered_domains'] = 'Registered Domains';
$_['license_expires'] = 'License Expires on';
$_['license_valid'] = 'VALID LICENSE';
$_['license_manage'] = 'Manage';
$_['license_get_support'] = 'Get Support';
$_['license_community'] = 'Community';
$_['license_community_info'] = 'Ask the community about your issue on the iSenseLabs forum.';
$_['license_forums'] = 'Browse forums';
$_['license_tickets'] = 'Tickets';
$_['license_tickets_info'] = 'Want to comminicate one-to-one with our tech people? Then open a support ticket.';
$_['license_tickets_open'] = 'Open a support ticket';
$_['license_presale'] = 'Pre-sale';
$_['license_presale_info'] = 'Have a brilliant idea for your webstore? Our team of top-notch developers can make it real.';
$_['license_presale_bump'] = 'Bump the sales';
$_['license_missing'] = 'You are running an unlicensed version of this module! <a href="javascript:void(0);" onclick="jq(\'.excelport_tab:eq(3)\').trigger(\'click\'); jq(\'.licenseCodeBox\').focus();">Click here to enter your license code</a> to ensure proper functioning, access to support and updates.';