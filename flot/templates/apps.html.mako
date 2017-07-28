## encoding=utf-8
## Copyright © 2016 Intel Corporation
##
## Permission is hereby granted, free of charge, to any person obtaining a copy
## of this software and associated documentation files (the "Software"), to deal
## in the Software without restriction, including without limitation the rights
## to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
## copies of the Software, and to permit persons to whom the Software is
## furnished to do so, subject to the following conditions:
##
## The above copyright notice and this permission notice shall be included in
## all copies or substantial portions of the Software.
##
## THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
## IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
## FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
## AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
## LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
## OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
## SOFTWARE.

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Mesa Performance: Continuous Integration</title>
  <link rel=stylesheet type=text/css href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
	<link href="${url_for('static', filename='examples.css')}" rel="stylesheet" type="text/css">
	<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="../../excanvas.min.js"></script><![endif]-->
	<script language="javascript" type="text/javascript" src="https://code.jquery.com/jquery.js"></script>
  <script language="javascript" type="text/javascript" src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script language="javascript" type="text/javascript" src="${url_for('static', filename='scripts/jquery.flot.js')}"></script>
	<script language="javascript" type="text/javascript" src="${url_for('static', filename='scripts/jquery.flot.time.js')}"></script>
	<script language="javascript" type="text/javascript" src="${url_for('static', filename='scripts/jquery.flot.resize.js')}"></script>
	<script language="javascript" type="text/javascript" src="${url_for('static', filename='scripts/jquery.flot.errorbars.js')}"></script>
	<script language="javascript" type="text/javascript" src="${url_for('static', filename='scripts/jquery.flot.navigate.js')}"></script>
	<script language="javascript" type="text/javascript" src="${url_for('static', filename='scripts/plotter.js')}"></script>
  <script>
    // Run plot
    $(function() {
        var data = {};
        $.ajax({
            dataType: 'text',
            url: "${url_for('static', filename='scores.json')}",
            data: data,
            success: function( data ) {
                // debugger;
                var d = JSON.parse(data);
% for benchmark in benchmarks:
                do_plot("${benchmark}", "#${benchmark}", "#click_${benchmark}", d);
% endfor
            }
        });

      // Add the Flot version string to the footer
      $("#footer").prepend("Flot " + $.plot.version + " &ndash; ");
    });
  </script>
  </head>
  <body>

    <div id="header">
% if not category:
    <h2>Mesa Performance</h2>
% else:
    <h2>Mesa Performance: ${category}</h2>
% endif
    </div>

    <div id="content">

% for benchmark in benchmarks:
	  <h2>${benchmark}</h2>
	  <div class="demo-container">
	    <div id="${benchmark}" class="demo-placeholder"></div>
	  </div>
    <div id="click_${benchmark}"></div>
% endfor

  <div id="dialog" title="Build Started"></div>

	<div id="footer">
	  Copyright &copy; 2007 - 2014 IOLA and Ole Laursen
	</div>

</body>
</html>
