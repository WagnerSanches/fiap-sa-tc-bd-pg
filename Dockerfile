FROM postgres:latest

ENV POSTGRES_PASSWORD=fiap
ENV POSTGRES_USER=fiap
ENV POSTGRES_DB=fastfood

# Copiar o script SQL (DDL) para o container
COPY ddl-script.sql /docker-entrypoint-initdb.d/

# Expôs a porta padrão do PostgreSQL
EXPOSE 5432
