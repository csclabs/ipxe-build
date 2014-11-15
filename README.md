# iPXE Build

This docker container is for the building of iPXE specifically for [Hanlon](https://github.com/csc/Hanlon).


## Build Image

Clone the repo.
`git clone https://github.com/jcpowermac/ipxe-build.git`
Create a local docker image.
`docker build -t jcpowermac/ipxe-build .`

## Build iPXE and extract required files

`chmod 755 create_ipxe_lkrn.sh`

`./create_ipxe_lkrn.sh`
