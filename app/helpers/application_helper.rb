module ApplicationHelper
	
require 'barby'
require 'barby/outputter/png_outputter'

# generate a PNG barcode image from the given data,
# using a default symbology of Code128 type B
# return a URI relative to the document root

def barcode_image_uri(data,symbology = 'Code39')

    # check to see if we don't already have this barcode image
    uri = 'public/barcode_images/' + CGI.escape(symbology) + '_' + CGI.escape(data) + '.png'
    fname =  Rails.root.join(uri)

    # if the barcode image doesn't already exist then generate and save it
    if ! File.exists?(fname)

      str = 'Barby::'+symbology+'.new("'+data+'")'

      begin
        barcode = eval str
      rescue Exception => exc
        barcode = Barby::Code39.new(data)   # fall back to Code128 type B
      end

      File.open(fname, 'w') do |f|
        f.write barcode.to_png
      end

    end

    uri
end 
end
