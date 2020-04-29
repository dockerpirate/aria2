NO SUPPORT。

Aria2 with webui
---
Only 29Mb.  
Edit config file out of the image.  
Move file completed to another folder.  
(Tasks that contains more than one files will not be moved.)  

### Install
I. replace **/DOWNLOAD_DIR** and **/CONFIG_DIR** for save data, and **YOUR_SECRET_CODE** for security. Run command below  
```
sudo docker run -d \
--name aria2-with-webui \
-p 6800:6800 \
-p 6880:8080 \
-p 6888:8081 \
-v /DOWNLOAD_DIR:/data \
-v /CONFIG_DIR:/conf \
-e SECRET=YOUR_SECRET_CODE \
 dockerpirate/aria2 
```
  
II. Open `http://serverip:6800/` for aria2-webui, open `http://serverip:6888/` to browse data folder.  

### Build:  
`sudo docker build -f Dockerfile -t dockerpirate/aria2 .`  

### Link:  
https://github.com/aria2/aria2  
https://github.com/ziahamza/webui-aria2  

https://github.com/acgotaku/BaiduExporter  
