# Start by using the official Golang image (version 1.21) as the base image for building the application.
# This image contains all the necessary tools to build Go applications.
FROM golang:1.22.5 as base

# Set the working directory inside the container to /app.
# All subsequent commands will be run from this directory.
WORKDIR /app

# Copy the go.mod file (which lists dependencies) into the working directory.
# This allows us to download dependencies before copying the rest of the source code,
# which helps leverage Docker's build cache for faster builds.
COPY go.mod .

# Download all Go module dependencies specified in go.mod.
# This step ensures that all required packages are available for building the app.
RUN go mod download

# Copy the rest of the application source code from the host into the container's working directory.
# This includes all .go files and any other files needed for the build.
COPY . .

# Build the Go application.
# The output binary will be placed at the root (/) of the container filesystem and named 'main'.
RUN go build -o /main .

# Start a new, final stage using a minimal, secure distroless image.
# Distroless images contain only the application and its runtime dependencies, reducing the attack surface.
FROM gcr.io/distroless/base

# Copy the compiled Go binary from the previous build stage into the root of the new image.
COPY --from=base /main .

# Copy the 'static' directory (e.g., for serving static files like HTML, CSS, JS) from the build stage.
# This ensures static assets are available in the final image.
COPY --from=base /app/static /static

# Expose port 8080 to allow traffic to the application.
# This is the port your Go web server is expected to listen on.
EXPOSE 8080 

# Set the default command to run the compiled Go binary.
# The application will start when the container runs.
CMD ["/main"]