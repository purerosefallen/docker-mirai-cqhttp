ARG BASE_IMAGE=git-registry.mycard.moe/nanahira/docker-mirai-cqhttp:latest
FROM ${BASE_IMAGE}

RUN wget -O plugins/mirai-login-solver-selenium.jar https://maven.aliyun.com/repository/public/net/mamoe/mirai-login-solver-selenium/1.0-dev-17/mirai-login-solver-selenium-1.0-dev-17-all.jar
ENV DISPLAY=:0

CMD ["java", "-jar", "mcl.jar"]
