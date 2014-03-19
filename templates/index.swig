{% extends "_base.swig" %}

{% block slides %}
<section class="first-slide">
  <h1>svg<b>:</b> <c>a primer</c></h1>
  <h3>tyler ball <b>&mdash;</b> <c>shopify</c></h3>
</section>

<section>
  <h2>
    S<c>calable</c> V<c>ector</c> G<c>raphics</c>
  </h2>
</section>

<section>
  <h2>What is it?</h2>
  <ul>
    <li>Vector image format based on XML (like HTML). Everything is tags.</li>
    <li>Work began in 1998 after Microsoft, Sun and Adobe proposed vector graphics standards</li>
  </ul>
  <aside class="notes">
    Oh hey, these are some notes. They'll be hidden in your presentation, but you can see them if you open the speaker notes window (hit 's' on your keyboard).
  </aside>
</section>

<section>
  <h2>Why should I use it?</h2>
</section>

<section>
  {% include "_svg/anchorman.swig" with {animation: false} %}

  <p>Vector graphics that don't care about your screen resolution.</p>
</section>

<section class="slide-icons">
  {% include "_svg/icons.swig" %}

  <p>Truly responsive icons.</p>

  <p class="source"><a href="http://coding.smashingmagazine.com/2014/03/05/rethinking-responsive-svg/">source</a></p>
</section>

<section>
  {% include "_svg/airplane.swig" %}

  <p>Animations, either with CSS, JS or SVG's own internal animation specification.</p>
</section>

<section>
  <h2>How do I use it?</h2>
</section>

<section class="compatibility">
  <h3>Compatibility</h3>

  <table>
    <tr>
      <th>IE</th>
      <th>Firefox</th>
      <th>Chrome</th>
      <th>Safari</th>
      <th>Opera</th>
      <th>iOS Safari</th>
      <th>Android</th>
      <th>IE Mobile</th>
    </tr>
    <tr>
      <td>9+</td>
      <td>26+</td>
      <td>31+</td>
      <td>7+</td>
      <td>19+</td>
      <td>3.2+</td>
      <td>3+</td>
      <td>10+</td>
    </tr>
  </table>

  <p class="source">source: <a href="http://caniuse.com/#feat=svg">can i use</a></p>
</section>

<section>
  <h3>The Basics</h3>

  <p>Here's a circle:</p>

  <svg width="120" height="200">
    <circle fill="red" r="50" cx="60" cy="100" stroke="black" stroke-width="3">
  </svg>

  <pre><code>&lt;svg width=&quot;100&quot; height=&quot;200&quot;&gt;
    &lt;circle fill=&quot;red&quot; r=&quot;50&quot; cx=&quot;50&quot; cy=&quot;100&quot; stroke=&quot;black&quot; stroke-width=&quot;3&quot;&gt;
  &lt;/svg&gt;</code></pre>
</section>

<section>
  <p>More shapes:</p>

  <svg width="500" height="200">
    <circle fill="red" r="50" cx="50" cy="100" />
    <rect fill="blue" x="125" y="50" width="100" height="100" />
    <rect fill="green" x="250" y="50" width="100" height="100" rx="15" ry="15" />
    <polygon fill="purple" points="375,150 425,50 475,150"/>
  </svg>

  <pre><code>&lt;svg width=&quot;500&quot; height=&quot;200&quot;&gt;
    &lt;circle fill=&quot;red&quot; r=&quot;50&quot; cx=&quot;50&quot; cy=&quot;100&quot; /&gt;
    &lt;rect fill=&quot;blue&quot; x=&quot;125&quot; y=&quot;50&quot; width=&quot;100&quot; height=&quot;100&quot; /&gt;
    &lt;rect fill=&quot;green&quot; x=&quot;250&quot; y=&quot;50&quot; width=&quot;100&quot; height=&quot;100&quot; rx=&quot;15&quot; ry=&quot;15&quot; /&gt;
    &lt;polygon fill=&quot;purple&quot; points=&quot;375,150 425,50 475,150&quot;/&gt;
  &lt;/svg&gt;</code></pre>
</section>

<section>
  <p>Here's a path:</p>

  <svg width="400" height="400">
    <path d="M 100 100 L 300 100 L 200 300 z"
        fill="orange" stroke="black" stroke-width="3" />
  </svg>

  <pre><code>&lt;svg width=&quot;400&quot; height=&quot;400&quot;&gt;
    &lt;path d=&quot;M 100 100 L 300 100 L 200 300 z&quot;
        fill=&quot;orange&quot; stroke=&quot;black&quot; stroke-width=&quot;3&quot; /&gt;
  &lt;/svg&gt;</code></pre>
