# 構成

- API
  - FastAPI
  - <https://fastapi.tiangolo.com/>
- Kubernetes 環境構築ファイル
  - k8s 配下
    - NodePort は開発(ローカル)専用です
    - Ingress は商用を想定した環境です

## kubernetes のローカル環境構築

### kubernetes のインストール

1. Docker for Mac のインストール
2. preference>>kubernetes で「Enable」にする
3. ターミナルで「kubectl」が使えれば OK

### docker image のデプロイ

1. app 配下の Dockerfile で Image を build して任意の DockerHub に push します
2. kubernetes 配下の deployment ファイル内の`<container image>`を Hub の URL に書き替えます

### kubernetes の環境構築(NodePort)

1. 以下を実行

```bash
kubectl apply -f k8s/local-nodepoet
```

2. ブラウザで確認\
   <http://127.0.0.1:31516>

### kubernetes の環境構築(Ingress)

1. 下記リンクの Docker for mac 用のコマンドを実行
   <https://kubernetes.github.io/ingress-nginx/deploy/#docker-for-mac>

2. 以下を実行

```bash
kubectl get pods -n ingress-nginx

// ↓こんなoutputが出ればOKです
(ingress-nginx-controller-5cc4589cc8-x7pg2   1/1     Running     0          66s)
```

3. 以下を実行

```bash
kubectl apply -f k8s/local-ingress
```

4. ブラウザで確認\
   http://127.0.0.1

## Tips

- Docker for mac の kubernetes を使う前提となってますので、minikube や windows の方は適宜設定を変えてください。
