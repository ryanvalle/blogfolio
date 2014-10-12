var instance = CKEDITOR.instances['content_body'];

CKEDITOR.config.extraPlugins = 'codesnippet'
CKEDITOR.config.codeSnippet_theme = 'monokai_sublime'

CKEDITOR.config.toolbar = [
    { name: 'styles', items : ['Format' ] },
    { name: 'basicstyles', items : [ 'Bold','Italic','Strike','-','RemoveFormat' ] },
    { name: 'insert', items : [ 'Image','Table','Smiley','SpecialChar' ] },
    { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent' ] },
    { name: 'links', items : [ 'Link','Unlink' ] },
    { name: 'tools', items : [ 'Maximize' ] },
    { name: 'tools', items : [ 'Source' , 'CodeSnippet'] },
];

CKEDITOR.config.allowedContent = true; 

CKEDITOR.config.filebrowserUploadUrl = '/admin/asset-upload?type=Files&dir=' + encodeURIComponent('content/images')
//CKEDITOR.config.contentsCss = '/fonts.css';

