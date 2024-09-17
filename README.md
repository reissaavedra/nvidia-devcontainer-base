# nvidia-devcontainer-base

This project provides a Docker container setup optimized for NVIDIA GPU development using CUDA and Python. It is designed to facilitate the development of machine learning and data science applications by providing a pre-configured environment with essential tools and libraries.

## Features

- **CUDA Support**: Built on NVIDIA's CUDA base image, enabling GPU acceleration for compute-intensive tasks.
- **Python Environment**: Comes with Python pre-installed, along with essential libraries for data science and machine learning.
- **Poetry for Dependency Management**: Utilizes Poetry to manage project dependencies, ensuring a clean and reproducible environment.
- **Customizable**: Easily modify the Dockerfile to add additional packages or configurations as needed.

## Getting Started

To get started with this project, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/nvidia-devcontainer-base.git
   cd nvidia-devcontainer-base
   ```

2. **Build the Docker Image**:
   ```bash
   docker build -t nvidia-devcontainer-base .
   ```

3. **Run the Docker Container**:
   ```bash
   docker run --gpus all -it nvidia-devcontainer-base
   ```

## Usage

Once inside the container, you can start developing your application. The environment is set up with common data science libraries, and you can install additional packages using Poetry.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
