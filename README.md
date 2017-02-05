# SEARCH TOOLS

This module add two class methods
<br>
<pre>
    searchable_fields :arg1, :arg2, ...
</pre>
<br>
this method need to add to the models where you want to search
<br>
<br>
<pre>
    MyClass#search('string')
</pre>
this method should be called on the model with an argument (line in which the search will be carried out)
<br>
<br>
<h3>For install</h3>
<br>
* Copy
<pre>
    /service/search.rb
</pre>
to the /lib
<br>
<br>
* Append
<pre>
    Dir[Rails.root + 'lib/**/**/*.rb'].each{ |file| require file }<br>
    ActiveRecord::Base.include(Service::Search)
</pre>

to the /config/application.rb
<br>
* Add <b>searchable_fields</b> method to class, for example:
<pre>
class Article < ApplicationRecord
  searchable_fields :title, :body
end
</pre>
<br>
* And now you can call:
<pre>
Article.search('deech')
</pre>
