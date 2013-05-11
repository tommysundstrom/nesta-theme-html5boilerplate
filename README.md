html5boilerplate Nesta theme
=======================

html5boilerplate is a theme for Nesta, a [Ruby CMS](nesta). Adapted for Nesta by Tommy Sundström.

[Html5boilerplate](html5bp) is a collection of best practices into a ’perfect’ front-end template. 

_The theme is **not** meant to be used directly._ But it is a stable ground to build your own theme upon. 

### Some pointers for creating a theme based on html5boilerplate
* Copy it and change the name. 

* If you create a new git branch, it will be easier to find out if a problem origins from the html5boilerplate or from stuff you've done.

* The theme’s name has to be replaced in several places:
	* Theme directory
	* The directory inside the theme’s `public` directory
	* In the theme’s `app.rb`
	* In `layout.haml`, the two links that are pointing to stylesheets    
	* And, as usual, change the theme name in `config/config.yml` and make sure that this line does not start with a #. 
	
* The theme can be used as is, just adding your own stylesheet code in or @imported into `master.sass`.

* The stylesheets `/html5boilerplate/static-css/normalize.css` and `main.css` does a great job making pages look similar in different browsers. But it also adds some styling of it's own. If you prefer to work from a blanker slate, you may want to remove them and the links to them in `layout.haml`. 

* Same thing if you are adding a framework—most frameworks has a reset of their own, doing the same job as `normalize.css` and `main.css` but in a slightly different way. Having two levels of normalization/reseting just complicates the rendering and open up for bugs.

* See `views/doc/extend.md` for some pointers on how to extend HTML5 boilerplate.

* You may want to make changes to `.htaccess` (if you run under Apache) and `crossdomain.xml` (if you know what you are doing and the current policy is to strict).  

* There is one meta-tag that does not validate. To get rid of it, see [this](http://www.validatethis.co.uk/news/fix-bad-value-x-ua-compatible-once-and-for-all/).


## Bugs, problems
This is the first development version of the theme. So they will be there. 



[html5bp]: http://html5boilerplate.com/
[nesta]: http://nestacms.com
