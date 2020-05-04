## Example

Display an unlit centered sphere. Color is a linear function of distance from sphere to the eye.

    $ ruby example/03_sphere.rb > images/03_sphere.ppm

<img alt="Image of a sphere" src="/images/03_sphere.png?raw=true" width="256" height="256" />

Note: on macOS you can use Preview to open ppm files. In other OSes you can use most image editing programs like GIMP. You can also use [ImageMagick](https://imagemagick.org) to convert ppm files to png:

    $ convert images/03_sphere.ppm images/03_sphere.png

## References

- <https://pragprog.com/book/jbtracer/the-ray-tracer-challenge>
