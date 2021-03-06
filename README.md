# docker-mirai-cqhttp

Mirai CQHTTP 镜像，支持滑块验证。

## 项目地址

https://github.com/purerosefallen/docker-mirai-cqhttp

## 建议 docker-compose

### `novnc` 镜像

```yaml
version: '2.4'
services:
  cqhttp:
    restart: always
    image: git-registry.mycard.moe/nanahira/docker-mirai-cqhttp:novnc
    ports:
      - '6700:6700'
    volumes:
      - ./data:/usr/src/app/data
      - ./config:/usr/src/app/config
      - ./bots:/usr/src/app/bots
    environment:
      QQ_ID: 11111111
      QQ_PASS: change_me
      WS_PORT: 6700
      WS_TOKEN: change_me
      VNC_PASS: change_me
```

### `x` 镜像

```yaml
version: '2.4'
services:
  novnc:
    restart: always
    image: theasp/novnc:latest
    environment:
      DISPLAY_WIDTH: 425
      DISPLAY_HEIGHT: 900
      RUN_XTERM: 'no'
    ports:
      - 11180:8080
  cqhttp:
    restart: always
    image: git-registry.mycard.moe/nanahira/docker-mirai-cqhttp:x
    ports:
      - '6700:6700'
    volumes:
      - ./data:/usr/src/app/data
      - ./config:/usr/src/app/config
      - ./bots:/usr/src/app/bots
    stdin_open: true
    environment:
      DISPLAY: novnc:0.0
      QQ_ID: 11111111
      QQ_PASS: change_me
      WS_PORT: 6700
      WS_TOKEN: change_me
```

### 说明

第一次登录时，需要在 `http://<服务器地址>:11180/vnc.html` 打开 noVNC 界面，并拉滑块。

提示需要扫码登录时，点击左侧的 noVNC 界面的剪贴板按钮，把地址复制到自己电脑的浏览器，扫码即可。

## Tag

* `lite` 无 GUI 镜像。需要有现成的 `devices.json` 文件。

* `x` 带 GUI 镜像，需要配合 noVNC 使用以拉滑块。

* `novnc` 带 GUI 和 noVNC 镜像，可以直接拉滑块。noVNC 监听在 8080 端口。

* `latest` 同 `novnc`。

## 环境变量

### 默认值

```
ENV ENV_CONFIG 1
ENV QQ_ID 11111111
ENV QQ_PASS qweqwe
ENV WS_PORT 6700
ENV WS_TOKEN qweqwe
ENV VNC_PASS nanahira
```

### 说明

* `ENV_CONFIG` 默认 1。如果是 1 则用下面的环境变量覆盖配置。

* `QQ_ID` QQ 号。

* `QQ_PASS` QQ 密码。

* `WS_PORT` Websocket 端口。

* `WS_TOKEN` Websocket 使用的密钥。

* `VNC_PASS` 仅限 `novnc` 镜像。noVNC 网页密码，默认 `nanahira`。
