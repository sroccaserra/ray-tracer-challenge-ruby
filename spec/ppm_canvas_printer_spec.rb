require_relative '../lib/ppm_canvas_printer'
require_relative '../lib/canvas'
require_relative '../lib/rtc_color'

describe 'PpmCanvasPrinter' do
  describe 'PPM Header' do
    [[5, 3], [4, 6]].each do
      |params|
      it 'should construct the PPM header' do
        w, h = params
        canvas = Canvas.new(w, h)
        printer = PpmCanvasPrinter.new(canvas)

        lines = printer.lines

        expect(lines[0..2]).to eq ['P3', "#{w} #{h}", '255']
      end
    end
  end

  describe 'PPM pixel data' do
    it 'should generate PPM lines from pixel data' do
      canvas = Canvas.new(5, 3)
      c1 = color(1.5, 0, 0)
      c2 = color(0, 0.5, 0)
      c3 = color(-0.5, 0, 1)
      canvas.write_pixel(0, 0, c1)
      canvas.write_pixel(2, 1, c2)
      canvas.write_pixel(4, 2, c3)
      printer = PpmCanvasPrinter.new(canvas)

      lines = printer.lines

      expect(lines[3..5]).to eq [
        '255 0 0 0 0 0 0 0 0 0 0 0 0 0 0',
        '0 0 0 0 0 0 0 128 0 0 0 0 0 0 0',
        '0 0 0 0 0 0 0 0 0 0 0 0 0 0 255',
      ]
    end

    it 'should split long lines' do
      canvas = Canvas.new(10, 2)
      c = color(1, 0.8, 0.6)
      10.times do
        |x|
        canvas.write_pixel(x, 0, c)
        canvas.write_pixel(x, 1, c)
      end
      printer = PpmCanvasPrinter.new(canvas)

      lines = printer.lines

      expect(lines[3..6]).to eq [
        '255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204',
        '153 255 204 153 255 204 153 255 204 153 255 204 153',
        '255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204',
        '153 255 204 153 255 204 153 255 204 153 255 204 153',
      ]
    end
  end
end
