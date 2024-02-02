# Dockerfile
FROM node:latest

# Çalışma dizinini ayarla
WORKDIR /usr/src/app

# ENV LANG C.UTF-8
# ENV LC_ALL C.UTF-8
ENV RUST_BACKTRACE full

# WordPress Playground reposunu klonla
RUN apt-get update && \
    apt-get install -y git \
    libwebkit2gtk-4.0-dev \
    build-essential \
    curl \
    wget \
    file \
    libssl-dev \
    libgtk-3-dev \
    libayatana-appindicator3-dev \
    librsvg2-dev && \
    git clone -b trunk --single-branch --depth 1 https://github.com/WordPress/wordpress-playground.gi>

RUN curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

RUN npm install


# Uygulamayı çalıştır
CMD ["npm", "run", "dev"]

EXPOSE 5400
