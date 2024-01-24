# docker_pytorch_test

1) nainstalované WSL2 https://github.com/tomasvicar/Jax_wsl2_cuda
2) nainstalovat docker a powolit ho pro wsl podle https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-containers
3) chmod +x start_docker.sh && ./start_docker.sh
4) v novém terminalu code .
5) je potřeba extension docker a remote developmet (nebo jen dev containers z toho)
6) pak dát vlevo dole a ve vscode (modre tlacitko s wsl) a Atach to running container
7) doinstalovat extensions (je tu extension recommendation file), nechápu které zůstanou z windows a které ne...

- existující image a containery se dají hezky mazat z vscode ve wsl modu pres docker zalozku
- docker ps -a  ;docker rm name
- docker images; docker image rm id

## vytvořit jupyter server a připojit se na něj - funguje taky ale jen interactive python
na branchu https://github.com/tomasvicar/docker_pytorch_test/tree/jupyter_server


## debugging - tohle nakonec není treba:
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
- 
```
root@fa49a8a50315:/workspace# python
Python 3.10.13 (main, Sep 11 2023, 13:44:35) [GCC 11.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import torch
>>> a = torch.ones(5)
>>> b = a.cuda()
>>>
```

- teď vyzkouším dockerfile

  3) naklonuj docker file podle tohoto repa
  4) docker build -t my_custom_pytorch_image .
  5) docker run -it --gpus all --name my_pytorch_container my_custom_pytorch_image
  6) z jine comandline linuxu spust code .
  7) nainstaluj extensin pro docker a v praco se muzes připojit na bezici containery
  8) ale jak z toho přímo spoustet kód? jde tam spustit bash ve vscode

- zkousel jsem nějaké automatické vytvoření dockeru s devcontainer.json ale tam nešlo dát vlastní dockerfile jen se spolehnout na vscode, kde zase nefungovala cuda
