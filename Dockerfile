FROM node:21

RUN npm install -g @vscode/vsce@2.26.0

WORKDIR /work
ENTRYPOINT [ "vsce" ]
CMD [ "package" ]