# Use the base image 'node' in version 17
FROM node:17
# Change the working directory to '/app'
WORKDIR /app
# Copy the backend-code into the working directory 
COPY backend/ backend/
# Copy the wait-script into the working directory
COPY ./wait.sh /app/
# Set the permissions for the wait.sh script
RUN chmod o+rwx wait.sh && chown root:root wait.sh
# Change the working directory to '/app/backend'
WORKDIR /app/backend
# Run 'npm install' to install the package
RUN npm install
# Run the bash script to check if the database is ready for connections, and then start the server.js service 
CMD bash /app/wait.sh -h database -p 3306 -- node server.js
