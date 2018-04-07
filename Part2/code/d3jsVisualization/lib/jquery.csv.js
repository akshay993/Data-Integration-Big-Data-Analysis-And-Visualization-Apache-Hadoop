<html>
  <head>
    <meta charset="UTF-8">
    <title>Word Cloud</title>
    <script src="jquery-3.3.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="../lib/d3/d3.js" charset="utf-8"></script>
    <script src="../lib/d3/d3.layout.cloud.js"></script>
    <script src="../d3.wordcloud.js"></script>
    <script src="word1.json"></script>
    <script src="example.words.js"></script>
  </head>
  <body style="text-align: center" >
    <h1>Word Cloud</h1>
    <div id='wordcloud'></div>
    <p>This is a word cloud of the first two chapters of Oliver Twist. Some words are clickable.</p>
    <p><a href="https://github.com/wvengen/d3-wordcloud">https://github.com/wvengen/d3-wordcloud</a></p>
    <script>
      d3.wordcloud()
        .size([500, 300])
        .fill(d3.scale.ordinal().range(["#884400", "#448800", "#888800", "#444400"]))
        .mydata(words)
        .onwordclick(function(d, i) {
          if (d.href) { window.location = d.href; }
        })
        .start();
    </script>
  </body>
</html>

