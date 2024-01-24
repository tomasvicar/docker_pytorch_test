# docker_pytorch_test

1) nainstalované WSL2 https://github.com/tomasvicar/Jax_wsl2_cuda
2) nainstalovat docker a powolit ho pro wsl podle https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-containers

debugging:
- nainstaloval sem si windows terminal - lepší než standardní příkazová řádka

- vyzkošet docker podle https://hub.docker.com/r/pytorch/pytorch/tags

- docker pull pytorch/pytorch:latest

- docker exec -it pytorch/pytorch:latest bash

- nefunguje - je potřeba ještě něco doinstalovat aby jel docker pro cudu
- docker ps -a
- docker rm my_pytorch_container

- teď podle:
- https://docs.nvidia.com/cuda/wsl-user-guide/index.html
- říká že to jede bez ničeho....

- tohle jede!:
- sudo docker run --gpus all nvcr.io/nvidia/k8s/cuda-sample:nbody nbody -gpu -benchmark

- tak zkusíme docker run -it --gpus all --name my_pytorch_container pytorch/pytorch:latest bash
- https://www.youtube.com/watch?v=CO43b6XWHNI youtube kde to intaluje postru z linuxu, teď už asi jede i z windows

