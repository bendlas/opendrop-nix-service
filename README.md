
Forked from https://github.com/delneg/opendrop-nix-service and flakified

didn't work out for me, but maybe you can find a working setup.

#### Usage

`mkdir /home/user/.local/opendrop-data`

And in your system flake:

```nix
{
  inputs.opendrop-nix-service.url = "github:bendlas/opendrop-nix-service";
  outputs = { opendrop-nix-service }: {
    nixosConfigurations.machine.modules = [
      opendrop-nix-service.nixosModules.opendrop
      {
        services.opendrop-server = {
          enable = true;
          user = "user";
          dataDir = "/home/user/.local/opendrop-data";
          networkInterface = "wlan0";
        };
      }
    ];
  };
}
```
