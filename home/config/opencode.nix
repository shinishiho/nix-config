_:

{
  programs.opencode = {
    enable = true;
    enableMcpIntegration = true;

    settings = {
      provider = {
        routera = {
          npm = "@ai-sdk/openai-compatible";
          name = "Routera";
          options = {
            baseURL = "https://api.routera.one/v1";
            headers.Authorization = "Bearer {env:ROUTERA_API_KEY}";
          };
          models = {
            "openai/gpt-6-astra" = {
              name = "GPT 6 Astra (Routera)";
              cost = {
                input = 0.6;
                output = 0.6;
                cache_read = 0.06;
                cache_write = 1.2;
              };
              options.reasoningEffort = "high";
            };
            "openai/gpt-5.6-sol" = {
              name = "GPT 5.6 Sol (Routera)";
              cost = {
                input = 0.3;
                output = 0.3;
                cache_read = 0.03;
                cache_write = 0.6;
              };
              options.reasoningEffort = "high";
            };
            "openai/gpt-5.6-luna" = {
              name = "GPT 5.6 Luna (Routera)";
              cost = {
                input = 0.012;
                output = 0.012;
                cache_read = 0.0;
                cache_write = 0.024;
              };
              options.reasoningEffort = "max";
            };
          };
        };

        hapuppy = {
          npm = "@ai-sdk/openai-compatible";
          name = "Hapuppy";
          options = {
            baseURL = "https://beta.hapuppy.com/v1";
            headers.Authorization = "Bearer {env:HAPUPPY_API_KEY}";
          };
          models = {
            # OpenCode costs are USD per 1M tokens; Hapuppy provides 6M credits per dollar.
            "gpt-6-astra" = {
              name = "GPT 6 Astra (Hapuppy)";
              cost = {
                input = 1.0416666667;
                output = 2.5;
                # cache_read = 0.0;
                # cache_write = 0.0;
              };
              options.reasoningEffort = "high";
            };
            "gpt-5.6-sol" = {
              name = "GPT 5.6 Sol (Hapuppy)";
              cost = {
                input = 0.4166666667;
                output = 1.0;
                # cache_read = 0.0;
                # cache_write = 0.0;
              };
              options.reasoningEffort = "high";
            };
            "gpt-5.6-luna" = {
              name = "GPT 5.6 Luna (Hapuppy)";
              cost = {
                input = 0.0633333333;
                output = 0.2;
                # cache_read = 0.0;
                # cache_write = 0.0;
              };
              options.reasoningEffort = "max";
            };
            "qwen3.8-27b:free" = {
              name = "Qwen3.8 27B Free (Hapuppy)";
            };
            "glm-5.3" = {
              name = "GLM 5.3 (Hapuppy)";
              cost = {
                input = 0.0833333333;
                output = 0.1166666667;
                # cache_read = 0.0;
                # cache_write = 0.0;
              };
            };
            "glm-5.3-flash" = {
              name = "GLM 5.3 Flash (Hapuppy)";
              cost = {
                input = 0.0416666667;
                output = 0.0833333333;
                # cache_read = 0.0;
                # cache_write = 0.0;
              };
            };
          };
        };

        "routera-anthropic" = {
          npm = "@ai-sdk/anthropic";
          name = "Routera Anthropic";
          options = {
            baseURL = "https://api.routera.one/v1";
            apiKey = "{env:ROUTERA_API_KEY}";
          };
          models = {
            "anthropic/claude-opus-5" = {
              name = "Claude Opus 5 (Routera)";
              cost = {
                input = 0.3;
                output = 0.3;
                cache_read = 0.03;
                cache_write = 0.6;
              };
              options.reasoningEffort = "high";
            };
            "anthropic/claude-haiku-4.5" = {
              name = "Claude Haiku 4.5 (Routera)";
              cost = {
                input = 0.06;
                output = 0.06;
                cache_read = 0.006;
                cache_write = 0.12;
              };
              options.reasoningEffort = "high";
            };
          };
        };
      };
    };
  };

  home.persistence."/persistent".directories = [
    ".local/share/opencode"
  ];
}
