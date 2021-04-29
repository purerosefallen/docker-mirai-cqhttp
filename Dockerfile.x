ARG BASE_IMAGE=git-registry.mycard.moe/nanahira/docker-mirai-cqhttp:latest
FROM ${BASE_IMAGE}

RUN ./mcl --update-package net.mamoe:mirai-login-solver-selenium --type plugin
ENV DISPLAY=:0

CMD ["java", "-jar", "mcl.jar"]