</section>

<section>
  <h2>Time for <c>real shit</c>.</h2>
</section>

<section>
  <h3>Do everything in Illustrator</h3>
  <p>(use vector Smart Objects in Photoshop)</p>
  <img src="img/illustrator.png">
</section>

<section>
  <h3>Export right to SVG</h3>

  <img src="img/save.png">
</section>

<section>
  <div class="half">
    <p><strong>Profile:</strong> <code>SVG 1.1</code>, or <code>SVG Tiny 1.1</code> if you don't have complex graphics like gradients, animations or embedded images.</p>

    <p><strong>Fonts:</strong> <code>Convert to outline</code> will convert any text to vector outlines.</p>
  </div>

  <div class="half">
    <img src="img/save_settings.png">
  </div>
</section>

<section class="svg-code" data-transition="fade">
  {% include "_svg/code.swig" with {highlights: false} %}
</section>

<section class="svg-code" data-transition="none">
  {% include "_svg/code.swig" with {highlights: true} %}

  <aside class="notes">
    <ul>
      <li>svg id is name of layer from illustrator</li>
    </ul>
  </aside>
</section>

<section>
  <h3>Getting it into your markup:</h3>
  <ul>
    <li><code>&lt;embed&gt;</code></li>
    <li><code>background</code></li> <li>Inline <code>&lt;svg&gt;</code></li>
  </ul>
</section>

<section>
  <h3> <code>&lt;embed&gt;</code></h3>

  <p>A good way not to clutter your page with svg, but:</p>

  <ul>
    <li>An additional HTTP request per graphic</li>
    <li>Not able to style SVG components with CSS</li>
  </ul>
</section>

<section>
  <h3><code>background</code></h3>

  <p>CSS <code>background</code> rules can take SVG markup in a <code>data-uri</code> string:</p>

  <div>
    <pre><code class="css">{% autoescape true %}{% include "_svg/data-uri.swig" %}{% endautoescape %}</code></pre>
</div>

<p class="fragment data-uri-background">me has background</p>

<style>
  .data-uri-background { {% include "_svg/data-uri.swig" %} }
</style>
</section>

<section>
  <h3><code>background</code></h3>

  <p>Pros:</p>
  <ul>
    <li>Really easy to reuse across an application.</li>
    <li>Great for icons.</li>
  </ul>

  <div class="fragment">
  <p>Cons:</p>
  <ul>
    <li>Can increase the size of your CSS</li>
    <li>Not able to style SVG components with CSS</li>
  </ul>
</div>
</section>

<section>
  <h3>Inline <code>&lt;svg&gt;</code></h3>
  <p>The elements live on the page with the rest of your page so you can:</p>

  <ul>
    <li>Style them with CSS</li>
    <li>Manipulate them with Javascript</li>
  </ul>

  <aside class="notes">better for illustrations, animations</aside>
</section>

<section>
  <h2>Styling with CSS</h2>
</section>

<section>
  <svg width="500" height="200">
    <circle fill="red" r="50" cx="50" cy="100" />
    <rect fill="blue" x="125" y="50" width="100" height="100" />
    <rect fill="green" x="250" y="50" width="100" height="100" rx="15" ry="15" />
    <polygon fill="purple" points="375,150 425,50 475,150"/>
  </svg>
</section>

<section>
  <svg class="css-1" width="500" height="200">
    <circle fill="red" r="50" cx="50" cy="100" />
    <rect fill="blue" x="125" y="50" width="100" height="100" />
    <rect fill="green" x="250" y="50" width="100" height="100" rx="15" ry="15" />
    <polygon fill="purple" points="375,150 425,50 475,150"/>
  </svg>

  <pre><code>&lt;svg width=&quot;500&quot; height=&quot;200&quot;&gt;
  &lt;circle fill=&quot;red&quot; r=&quot;50&quot; cx=&quot;50&quot; cy=&quot;100&quot; /&gt;
  &lt;rect fill=&quot;blue&quot; x=&quot;125&quot; y=&quot;50&quot; width=&quot;100&quot; height=&quot;100&quot; /&gt;
  &lt;rect fill=&quot;green&quot; x=&quot;250&quot; y=&quot;50&quot; width=&quot;100&quot; height=&quot;100&quot; rx=&quot;15&quot; ry=&quot;15&quot; /&gt;
  &lt;polygon fill=&quot;purple&quot; points=&quot;375,150 425,50 475,150&quot;/&gt;
&lt;/svg&gt;</code></pre>

  <style>
    .css-1 rect:hover {
      fill: black;
    }
  </style>

  <pre><code>.css-1 rect:hover {
  fill: black;
}</code></pre>
</section>

