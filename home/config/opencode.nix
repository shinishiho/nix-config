{ config, ... }:

let
  readOnlyShell =
    map
      (resource: {
        action = "shell";
        inherit resource;
        effect = "allow";
      })
      [
        "git status"
        "git status --short"
        "git diff --no-ext-diff --no-textconv"
        "git diff --no-ext-diff --no-textconv --stat"
        "codegraph explore *"
      ];
in
{
  programs.opencode = {
    enable = true;
    enableMcpIntegration = true;
    mutableSettings = true;
    # shortcut: full schema validation needs real provider output limits; validate safety settings separately until known.

    settings = {
      permissions = [
        {
          action = "*";
          resource = "*";
          effect = "ask";
        }
      ]
      ++
        map
          (action: {
            inherit action;
            resource = "*";
            effect = "allow";
          })
          [
            "read"
            "edit"
            "glob"
            "grep"
            "question"
            "webfetch"
            "websearch"
            "skill"
            "execute"
            "context7_*"
          ]
      ++ [
        {
          action = "read";
          resource = "*.env";
          effect = "ask";
        }
        {
          action = "read";
          resource = "*.env.*";
          effect = "ask";
        }
        {
          action = "read";
          resource = "*.env.example";
          effect = "allow";
        }
      ]
      ++ readOnlyShell;

      # Policies apply after agent overrides and saved approvals; shell still needs approval.
      policies =
        builtins.concatMap
          (
            action:
            map
              (path: {
                action = "tool.use";
                resource = "${action}:${path}";
                effect = "deny";
              })
              [
                "*.ssh/*"
                "*.gnupg/*"
                "*.password-store/*"
                "*.aws/*"
                "*.codex/auth.json"
                "*.claude/.credentials.json"
                "*.local/share/opencode/auth.json"
              ]
          )
          [
            "read"
            "edit"
          ];

      agents = {
        plan.permissions = [
          {
            action = "edit";
            resource = "*";
            effect = "deny";
          }
          {
            action = "edit";
            resource = "${config.home.homeDirectory}/.opencode/plan/*";
            effect = "allow";
          }
          {
            action = "shell";
            resource = "*";
            effect = "deny";
          }
          {
            action = "subagent";
            resource = "*";
            effect = "deny";
          }
          {
            action = "subagent";
            resource = "explore";
            effect = "allow";
          }
        ]
        ++ readOnlyShell;
        explore.permissions = [
          {
            action = "edit";
            resource = "*";
            effect = "deny";
          }
          {
            action = "shell";
            resource = "*";
            effect = "deny";
          }
          {
            action = "subagent";
            resource = "*";
            effect = "deny";
          }
        ]
        ++ readOnlyShell;
      };

      provider = {
        routera = {
          npm = "@ai-sdk/openai-compatible";
          name = "Routera";
          options = {
            baseURL = "https://api.routera.one/v1";
            headers.Authorization = "Bearer {env:ROUTERA_API_KEY}";
          };
          models = {
            # OpenCode costs are USD per 1M tokens; Routera credits cost $3 per 10M
            # and bill each model's multiplier k per token as input k, output 2k,
            # cache-read 0.1k, cache-write 2k credits.
            "openai/gpt-6-astra" = {
              name = "GPT 6 Astra (Routera)";
              cost = {
                input = 1.38;
                output = 2.76;
                cache_read = 0.138;
                cache_write = 2.76;
              };
              options.reasoningEffort = "high";
            };
            "openai/gpt-6.1-sol" = {
              name = "GPT 6.1 Sol (Routera)";
              cost = {
                input = 0.345;
                output = 0.69;
                cache_read = 0.0345;
                cache_write = 0.69;
              };
              options.reasoningEffort = "high";
            };
            "openai/gpt-6-luna" = {
              name = "GPT 6 Luna (Routera)";
              cost = {
                input = 0.0138;
                output = 0.0276;
                cache_read = 0.00138;
                cache_write = 0.0276;
              };
              options.reasoningEffort = "max";
            };
            "xai/grok-4.7" = {
              name = "Grok 4.7 (Routera)";
              cost = {
                input = 0.345;
                output = 0.69;
                cache_read = 0.0345;
                cache_write = 0.69;
              };
              limit.context = 262144;
              options.reasoningEffort = "high";
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
            "gpt-6-sol" = {
              name = "GPT 6 Sol (Hapuppy)";
              cost = {
                input = 0.4166666667;
                output = 1.0;
                # cache_read = 0.0;
                # cache_write = 0.0;
              };
              options.reasoningEffort = "high";
            };
            "gpt-6-luna" = {
              name = "GPT 6 Luna (Hapuppy)";
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
                input = 0.1666666667;
                output = 0.8333333333;
                # cache_read = 0.0;
                # cache_write = 0.0;
              };
            };
            "glm-5.3-flash" = {
              name = "GLM 5.3 Flash (Hapuppy)";
              cost = {
                input = 0.0833333333;
                output = 0.4166666667;
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
            "anthropic/claude-opus-5-5" = {
              name = "Claude Opus 5.5 (Routera)";
              cost = {
                input = 0.69;
                output = 1.38;
                cache_read = 0.069;
                cache_write = 1.38;
              };
            };
            "anthropic/claude-sonnet-5-5" = {
              name = "Claude Sonnet 5.5 (Routera)";
              cost = {
                input = 0.345;
                output = 0.69;
                cache_read = 0.0345;
                cache_write = 0.69;
              };
            };
          };
        };

        # Self-hosted: llama.cpp IQ3_S GGUF served by a Strata server on Modal
        # serverless GPU. No cost, the GPU hours are billed to the Modal account.
        strata = {
          npm = "@ai-sdk/openai-compatible";
          name = "Strata (Modal)";
          options = {
            baseURL = "https://shinishiho--strata-qwen38-flash-next-iq3s-strataserver-serve.modal.run/v1";
            apiKey = "{env:STRATA_API_KEY}";
          };
          models = {
            "qwen3.8-flash-next-iq3_s" = {
              name = "Qwen 3.8 Flash Next IQ3_S (Strata)";
              limit.context = 262144;
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
