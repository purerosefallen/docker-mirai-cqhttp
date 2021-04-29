FROM openjdk:15-slim-buster

RUN apt update && \
	apt -y install gettext-base wget unzip && \
	rm -rf /var/tmp/* /tmp/* /var/lib/apt/lists/*

WORKDIR /usr/src/app
RUN wget -O mcl.zip https://github.com/iTXTech/mirai-console-loader/releases/download/v1.0.5/mcl-1.0.5.zip && \
	unzip -q ./mcl.zip && \
	rm mcl.zip && \
	chmod +x ./mcl && \
	./mcl --dry-run && \
	wget -O plugins/onebot-mirai.jar https://github.com/yyuueexxiinngg/onebot-kotlin/releases/download/0.3.4/onebot-mirai-0.3.4-all.jar

COPY ./docker ./

ENV ENV_CONFIG 1
ENV QQ_ID 11111111
ENV QQ_PASS qweqwe
ENV WS_PORT 6700
ENV WS_TOKEN qweqwe

ENTRYPOINT [ "./docker/entrypoint.sh" ]
CMD ["java","-Dmirai.slider.captcha.supported","-jar","mcl.jar"]