<section>
  <h3>Gradients</h3>

  <svg class="css-2" width="300" height="200">
    <circle fill="red" r="50" cx="50" cy="100" />
    <polygon points="175,150 225,50 275,150"/>

    <defs>
      <linearGradient id="Gradient">
        <stop offset="5%" stop-color="#F60" />
        <stop offset="95%" stop-color="#FF6" />
      </linearGradient>
    </defs>
  </svg>

  <pre><code>&lt;svg class=&quot;css-2&quot; width=&quot;200&quot; height=&quot;200&quot;&gt;
  &lt;circle fill=&quot;red&quot; r=&quot;50&quot; cx=&quot;50&quot; cy=&quot;100&quot; /&gt;
  &lt;polygon points=&quot;375,150 425,50 475,150&quot;/&gt;

  &lt;defs&gt;
    &lt;linearGradient id=&quot;Gradient&quot;&gt;
      &lt;stop offset=&quot;5%&quot; stop-color=&quot;#F60&quot; /&gt;
      &lt;stop offset=&quot;95%&quot; stop-color=&quot;#FF6&quot; /&gt;
    &lt;/linearGradient&gt;
  &lt;/defs&gt;
&lt;/svg&gt;</code></pre>

  <style>
    .css-2 circle, .css-2 polygon {
      fill: url(#Gradient);
    }
  </style>

  <pre><code>.css-2 rect, .css-2 polygon {
  fill: url(#Gradient);
}</code></pre>
</section>

<section>
  <p>Some more advanced and practical CSS examples:</p>

  <ul>
    <li><a href="http://webdesign.tutsplus.com/articles/manipulating-svg-icons-with-simple-css--webdesign-15694">Manipulating SVG Icons With Simple CSS</a></li>
    <li><a href="https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Getting_started/SVG_and_CSS">MDN: SVG and CSS</a></li>
  </ul>
</section>

<section>
  <h2>Animations</h2>
</section>

<section data-state="in-view">
  <h3>With CSS</h3>

  {% include "_svg/venn.swig" %}
</section>

<section>
  <pre><code>circle {
  fill: none;
  stroke: $color_blue;
  stroke-width: 2px;
  opacity: 0;
  transition: opacity 2s, transform 2.5s ease-in-out;

  /* each circle has its own translate position off-screen */
  transform: translate(-300px, -400px);
}

.in-view circle {
  transform: translate(0px, 0px);
}</code></pre>
</section>

<section data-state="js-in-view" class="js">
  <h3>Animating with Javascript</h3>

  <div class="anchorman">
    {% include "_svg/anchorman.swig" with {animation: true} %}
  </div>
</section>

<script>
  document.onreadystatechange = function () {
    var d = document;

    if (d.readyState == 'complete') {
      var paths = d.querySelectorAll('.anchorman path');

      for (var i = 0; i < paths.length; i++) {
        var path = paths[i];
        var length = path.getTotalLength().toString()

        path.setAttributeNS(null, 'stroke-dasharray', length + ' ' + length);
        path.setAttributeNS(null, 'stroke-dashoffset', length);

        var anchor = document.getElementById('anchor' + (i + 1))
        anchor.setAttributeNS(null, 'from', length);
        anchor.setAttributeNS(null, 'values', length + ';0');
      }
    }
  }
</script>

<section>

  <pre><code class="javascript">var paths = d.querySelectorAll('.anchorman path');

for (var i = 0; i &lt; paths.length; i++) {
  var path = paths[i];
  var length = path.getTotalLength().toString()

  path.setAttributeNS(null, 'stroke-dasharray', length + ' ' + length);
  path.setAttributeNS(null, 'stroke-dashoffset', length);

  var anchor = document.getElementById('anchor' + (i + 1))
  anchor.setAttributeNS(null, 'from', length);
  anchor.setAttributeNS(null, 'values', length + ';0');
}

var animate = function() {
  document.getElementById('anchor1').beginElement()
  document.getElementById('anchor2').beginElement()
};</code></pre>
</section>

<section>
  <h3>Getting more advanced</h3>

  <p>If you're working with data, check out <a href="http://d3js.org/">D3.js</a>, a javascript library for working with data that uses SVG for graphs, maps, diagrams.</p>
</section>

<section>
  <h3>Thanks</h3>

  <p><a href="http://tylerball.github.io/svg-primer">http://tylerball.github.io/svg-primer</a></p>

  <p><a href="http://github.com/tylerball/svg-primer">http://github.com/tylerball/svg-primer</a></p>
</section>
{% endblock %}
