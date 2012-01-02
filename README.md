#WordPress Text Export

This is a simple Ruby script I use to convert a WordPress export file to
plaintext that I can then load into a tag cloud generator.

#Instructions

 - Export posts from your WordPress blog.
   - Go to the administrative interface
   - Go to Tools -> Export
   - Optionally, select a date range and other constraints
   - Click "Download Export File"
 - Your browser should then download an XML file with a name like "blogname.wordpress.2012-01-01.xml"
 - Feed that file into this Ruby script:
   - ./wordpress_text_export.rb blogname.wordpress.2012-01-01.xml blog.txt
