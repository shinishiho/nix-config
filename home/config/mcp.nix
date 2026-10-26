{ config, ... }:

{
  programs = {
    mcp = {
      enable = true;
      servers = {
        context7 = {
          url = "https://mcp.context7.com/mcp";
          headers = {
            CONTEXT7_API_KEY = "{env:CONTEXT7_API_KEY}";
          };
        };
      };
    };

    # Shared headers are literal in Claude Code and Codex, so use their native runtime references.
    claude-code.mcpServers.context7 = {
      inherit (config.programs.mcp.servers.context7) url;
      headers.CONTEXT7_API_KEY = "\${CONTEXT7_API_KEY}";
    };
    codex.settings.mcp_servers.context7 = {
      inherit (config.programs.mcp.servers.context7) url;
      env_http_headers.CONTEXT7_API_KEY = "CONTEXT7_API_KEY";
    };
  };
}
