---
layout: post
tags: [dev, ruby, en]
title: "(un)extend ruby classes"
author: Yves
email: yves.brissaud@gmail.com
twitter: _crev_
published: false
image: 2016/02/09/ruby.png
---

One thing I'm really happy with ruby is the power to extend all classes.
Even default classes (like `String`). The ability to do this is a real
difference to many other languages.

But before to dive in the subject, why would you extend default (or not)
classes?

I always find in ruby a kind of elegance. You can read parts of code as
it is a book and you can write as you think. And the power to extend
classes is what allows you to extend the language, to write a specific
and more elegant language according to _your_ needs. For me it's one of the key
feature of [RoR](http://rubyonrails.org/) by example.

Let's take a single example. I have a block in which I get an array
of strings. And I want to get an array containing only the first line
of each item. I place myself in the situation I write a library,
so I want to offer the user the more easy way to use it.

This is a simple version of it:

```ruby
class MyClass
  def self.todo(&block)
    instance = self.new
    instance.instance_eval(&block)
  end

  def get_array
    ["first String\nMultiline", "2nd\nString"]
  end
end
```

And a user can write:

```ruby
MyClass.todo {
  arr = get_array
  first_lines_arr = arr.map do |el|
    if el.is_a? String
      el.split("\n").first
    else
      el
    end
  end
}
```

> The [`instance_eval`][instance_eval] allows the block to be execute _inside_ the instance
> and access to the methods of `MyClass`.

This is functionnal. But honnestly, if the operation is frequent you can
help a little your users.

First, we can place the map in a method.

```ruby
class MyClass
  def self.todo(&block)
    instance = self.new
    instance.instance_eval(&block)
  end

  def get_array
    ["first String\nMultiline", "2nd\nString"]
  end

  def first_lines(array)
    array.map do |el|
    if el.is_a? String
      el.split("\n").first
    else
      el
    end
  end
end

MyClass.todo {
  arr = get_array
  first_lines_arr = first_lines arr
}
```

Better. But you can go a little further in extending the `Array` class.
The goal is to write:

```ruby
MyClass.todo {
  arr = get_array
  first_lines_arr = arr.first_lines
}
```

To do this, you must add the method `first_lines` to the class `Array`.

A simple version is to open the class definition and add the method:

```ruby
class Array
  def first_lines
    map do |el|
      if el.is_a? String
        el.split("\n").first
      else
        el
      end
    end
  end
end
```

It works!

Simply imagine the class definition is splitted into small parts, the real definition is the aggregation of all partial classes.

An other solution is to extend the class using [`class_eval`][class_eval]:

```ruby
Array.class_eval do
  def first_lines
    map do |el|
      if el.is_a? String
        el.split("\n").first
      else
        el
      end
    end
  end
end
```

It's very simimlar but you can do more differents things with it. By example you
are able to encapsulate this in a method, replace `Array` by an parameter,
use `myInstance.class` to create a real dynamic extension, etc.

But now, imagine you want to offer this possibility only in your block. You don't
want to polluate all arrays with your specific method. You want to extend `Array`
class at the begining of your block and remove method at the end.

Extended the class at the begining is not complicated, simply add the version using `class_eval` before the call to `instance_eval`.

```ruby
class MyClass
  def self.todo(&block)
    instance = self.new
    instance.extend_array
    instance.instance_eval(&block)
  end

  def get_array
    ["first String\nMultiline", "2nd\nString"]
  end

  def extend_array
    Array.class_eval do
      def first_lines
        map do |el|
          if el.is_a? String
            el.split("\n").first
          else
            el
          end
        end
      end
    end
  end
end

MyClass.todo {
  arr = get_array
  first_lines_arr = arr.first_lines
}
```

In this version, before the call to `todo`, the array class is not extended. But now you need to remove the extension after the call to `instance_eval` to complete the job.

[`remove_method`][remove_method] will make you happy!

```ruby
class MyClass
  def self.todo(&block)
    instance = self.new
    instance.extend_array
    instance.instance_eval(&block)
    instance.unextend_array
  end

  def get_array
    ["first String\nMultiline", "2nd\nString"]
  end

  def extend_array
    Array.class_eval do
      def first_lines
        map do |el|
          if el.is_a? String
            el.split("\n").first
          else
            el
          end
        end
      end
    end
  end

  def unextend_array
    Array.class_eval do
      remove_method :first_lines
    end
  end
end

MyClass.todo {
  arr = get_array
  first_lines_arr = arr.first_lines
}
```

Now, the array `arr` has a method `first_lines` in the block.
But outside the execution of this block, this method is not
defined.

You can now extend any class (even default classes like `String`, `Array`, etc)
only for a given block. Your user will be able to write elegant and readable
code in a specific scope. And outside you not polluate the default classes
with your _Domain Specific Language_ extensions.

[instance_eval]: http://docs.ruby-lang.org/en/2.3.0/BasicObject.html#method-i-instance_eval
[class_eval]: http://docs.ruby-lang.org/en/2.3.0/Module.html#method-i-class_eval
[remove_method]: http://docs.ruby-lang.org/en/2.3.0/Module.html#method-i-remove_method