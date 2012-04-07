publicize
===========

The Publicize gem extends ActiveRecord to support features commonly needed
by Rails-based web services. When creating a web services API, the Publicize
gem allows developers to specify how models will be exposed and, equally
important, what fields will be exposed.

The Publicize gem provides a domain-specific language (DSL) for exposing data
in a RESTful manner via an API. An API should provide a view of resources and
data that is carefully crafted to meet the needs of the intended audience
while balancing such access with security concerns. An API is not just a
way to "make models visible" to an audience.

The Publicize DSL controls the name under which resources are made available.
For attributes, it defines what attributes will be accessibled, the names
by which those attributes will be visible in the API, and the RESTful actions
that will be able to access those resource attributes..

The DSL is intended to solve the following types of real-world problems:

1. We have a USERS table and a PROFILES table in our database. We'd like to
   provide a simplified view for our API users, so we'll just have a Customer
   resource - and a Customer will expose a combination of data elements from
   the two underlying models.

2. We have an ACCOUNTS table, but it includes a NOTES field where our customer
   representatives record notes about customer interactions. Since the
   write-ups are private company information and are not always positive
   regarding customers, we need to ensure that the NOTES field is not
   accessible through the API.

3. We have a VIDEOS table and we want to make almost all of its columns
   accessible for viewing. However, only a limited subset of columns should be
   available for updates.

4. We have an ENTRY model that provides summary information about an entry
   in an online contest. We'd like to provide the current rating for the entry
   through the API. However, the rating is calculated on-the-fly, so it
   requires a method call, i.e. - the value is not a model attribute.

If you're creating a robust API for use by an external audience, and you have
concerns like the ones above, then the Publicize DSL may be something that
can help you out.


Features
--------

* Specify the name under which a model will be exposed as a resource.

  publicize_model
  publicize_model :as => :entry

* Specify which fields will be exposed for a resource.

  publicize_field :name

* Specify alternate names for exposed fields, i.e. - the web service may
  expose friendlier names than the underlying database.

  publicize_field :country_of_origin, :as => :country

* Allows the exposure of "virtual" fields for a web service, i.e. - the
  output of a method can be publicized, not just database-derived model
  attributes.

  publicize_field :score, :as => :rating

* Specify the RESTful actions in which a field is available.

  publicize_field :score, :as => :rating, :only => [:list, :show]

* Produce JSON or XML output for resources, exposing resources and fields
  in the manner specified by the DSL.


Requirements
------------

* Rails 3.x


Install
-------

Installation is easy. Simply install the gem and then configure your Rails
application's Gemfile to reference the gem.

* gem install publicize


Author
------

Original Author: David Keener

Contributors:

* Jonathan Quigg


License
-------

(The MIT License) FIXME (different license?)

Copyright (c) 2010 - 2012 David Keener

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
