# docker_pytorch_test

1) nainstalované WSL2 https://github.com/tomasvicar/Jax_wsl2_cuda
2) nainstalovat docker a powolit ho pro wsl podle https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-containers
3) chmod +x start_docker.sh && ./start_docker.sh
4) vscode ve windows
5) mít jupyter extension a napravo vybrat run interactive, zeptá se na kernel tak pripojit k existujícímu, dát url podle toho co vyplivl docker při spuštění (je tam url s tokenem)


pak jen docker run -it my_custom_pytorch jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root 
