# Generated by https://smithery.ai. See: https://smithery.ai/docs/config#dockerfile
# Start with a Python base image
FROM python:3.11-slim-bookworm

# Set the working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && \
    apt-get install -y texlive-xetex pandoc && \
    rm -rf /var/lib/apt/lists/*

# Copy the application files
COPY . .

# Install the Python dependencies
RUN pip install --no-cache-dir .

# Set the environment variables
ENV UV_COMPILE_BYTECODE=1
ENV UV_LINK_MODE=copy

# Run the MCP server
ENTRYPOINT ["uv", "run", "mcp-pandoc"]
