# use official Golang image
FROM golang:1.21

# set working directory
WORKDIR /app

# Copy the source code
COPY . .

# Install Air
RUN go install github.com/cosmtrek/air@latest

# Download and install the dependencies
RUN go get -d -v ./...

# Build the Go app
RUN go build -o api .

#EXPOSE the port
EXPOSE 8000

# Run the executable
CMD ["air"]