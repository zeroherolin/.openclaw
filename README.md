# Getting Started with Openclaw-Feishu

本目录用于存放 OpenClaw 相关配置与脚本。

## Ubuntu 环境准备

### 1) 更新系统与基础工具

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl wget git vim jq
```

### 2) 安装 Node.js 22

```bash
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt install -y nodejs
node -v
npm -v
```

### 3) 配置 npm 全局安装目录（避免 sudo）

```bash
mkdir -p ~/.npm-global
npm config set prefix ~/.npm-global
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
```

### 4) 安装 OpenClaw

```bash
npm install -g openclaw@latest
openclaw -v
```

## 安装本仓库并配置 Key

### 1) 拉取本仓库到 `~`

```bash
cd ~
git clone https://github.com/zeroherolin/.openclaw.git
```

### 2) 配置飞书开放平台

- 访问 [飞书开放平台](https://open.feishu.cn/) 进入开发者后台
- 创建应用（机器人），获取 **App ID** 和 **App Secret**
- 按需配置机器人权限并发布应用

### 3) 填写并写入 Key

编辑 `~/.openclaw/install_key.sh`，把以下 3 个占位符替换成你的值：

- `API_KEY="__API_KEY__"`
- `FEISHU_APP_ID="__FEISHU_APP_ID__"`
- `FEISHU_APP_SECRET="__FEISHU_APP_SECRET__"`

写入模型 API Key 与飞书 App 信息：

```bash
bash ~/.openclaw/install_key.sh
```

## 运行 OpenClaw

### 1) 启动 Gateway

```bash
openclaw gateway run
```
