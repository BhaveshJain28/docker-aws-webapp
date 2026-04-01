#Build the frontend  [dist folder ] by running the command npm run build in the frontend folder

#Copy the dist folder container in backend/public folder

FROM node:20-alpine as frontend-builder

COPY ./frontend /App

WORKDIR /App

RUN npm install

RUN npm run build

FROM node:20-alpine

COPY ./backend /App

WORKDIR /App
RUN npm install

COPY --from=frontend-builder /App/dist /App/public

CMD ["node","server.js"]


# docker-aws-ALB-1195696341.ap-northeast-1.elb.amazonaws.com