---
layout: default
vim:    ft=html
---

<style>

body {
	zoom: 1.5;
}

header ul, footer p {
	display: none;
}

ul li {
	padding-bottom: 20px;
}

</style>

<h1> Basic javascript use </h1>

This page demonstrates a simple method of loading the verovio script,
then displaying two static scores.  The source code for a complete
webpage containing the same examples is given further below.

<script src="http://verovio-script.humdrum.org/scripts/verovio-toolkit-wasm.js"></script>

<h2> Twinkle, Twinkle, Little Star </h2>
<div style="padding-bottom:30px" id="notation-twinkle"></div>

<h2> Mary Had a Little Lamb</h2>
<div id="notation-mary"></div>

<script id="humdrum-twinkle" type="text/x-humdrum">
**kern
*clefG2
*M4/4
=1
4c
4c
4g
4g
=2
4a
4a
2g
=3
4f
4f
4e
4e
=4
4d
4d
2c;
==
*-
</script>

<script id="humdrum-mary" type="text/x-humdrum">
**kern
*clefG2
*M4/4
=1
4e
4d
4c
4d
=2
4e
4e
2e
=3
4d
4d
2d
=4
4e
4g
2g
=
*-
</script>

<script>

document.addEventListener("DOMContentLoaded", (event) => {
        Module.onRuntimeInitialized = async _ => {
                let tk = new verovio.toolkit();

		let humdrumTwinkle = document.querySelector("#humdrum-twinkle").textContent.replace(/^\s+/, "");
		let verovioOptions = {
			scale:           40,
			pageWidth:     1500,
			pageHeight:   60000,
			pageMarginTop:    0,
			adjustPageHeight: 1
		};
		let svgTwinkle = tk.renderData(humdrumTwinkle, verovioOptions);
		let elementTwinkle = document.querySelector("#notation-twinkle");
		elementTwinkle.innerHTML = svgTwinkle;

		let humdrumMary = document.querySelector("#humdrum-mary").textContent.replace(/^\s+/, "");
		verovioOptions = {
			scale:           60,
			pageWidth:     1000,
			pageHeight:   60000,
			pageMarginTop:    0,
			adjustPageHeight: 1
		};
		let svgMary = tk.renderData(humdrumMary, verovioOptions);
		let elementMary = document.querySelector("#notation-mary");
		elementMary.innerHTML = svgMary;

	}
});


</script>

<h1> Example code </h1>

Here is example HTML content to display the above notation.  Try copying the
text in the black region below into a file ending in `.htm` or `.html` and
open it in your web brower (probably by double clicking on the file).

```html
<html>
<head>
<title>Basic usage</title>
<script src="http://verovio-script.humdrum.org/scripts/verovio-toolkit-wasm.js"></script>
</head>
<body>

<h2> Twinkle, Twinkle, Little Star </h2>
<div style="padding-bottom:30px" id="notation-twinkle"></div>

<h2> Mary Had a Little Lamb</h2>
<div id="notation-mary"></div>

<script id="humdrum-twinkle" type="text/x-humdrum">
**kern
*clefG2
*M4/4
=1
4c
4c
4g
4g
=2
4a
4a
2g
=3
4f
4f
4e
4e
=4
4d
4d
2c;
==
*-
</script>

<script id="humdrum-mary" type="text/x-humdrum">
**kern
*clefG2
*M4/4
=1
4e
4d
4c
4d
=2
4e
4e
2e
=3
4d
4d
2d
=4
4e
4g
2g
=
*-
</script>

<script>

document.addEventListener("DOMContentLoaded", (event) => {
   Module.onRuntimeInitialized = async _ => {
      let tk = new verovio.toolkit();

      let humdrumTwinkle = document.querySelector("#humdrum-twinkle").textContent.replace(/^\s+/, "");
      let verovioOptions = {
         scale:           40,
         pageWidth:     1500,
         pageHeight:   60000,
         pageMarginTop:    0,
         adjustPageHeight: 1
      };
      let svgTwinkle = tk.renderData(humdrumTwinkle, verovioOptions);
      let elementTwinkle = document.querySelector("#notation-twinkle");
      elementTwinkle.innerHTML = svgTwinkle;

      let humdrumMary = document.querySelector("#humdrum-mary").textContent.replace(/^\s+/, "");
      verovioOptions.scale     = 60;
      verovioOptions.pageWidth = 1000;
      let svgMary = tk.renderData(humdrumMary, verovioOptions);
      let elementMary = document.querySelector("#notation-mary");
      elementMary.innerHTML = svgMary;

   }
});

</script>

</body>
</html>


```

<h1> Notes </h1>

<ul>

<li markdown="1"> After Humdrum data is extracted from the embedded script
elements, any leading whitespace must be remove in order to use the
verovio auto-detection feature to identify the input data format
as Humdrum data.  The javascript code `.replace(/^\s+/, "")` removes any
leading whitespace, which occurs in the above exmaple since
there will be a leading newline in the `textContent` of the Humdrum
script elements.  If you do not want to strip leading whitespace, explicitly
set the input format with the verovio option `inputFrom: "humdrum"`.
</li>

<li> This basic method is useful for a short example or a few short
examples.  As the score get longer, rendering time in verovio will
increase, which in turn will slow down the user interface of the
web browser.  For longer examples or interactive situations, a web
worker is more suitable, as is done in the <a
href="/worker.html">Humdrum Notation Plugin</a> interface
to verovio.  </li>

<li> The script
http://verovio-script.humdrum.org/scripts/verovio-toolkit-wasm.js
is the latest and potentially unstable version of verovio compiled
for use with Humdrum. See the <a target="_blank"
href="https://github.com/rism-digital/verovio/releases">verovio
releases</a> page for older versions of the script (Download files
with the name verovio-toolkit-hum.js.zip, where `-hum` indicates
that it can load Humdrum files.)  Alternately, you can download
http://verovio-script.humdrum.org/scripts/verovio-toolkit-wasm.js
to use in your website, manually updating it as necessary.  </li>

</ul>



