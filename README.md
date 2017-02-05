# SEARCH TOOLS

Add this method to the models where you want to search 
<br>
<pre>
    searchable_fields :arg1, :arg2, ...
</pre>
<br>
Now available such methods like:
<br>
<br>
Search by all fields:
<pre>
    MyClass#search('string')
</pre>
This method should be called on the model with an argument (line in which the search will be carried out)
<br>
<br>
Also available methods to search in selected fields:
<pre>
    MyClass#search_by_title('string')
    MyClass#search_by_body('string')
</pre>
<b>#search_by_title</b> and <b>#search_by_body</b> available because we pass :title and :body params to method <b>#searchable_fields</b>
<br>
<h4>!!! All not existing attributes will be filtered !!!</h4>
<br>
<h3>For install</h3>
<br>
* Copy
<pre>
    lib/service/search.rb
</pre>
<br>
<br>
* Copy
<pre>
    config/initializers/require_search.rb
</pre>
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
Article.search_by_title('deech')
Article.search_by_body('deech')
</pre>
