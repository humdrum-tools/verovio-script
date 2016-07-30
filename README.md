Verovio-script repository
========================

This repository hosts the verovio JavaScript toolkit script for use
on http://verovio.humdrum.org.

To use in a webpage, include with the following HTML code:

```html
<script src="http://verovio-script.humdrum.org/scripts/verovio-toolkit.js"></script>
```

Or copy the `verovio-toolkit.js` file to your webpage and include something like:

```html
<script src="/scripts/verovio-toolkit.js"></script>
```

The [Verovio Humdrum Viewer](http://verovio.humdrum.org) website provides an example usage of the verovio toolkit.

The main use of the toolkit is to render Humdrum data as an SVG image.  This can be done in JavaScript with the code:

```javascript
var data = "**kern\n*clefG2\n*M4/4\n1c;\n==\n*-\n";
var svgContent = vrvToolkit.(data, options);
```
You would then place the svg element on the page as you like.

Sample verovio toolkit options:

```javascript
var options = {
      inputFormat  : "humdrum",
      adjustPageHeight: 1,
      pageHeight: 6000,
      border: 20,
      pageWidth: 2500,
      scale: 40,
      font: "Leipzig"
}
```

The image height and width can be calculated dynamically as the page layout changes, such as (using jQuery):

```javascript
options.pageHeight = ($(window).innerHeight() - $('#navber').outerHeight()) / 0.40 - 100;
options.pageWidth = $(window).innerWidth() / 0.40 - 100;
```

