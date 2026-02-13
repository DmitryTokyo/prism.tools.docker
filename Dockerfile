FROM public.ecr.aws/docker/library/nginx:1.28.2-alpine

WORKDIR /usr/share/nginx/html
COPY . .

EXPOSE 80
