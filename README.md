# Xsidr

xml command line editor, which can select insert delete replace.

## Installation

Add this line to your application's Gemfile:

    gem 'xsidr'

## Usage

tag select.

    $ echo '<resources><string name="hello">node</string></resources>' | xsidr "//string[@name='hello']"
    <string name="hello">node</string>

text replace.

    $ echo '<resources><string name="hello">node</string></resources>' | xsidr "//string[@name='hello']" 'node.content="hello"'
    <resources><string name="hello">hello</string></resources>

attribute replace or insert.

    $ echo '<resources><string name="value">node</string></resources>' | xsidr "//string[@name='value']" 'node[:name]="value2"'
    <resources><string name="value2">node</string></resources>

attribute delete.
  
    $ echo '<resources><string name="value">node</string></resources>' | xsidr "//string[@name='value']" "node.attributes['name'].remove"
    <resources><string>node</string></resources>

node insert first. (last is also)

    $ echo '<resources><string name="value">node</string></resources>' | xsidr //resources "node >> create('string', { name: 'description' })"
    <resources><string name="value">node</string><string name="description">node</string></resources>

tag replace.

    $ echo '<resources><string name="value">node</string></resources>' | xsidr //string "node.name='extra-string'"
    <resources><extra-string name="value">node</extra-string></resources>


