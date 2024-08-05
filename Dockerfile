# Use the official Node.js image.
FROM node:18

# Set the working directory in the container.
WORKDIR /usr/src/app

# Copy package.json and package-lock.json.
COPY package*.json ./

# Install dependencies.
RUN npm install

# Copy the rest of the application code.
COPY . .

# Install PM2 globally.
RUN npm install -g pm2

# Expose the port the app runs on.
EXPOSE 3000

# Start the application with PM2.
CMD ["pm2-runtime", "start", "server.js"]
