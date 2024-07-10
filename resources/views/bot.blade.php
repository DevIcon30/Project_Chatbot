<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <p>bidy</p>
    <script>
        var LHC_API = LHC_API||{};
        LHC_API.args = {mode:'widget',lhc_base_url:'//localhost:8000/index.php/',wheight:450,wwidth:350,pheight:520,pwidth:500,leaveamessage:true,check_messages:false};
        (function() {
        var po = document.createElement('script'); po.type = 'text/javascript'; po.setAttribute('crossorigin','anonymous'); po.async = true;
        var date = new Date();po.src = '//localhost:8000/design/defaulttheme/js/widgetv2/index.js?'+(""+date.getFullYear() + date.getMonth() + date.getDate());
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
        })();
    </script>
</body>
</html>