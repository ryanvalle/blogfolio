var instance = CKEDITOR.instances['content_body'];

CKEDITOR.config.extraPlugins = 'codesnippet'
CKEDITOR.config.codeSnippet_theme = 'monokai_sublime'

CKEDITOR.config.toolbar = [
    { name: 'styles', items : ['Format' ] },
    { name: 'basicstyles', items : [ 'Bold','Italic','Strike','-','RemoveFormat' ] },
    { name: 'insert', items : [ 'Image','Table' ] },
    { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent' ] },
    { name: 'links', items : [ 'Link','Unlink' ] },
    { name: 'tools', items : [ 'Maximize' ] },
    { name: 'tools', items : [ 'Source' , 'CodeSnippet', 'HorizontalRule'] },
];

CKEDITOR.config.allowedContent = 'h1 h2 h3 h4 h5 p b em s table tr td thead tbody ul ol li a span pre code div hr img[src,alt, style]'; 
CKEDITOR.config.filebrowserUploadUrl = '/admin/asset-upload?type=Files&dir=' + encodeURIComponent('content/images')
//CKEDITOR.config.contentsCss = '/fonts.css';

