require_relative '../lib/canvas'
require_relative '../lib/ppm_canvas_printer'

describe 'PpmCanvasPrinter' do
  [[5, 3], [4, 6]].each do
    |params|
    it 'should construct the PPM header' do
      w, h = params
      c = Canvas.new(w, h)
      printer = PpmCanvasPrinter.new(c)
      lines = printer.lines

      expect(lines[0..2]).to eq ['P3', "#{w} #{h}", '255']
    end
  end
end
