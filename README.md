# steamcmd

The Dockerfile will build an image for running SteamCMD like an executable.

An simple example that will run SteamCMD and login as an anonymous user:

```
docker run -it kmallea/steamcmd +login anonymous
```

A more useful example that will login anonymously and download CS:GO to run as a dedicated server. Again, just pass args since it works like an executable:

```
docker run -it kmallea/steamcmd \
    +login anonymous \
    +force_install_dir ../csgo \
    +app_update 740 validate \
    +quit
```