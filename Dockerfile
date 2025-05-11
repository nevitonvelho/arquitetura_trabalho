# syntax=docker/dockerfile:1

# Etapa base
ARG RUBY_VERSION=3.2.8
FROM registry.docker.com/library/ruby:$RUBY_VERSION-slim as base

# Define diretório de trabalho
WORKDIR /rails

# Define variáveis de ambiente para produção
ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development"

# Etapa de build (temporária)
FROM base as build

# Instala dependências necessárias para build
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    git \
    libpq-dev \
    libvips \
    pkg-config \
    libyaml-dev \
    curl \
    nodejs \
    yarn

# Copia apenas arquivos necessários para instalar as gems
COPY Gemfile Gemfile.lock ./
RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git && \
    bundle exec bootsnap precompile --gemfile

# Copia o restante da aplicação
COPY . .

# Converte quebras de linha de arquivos binários e dá permissão de execução
RUN find bin -type f -exec sed -i 's/\r$//' {} + && \
    chmod +x bin/*

# Precompila código bootsnap
RUN bundle exec bootsnap precompile app/ lib/

# Precompila assets (sem necessidade da master key)
RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile

# Etapa final (imagem enxuta)
FROM base

# Instala apenas dependências necessárias para produção
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    libpq5 \
    libvips && \
    rm -rf /var/lib/apt/lists/*

# Copia gems e código da aplicação da imagem de build
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /rails /rails

# Expõe a porta padrão do Rails
EXPOSE 3000

# Comando padrão de inicialização
CMD ["./bin/rails", "server"]
