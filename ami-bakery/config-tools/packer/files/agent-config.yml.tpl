version: "1.0"
config:
  - stage: boot
    tasks:
      - task: extendRootPartition

  - stage: preReady
    tasks:
      - task: activateWindows
        inputs:
          activation:
            type: amazon

      - task: setDnsSuffix
        inputs:
          suffixes:
            - $REGION.ec2-utilities.amazonaws.com

      - task: setAdminAccount
        inputs:
          name: Admin
          password:
            type: random
          expire: true

      - task: setWallpaper
        inputs:
          attributes:
            - hostName
            - instanceId
            - privateIpAddress
            - publicIpAddress
            - instanceSize
            - availabilityZone
            - architecture
            - memory
            - network
          path: C:\ProgramData\Amazon\EC2Launch\wallpaper\Ec2Wallpaper.jpg

  - stage: postReady
    tasks:
      - task: startSsm
