#!/usr/bin/ruby

require "rexml/document"
require "cgi"

if ARGV.length != 2
    print("Put input and output file names on the command line.\n")
    print("EXAMPLE:\n")
    print(" ./wordpress_text_export.rb infile.xml outfile.txt\n")
    exit(1);
end

input_filename = ARGV[0]
output_filename = ARGV[1]

print("Extracting #{input_filename} => #{output_filename}\n")
print("Reading input XML...\n")

document = REXML::Document.new(File.new(input_filename, "r"))
out_file = File.new(output_filename, "w");
document.get_elements("/rss/channel/item/content:encoded").each { |element|
    element.texts.each { |text|
        # We can do this regex trick and not get confused by math
        # such as "1 < x && y > 3" because the WP export escapes
        # inline symbols (greater than, less than, ampersand) as
        # HTML entities.
        value = text.value.gsub(/<\/?[^>]*>/, "")
        # Convert those entities back to plaintext
        value = CGI.unescapeHTML(value)
        out_file << value
        out_file << "\n"
    }
    out_file << "\n"
}
out_file.close()
