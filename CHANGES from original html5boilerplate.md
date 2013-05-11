Things changed from the “pure” version of HTML5 boilerplate
================================================

This Nesta theme is based on [HTML5 boilerplate](html5bp), version 4.2.0.

In this document I list changes made, in order to adapt it to Nesta. (Can prove useful when HTML5 boilerplate or the gem updates and this theme is to follow.)


### html5boilerplate (the theme’s directory)

* Wrote the `README.md` and added the text you are reading now.

### html5boilerplate/public/html5boilerplate/

* Created a new directory `static-css`[^ssh-rename] and moved `normalize.css` and `main.css` here from `html5boilerplate/views/css`.

[^ssh-rename]: First i tried naming it `css` but had some problems with the Nesta app.rb’s `/css/:sheet.css` rule firing. Probably I did something wrong, but renaming it solved the problem so I did not dig any further.

### html5boilerplate/views/

* Dowloaded, and copied everything from [HTML5 boilerplate](html5bp) (4.2.0) except the `.gitattributes` och `.gitignore`-files, into views.

* Took the code from `index.html` and translated it into haml[^haml vs erb], using [htmltohaml](http://htmltohaml.com/). Created `layout.haml` with it, and deleted `index.html`. 
[^haml vs erb]: I'm not sure haml is the right way to do. Using erb would make it easier to see that the layout template is a correct conversion of the original html. On the other hand, using haml makes it easier to use the haml-partials that are already present in the Nesta gem. 

* Added `master.sass`[^3]. This is the place where all author styling is done or imported. (If it is removed, there is a `master.css` in the Nesta gem that will take it's place – but that version is not adapted to HTML5 boilerplate.) 

* Added an empty directory, `sass`, that can be used to hold sass or scss stylesheets to @import into `master.sass`. 

* Copied `page.haml` from the Nesta gem. (It needs to be here in order to make Nesta notice that there is a `layout.haml` here.)

* Copied `header.haml` from the Nesta gem and removed the \<hgroup> tag from it, since it has been [removed from the HTML5 standard](http://www.webmonkey.com/2013/04/w3c-drops-hgroup-tag-from-html5-spec/).



[^3]: This could just as well be a .scss-file.



### html5boilerplate/views/layout.haml

* Added (more or less copying code from Nestas layout.haml)
	* title
	* description
	* keywords
	
* Changed the addresses for the stylesheets, so that they points to the stylesheets that are now located in the public folder.
	* `%link{:href => "/html5boilerplate/static-css/normalize.css", :rel => "stylesheet"}` (Note the leading slash)
	* `%link{:href => "/html5boilerplate/static-css/main.css", :rel => "stylesheet"}`
	
* Added
	* `/ Author's custom styles goes here`   
        `%link{:href => "/css/master.css", :rel => "stylesheet"}`
        
	* `- local_stylesheet_link_tag('local')` (I'm not sure what it does. As far as I can tell, it adds a local.scss or .sass stylesheet, but only if there exists one. But what it is that is so “local” about it beats me.)
	* `%link(href="#{url('/articles.xml')}" rel="alternate" type="application/atom+xml")`
      
*  Removed the ’Hello world’-paragraph and added
	* `= haml :header, :layout => false`
	* ` = yield`
	* `= haml :footer, :layout => false`   (I'm not sure there is any real advantage having header and footer separate, but this is the way Nesta’s base theme does it.)
	
* Changed the Google Analytics code	
	* Enclosed the code in `- if @google_analytics_code`
	* Added `#{@google_analytics_code}`, to insert the key.
	
* Cleaned up some indention errors from [htmltohaml](http://htmltohaml.com/) (?). Tip: make sure nothing is indented under the `meta` tags.

* Note: The [HTML5 validator](http://validator.w3.org/) does not like 
	
	* `<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">`, giving the error “Bad value X-UA-Compatible for attribute http-equiv on element meta.” But since it’s a part of the boilerplate, I'm keeping it. ([An explanation on what it is, and how it can be removed by adding some server side code](http://www.validatethis.co.uk/news/fix-bad-value-x-ua-compatible-once-and-for-all/)) 
	
	* `pubdate` in `<time datetime='2013-04-09T11:31:00+01:00' pubdate>` (that comes from `footer.haml` in the Nesta gem). [The status of pubdate seams a bit unclear](http://www.brucelawson.co.uk/2012/best-of-time/), so for the time being I'm keeping it. 


### html5boilderplate/app.rp

* Changed the comment `# Put your assets in themes/html5boilerplate/public/html5boilerplate.` to `# Put your assets in themes/[themename]/public/[themename]/`.

* Uncommented the line `use Rack::Static, :urls => ["/html5boilerplate"], :root => "themes/html5boilerplate/public"`

* Configured sass to include source line numbers in the generated css.

* Added some logging functionality.


## Todo

Things I have not done in this versions, but would be good to include.

* Add roles (partly done)








