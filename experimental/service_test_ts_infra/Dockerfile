# /app/Dockerfile

FROM node:20-slim
# Set working directory
WORKDIR /app
# Copy the pre-built binary from Bazel
COPY tsc_binary_app /app/tsc_binary_app
# Ensure the binary is executable (if it’s a compiled binary)
RUN chmod +x /app/tsc_binary_app
# Expose port (optional, adjust if your app serves HTTP)
EXPOSE 3000
# Setup the entry point for the app
ENTRYPOINT ["/app/tsc_binary_app"]
