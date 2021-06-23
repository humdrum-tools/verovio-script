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

<h1> Humdrum Nontation Plugin example </h1>

This page demonstrates using the <a target="_blank" href="https://plugin.humdrum.org">
Humdrum Notation Plugin</a>, which is an interface to verovio.

<script src="https://plugin.humdrum.org/scripts/humdrum-notation-plugin-worker.js"></script>

<h2> Twinkle, Twinkle, Little Star </h2>

<script>
displayHumdrum({
	source: "humdrum-twinkle",
	scale: 40
});
</script>

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

<h2> Mary Had a Little Lamb</h2>

<script>
displayHumdrum({
	source: "humdrum-mary",
	scale: 60
});
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

<h1> Example code </h1>

Here is example HTML content to display the above notation.  Try copying the
text in the black region below into a file ending in `.htm` or `.html` and
open it in your web brower (probably by double clicking on the file).

```html
<html>
<head>
<title>Humdrum Notation Plugin usage</title>
<script src="https://plugin.humdrum.org/scripts/humdrum-notation-plugin-worker.js"></script>
</head>
<body>

<h2> Twinkle, Twinkle, Little Star </h2>

<script>
displayHumdrum({
	source: "humdrum-twinkle",
	scale: 40
});
</script>

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

<h2> Mary Had a Little Lamb</h2>

<script>
displayHumdrum({
	source: "humdrum-mary",
	scale: 60
});
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

</body>
</html>


```



