# PsWorldApp


## Introduction:

Ruby on Rails is an awesome framework for quickly and easily setting up a web application. 

### Installing CKeditor:
use its editor for the creation and updating of a post, as it is a better option .

First let us install the gem, open up your ``` Gemfile ``` and paste in the line below and save.

```//Gemfile ```

```ruby gem 'ckeditor', '~> 4.1', ```

Go to your terminal and install:

```bundle install```

let us go ahead and generate the necessary files for ckeditor to work with. Run the command below from your terminal:

```rails generate ckeditor:install --orm=active_record --backend=carrierwave```

This will create some directories and files. You can go ahead and check them out according to the output shown on your terminal.

Now migrate your database.
```rake db:migrate```

We need to load ckeditor, go to app/assets/javascripts/application.js and the line below just above the tree line.

```//= require ckeditor/init```

Create a directory called ckeditor in app/assets/javascripts, then create a new file called config.js in the directory you just created. Paste in the code below:

```ruby
 CKEDITOR.editorConfig = function(config) {
  config.language = 'en';
  config.width = '700';
  config.filebrowserBrowseUrl = "/ckeditor/attachment_files";
  config.filebrowserImageBrowseLinkUrl = "/ckeditor/pictures";
  config.filebrowserImageBrowseUrl = "/ckeditor/pictures";
  config.filebrowserImageUploadUrl = "/ckeditor/pictures";
  config.filebrowserUploadUrl = "/ckeditor/attachment_files";

  config.toolbar_Pure = [
    '/', {
      name: 'basicstyles',
      items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat']
    }, {
      name: 'paragraph',
      items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl']
    }, {
      name: 'links',
      items: ['Link', 'Unlink']
    }, '/', {
      name: 'styles',
      items: ['Styles', 'Format', 'Font', 'FontSize']
    }, {
      name: 'colors',
      items: ['TextColor', 'BGColor']
    }, {
      name: 'insert',
      items: ['Image', 'Table', 'HorizontalRule', 'PageBreak']
    }
  ];
  config.toolbar = 'Pure';
  return true;
};
```


Start up your rails server:

```rails server```
