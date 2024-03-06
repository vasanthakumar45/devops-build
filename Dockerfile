FROM node:14
WORKDIR /app
Run git clone https://github.com/vasanthakumar45/devops-build .
EXPOSE 80
CMD ["npx", "serve", "-s", "-l", "80", "build"]
