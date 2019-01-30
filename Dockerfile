FROM nginx:stable-alpine

RUN apk --no-cache add ca-certificates wget tar git
# && wget -O freeboard.tar.gz https://api.github.com/repos/Freeboard/freeboard/tarball/master \
# && tar -xzvf freeboard.tar.gz -C /usr/share/nginx/html --strip-components=1

RUN git clone https://github.com/CiscoDevNet/iot-freeboard-plugin && \
 cp -r iot-freeboard-plugin/* /usr/share/nginx/html/

#RUN git clone https://github.com/alsm/freeboard-mqtt && \
# mkdir /usr/share/nginx/html/plugins/mqtt && \
# cp -r freeboard-mqtt/* /usr/share/nginx/html/plugins/mqtt/

RUN mkdir /usr/share/nginx/html/plugins/mqtt

COPY index.html /usr/share/nginx/html/index.html

COPY clear.object.mqtt.plugin.js /usr/share/nginx/html/plugins/mqtt/clearobject.mqtt.plugin.js

COPY mqttws31.js /usr/share/nginx/html/plugins/mqtt/mqttws31.js

COPY paho.mqtt.plugin.js /usr/share/nginx/html/plugins/mqtt/paho.mqtt.plugin.js
