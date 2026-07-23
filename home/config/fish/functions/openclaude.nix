{
  programs.fish.functions.openclaude = ''
    argparse \
        'u/base-url=' \
        'm/model=' \
        'p/pass=' \
        'h/help' \
        -- $argv
    or return 2

    if set -q _flag_help
        echo "Usage:"
        echo "  openclaude --base-url URL --model MODEL [--pass ENTRY] [-- CLAUDE_ARGS...]"
        echo
        echo "Options:"
        echo "  -u, --base-url URL   Provider API base URL"
        echo "  -m, --model MODEL    Model name"
        echo "  -p, --pass ENTRY     Read API token from pass"
        echo "                       Defaults to: sk-lmao"
        echo "  -h, --help           Show this help"
        return 0
    end

    if not set -q _flag_base_url; or test -z "$_flag_base_url"
        echo "Error: --base-url is required." >&2
        return 2
    end

    if not set -q _flag_model; or test -z "$_flag_model"
        echo "Error: --model is required." >&2
        return 2
    end

    set -l token "sk-lmao"

    if set -q _flag_pass
        set token (pass show "$_flag_pass")
        set -l pass_status $status

        if test $pass_status -ne 0; or test -z "$token"
            echo "Error: failed to retrieve token from pass entry: $_flag_pass" >&2
            return 1
        end
    end

    set -lx ANTHROPIC_BASE_URL "$_flag_base_url"
    set -lx ANTHROPIC_AUTH_TOKEN "$token"

    set -l settings (string join "" \
        '{"env":{' \
        '"CLAUDE_CODE_ATTRIBUTION_HEADER":"0",' \
        '"CLAUDE_CODE_ENABLE_TELEMETRY":"0",' \
        '"ANTHROPIC_DEFAULT_SONNET_MODEL":"' "$_flag_model" '",' \
        '"ANTHROPIC_DEFAULT_OPUS_MODEL":"' "$_flag_model" '",' \
        '"ANTHROPIC_DEFAULT_HAIKU_MODEL":"' "$_flag_model" '"' \
        '}}')

    command claude \
        --settings "$settings" \
        --model "$_flag_model" \
        --exclude-dynamic-system-prompt-sections \
        --dangerously-skip-permissions \
        $argv
  '';
}
