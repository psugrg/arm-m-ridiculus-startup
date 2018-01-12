
usage together with docker:

1. Create docker 
docker create --name devn-extremestartup -v `pwd`:`pwd` -w `pwd` --rm -i -t psu82/psu-devn-arm-none-eabi bash

2. Start docker (it will have bash opened)
docker start devn-extremestartup

3. Execute build command
docker exec devn-extremestartup make all