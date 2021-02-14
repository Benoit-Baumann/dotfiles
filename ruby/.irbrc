$LOAD_PATH << '~/.asdf/installs/ruby/2.7.1/lib/ruby/gems/2.7.0/gems/awesome_print-1.8.0/lib/'
# eval "$(gem which awesome_print)"

require "awesome_print"
AwesomePrint.irb!

# taken from http://pragmaticstudio.com/blog/2013/2/13/view-source-ruby-methods
# Open in VSCode the source file that defines the method for the object passed in parameters and return its location
def source_for(object, method_name)
  if object.respond_to?(method_name, true)
    method = object.method(method_name)
  elsif object.is_a?(Module)
    method = object.instance_method(method_name)
  end
  location = method.source_location
  `code --goto #{location[0]}:#{location[1]}` if location
  location
rescue
  nil
end
