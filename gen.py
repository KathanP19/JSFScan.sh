f = open('jfscan.html','w')

with open("endpoints.txt", encoding="utf-8") as file:
    endpoints = [l.rstrip("") for l in file]

with open("domxss_scan.txt", encoding="utf-8") as file:
    dom = [l.rstrip("") for l in file]

with open("js_var.txt", encoding="utf-8") as file:
    js_var = [l.rstrip("") for l in file]

with open("jsfile_links.txt", encoding="utf-8") as file:
    jsfile_links = [l.rstrip("") for l in file]

with open("jslinksecret.txt", encoding="utf-8") as file:
    jslinksecret = [l.rstrip("") for l in file]

with open("live_jsfile_links.txt", encoding="utf-8") as file:
    live_jsfile_links = [l.rstrip("") for l in file]

message = """<html>
<head>
<title>JSFScan Report</title>
<style>

.tab {{
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
}}

.tab button {{
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
}}

.tab button:hover {{
  background-color: #ddd;
}}

.tab button.active {{
  background-color: #ccc;
}}

.tabcontent {{
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
}}
</style>
</head>

<body>

<div class="tab">
    <button class="endpoints" onclick="openFile(event, 'endpoints')">endpoints.txt</button>
    <button class="dom" onclick="openFile(event, 'dom')">domxss_scan.txt</button>
    <button class="js_var" onclick="openFile(event, 'js_var')">js_var.txt</button>
    <button class="jsfile_links" onclick="openFile(event, 'jsfile_links')">jsfile_links.txt</button>
    <button class="jslinksecret" onclick="openFile(event, 'jslinksecret')">jslinksecret.txt</button>
    <button class="live_jsfile_links" onclick="openFile(event, 'live_jsfile_links')">live_jsfile_links.txt</button>
</div>


<div id="endpoints" class="tabcontent">
    <h3 style="margin-left:auto; margin-right:auto;">endpoints.txt</h3>
    <div style="border-radius: 5px; margin-left:auto; margin-right:auto; margin-bottom: 20px; width:960px; height: 500px; overflow-y: scroll; background-color: #F1F1F1;">
    <p style="float:left;color: #666666; padding: 10px; width:700px; font-family: Arial,Trebuchet MS,sans-serif; font-size: 12px; font-weight: normal; border-right: thin dotted #666666; line-height: 18px;">
    {endpoints}
    </p>
    </div>
</div>

<div id="dom" class="tabcontent">
    <h3 style="margin-left:auto; margin-right:auto;">domxss_scan.txt</h3>
    <div style="border-radius: 5px; margin-left:auto; margin-right:auto; margin-bottom: 20px; width:960px; height: 500px; overflow-y: scroll; background-color: #F1F1F1;">
    <p style="float:left;color: #666666; padding: 10px; width:700px; font-family: Arial,Trebuchet MS,sans-serif; font-size: 12px; font-weight: normal; border-right: thin dotted #666666; line-height: 18px;">
    {dom}
    </p>
    </div>
</div>

<div id="js_var" class="tabcontent">
    <h3 style="margin-left:auto; margin-right:auto;">js_var.txt</h3>
    <div style="border-radius: 5px; margin-left:auto; margin-right:auto; margin-bottom: 20px; width:960px; height: 500px; overflow-y: scroll; background-color: #F1F1F1;">
    <p style="float:left;color: #666666; padding: 10px; width:700px; font-family: Arial,Trebuchet MS,sans-serif; font-size: 12px; font-weight: normal; border-right: thin dotted #666666; line-height: 18px;">
    {js_var}
    </p>
    </div>
</div>

<div id="jsfile_links" class="tabcontent">
    <h3 style="margin-left:auto; margin-right:auto;">jsfile_links.txt</h3>
    <div style="border-radius: 5px; margin-left:auto; margin-right:auto; margin-bottom: 20px; width:960px; height: 500px; overflow-y: scroll; background-color: #F1F1F1;">
    <p style="float:left;color: #666666; padding: 10px; width:700px; font-family: Arial,Trebuchet MS,sans-serif; font-size: 12px; font-weight: normal; border-right: thin dotted #666666; line-height: 18px;">
    {jsfile_links}
    </p>
    </div>
</div>

<div id="jslinksecret" class="tabcontent">
    <h3 style="margin-left:auto; margin-right:auto;">jslinksecret.txt</h3>
    <div style="border-radius: 5px; margin-left:auto; margin-right:auto; margin-bottom: 20px; width:960px; height: 500px; overflow-y: scroll; background-color: #F1F1F1;">
    <p style="float:left;color: #666666; padding: 10px; width:700px; font-family: Arial,Trebuchet MS,sans-serif; font-size: 12px; font-weight: normal; border-right: thin dotted #666666; line-height: 18px;">
    {jslinksecret}
    </p>
    </div>
</div>

<div id="live_jsfile_links" class="tabcontent">
    <h3 style="margin-left:auto; margin-right:auto;">live_jsfile_links.txt</h3>
    <div style="border-radius: 5px; margin-left:auto; margin-right:auto; margin-bottom: 20px; width:960px; height: 500px; overflow-y: scroll; background-color: #F1F1F1;">
    <p style="float:left;color: #666666; padding: 10px; width:700px; font-family: Arial,Trebuchet MS,sans-serif; font-size: 12px; font-weight: normal; border-right: thin dotted #666666; line-height: 18px;">
    {live_jsfile_links}
    </p>
    </div>
</div>

<script>
function openFile(evt, fileName) {{
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {{
    tabcontent[i].style.display = "none";
  }}
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {{
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }}
  document.getElementById(fileName).style.display = "block";
  evt.currentTarget.className += " active";
}}
</script>

</body>
</html>""".format(endpoints='<br />'.join(endpoints), dom='<br />'.join(dom), js_var='<br />'.join(endpoints), jsfile_links='<br />'.join(jsfile_links), jslinksecret='<br />'.join(jslinksecret), live_jsfile_links='<br />'.join(live_jsfile_links))

f.write(message)
f.close()