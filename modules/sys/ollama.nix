{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ollama
  ];

  services.ollama = {
    enable = true;
  };

  environment.variables = {
    OLLAMA_GPU_MEMORY_FRACTION = "0.95";
  };
}
