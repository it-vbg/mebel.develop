/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	 config.extraPlugins = 'templates';
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	
	//��������� ����
	CKEDITOR.config.protectedSource.push(/<(style)[^>]*>.*<\/style>/ig);
	CKEDITOR.config.protectedSource.push(/<(script)[^>]*>.*<\/script>/ig);// ��������� ���� <script>
	CKEDITOR.config.protectedSource.push(/<\?[\s\S]*?\?>/g);// ��������� php-���
	CKEDITOR.config.protectedSource.push(/<!--dev-->[\s\S]*<!--\/dev-->/g);
    CKEDITOR.config.protectedSource.push(/<i[^>]*><\/i>/g);
	CKEDITOR.config.allowedContent = true; /* all tags */
	
	// Toolbar configuration.
    config.toolbar = [
        { name: 'document', items: [ 'Source', 'autoFormat', 'CommentSelectedRange', 'UncommentSelectedRange', 'AutoComplete', '-', 'Save', 'NewPage', 'Preview', 'Print', '-', 'Templates' ] },
        { name: 'clipboard', items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
        { name: 'editing', items: [ 'Find', 'Replace', '-', 'SelectAll', '-', 'Scayt', 'AutoCorrect' ] },
        { name: 'forms', items: [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField', '-', 'simplebutton' ] },
        { name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
        '/',
        { name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat' ] },
        { name: 'colors', items: [ 'TextColor', 'BGColor' ] },
        { name: 'paragraph', items: [ 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-',  '-', 'BidiLtr', 'BidiRtl', 'Language' ] },
        { name: 'insert', items: [ 'Templates', 'Image', 'Slideshow', 'Table', 'HorizontalRule', 'PageBreak', 'Iframe', '-', 'Glyphicons', 'FontAwesome', 'Symbol', 'SpecialChar', '-', 'leaflet', 'embed', 'Youtube', 'videosnapshot', 'Html5video', 'Flash', '-', 'WidgetcommonQuotebox', 'WidgetcommonBox', 'Smiley', 'qrc' ] },
        '/',
        { name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize', 'lineheight', 'letterspacing' ] },
        { name: 'tools', items: [ 'Maximize', 'ShowBlocks' ] },
        { name: 'about', items: [ 'About' ] }
    ];	
};
