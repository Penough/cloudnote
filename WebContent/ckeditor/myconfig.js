/**
 * @license Copyright (c) 2003-2016, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here.
	// For complete reference see:
    config.language = 'zh-cn'; // 配置语言

    //config.uiColor = '#FFF'; // 背景颜色
    config.width = 'auto'; // 宽度
    config.height = '200px'; // 高度
    //config.toolbar = 'Basic';// 工具栏风格Full,Basic
	// http://docs.ckeditor.com/#!/api/CKEDITOR.config
	config.filebrowserImageBrowseUrl = '/springmvc/ckfinder/ckfinder.html?Type=Images';
	config.filebrowserFlashBrowseUrl = '/springmvc/ckfinder/ckfinder.html?Type=Flash';
	config.filebrowserUploadUrl = '/springmvc/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files';
	config.filebrowserImageUploadUrl = '/springmvc/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images';
	config.filebrowserFlashUploadUrl = '/springmvc/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash';
	config.image_previewText=' ';
	config.filebrowserWindowWidth = '1500';  //“浏览服务器”弹出框的size设置
	config.filebrowserWindowHeight = '500';
	
	// The toolbar groups arrangement, optimized for two toolbar rows.
	config.toolbarGroups = [
		{ name: 'clipboard',   groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing',     groups: [ 'find', 'selection', 'spellchecker' ] },
		{ name: 'links' },
		{ name: 'insert' },
		{ name: 'forms' },
		{ name: 'tools' },
		{ name: 'document',	   groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'others' },
		'/',
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'paragraph',   groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ] },
		{ name: 'styles' },
		{ name: 'colors' },
		{ name: 'about' }
	];
	// Remove some buttons provided by the standard plugins, which are
	// not needed in the Standard(s) toolbar.
	config.removeButtons = 'Underline,Subscript,Superscript';

	// Set the most common block elements.
	config.format_tags = 'p;h1;h2;h3;pre';

	// Simplify the dialog windows.
	config.removeDialogTabs = 'image:advanced;link:advanced';
};
