var instance = CKEDITOR.instances['content_body'];

CKEDITOR.config.extraPlugins = 'codesnippet'
CKEDITOR.config.codeSnippet_theme = 'monokai_sublime'
CKEDITOR.config.codeSnippet_languages = {
	apache: 'Apache',
	bash: 'Bash',
	coffeescript: 'CoffeeScript',
	css: 'CSS',
	javascript: 'JavaScript',
	json: 'JSON',
	markdown: 'Markdown',
	html: 'Markup',
	nginx: 'Nginx',
	objectivec: 'Objective-C',
	php: 'PHP',
	ruby: 'Ruby',
	sql: 'SQL',
	xml: 'XML'
}

CKEDITOR.config.height = 400;

CKEDITOR.config.toolbar = [
    { name: 'styles', items : ['Format' ] },
    { name: 'basicstyles', items : [ 'Bold','Italic','Strike','-','RemoveFormat' ] },
    { name: 'insert', items : [ 'Image','Table' ] },
    { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent' ] },
    { name: 'links', items : [ 'Link','Unlink' ] },
    { name: 'tools', items : [ 'Maximize' ] },
    { name: 'tools', items : [ 'Source' , 'CodeSnippet', 'HorizontalRule'] },
];

CKEDITOR.config.allowedContent = 'h1 h2 h3 h4 h5 p b em s table tr td thead tbody ul ol li span pre code div hr img[src,alt, style]; a[!href]'; 
CKEDITOR.config.filebrowserUploadUrl = '/admin/asset-upload?type=Files&dir=' + encodeURIComponent('content/images')

