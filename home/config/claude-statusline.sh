# Claude Code statusLine, in the starship "pure" look:
#   w@host  ~/dir  branch*  Model effort  #PR  +add −del  $cost
#   ctx ━━━━━───── 43%   5h ━━━─────── 31% ↻2h13m   7d ━───────── 9% ↻4d15h   cache 42m
input=$(cat)
j() { jq -r "$1 // empty" <<<"$input"; }
now=$(date +%s)

dir=$(j .workspace.current_dir)
effort=$(j .effort.level)
pr=$(j .pr.number)
add=$(j .cost.total_lines_added) del=$(j .cost.total_lines_removed)
cost=$(j .cost.total_cost_usd)
ctx=$(j .context_window.used_percentage)
warm=$(jq -r '.prompt_cache.warm' <<<"$input")
exp=$(j .prompt_cache.expires_at)
branch=$(git -C "$dir" --no-optional-locks branch --show-current 2>/dev/null || true)
dirty=$(git -C "$dir" --no-optional-locks status --porcelain 2>/dev/null || true)

e=$'\e' r=$'\e[0m' grey=$'\e[90m'
# Bar cells run green -> peach -> red by position, so a fuller bar ends hotter.
heat=('166;227;161' '166;227;161' '180;226;160' '200;225;165' '230;225;170' '249;226;175' '250;200;150' '250;179;135' '245;150;150' '243;139;168')
gauge() { # label pct
  local p i g=""
  p=$(printf '%.0f' "$2")
  for ((i = 0; i < 10; i++)); do
    if ((i * 10 < p)); then g+="${e}[38;2;${heat[i]}m━"; else g+="${e}[38;5;238m━"; fi
  done
  printf '%s %s%s %s%%' "${grey}$1${r}" "$g" "$r" "$p"
}
left() { # epoch -> 4d15h / 2h13m / 42m
  local s=$(($1 - now))
  ((s > 0)) || s=0
  if ((s >= 86400)); then echo "$((s / 86400))d$((s % 86400 / 3600))h"
  elif ((s >= 3600)); then echo "$((s / 3600))h$((s % 3600 / 60))m"
  else echo "$((s / 60))m"; fi
}

d=${dir/#$HOME/\~} max=40 # path chars; longer paths keep their tail: …/deep/nested/dir
((${#d} <= max)) || d="…${d: -(max - 1)}"
l1="${grey}$(id -un)@${HOSTNAME%%.*}${r}  ${e}[34m${d}${r}"
[ -n "$branch" ] && l1+="  ${grey}${branch}${r}${dirty:+${e}[36m*${r}}"
l1+="  ${e}[33m$(j .model.display_name)${r}${grey}${effort:+ $effort}${r}"
if [ -n "$pr" ]; then
  case $(j .pr.review_state) in
    approved) pc=32 ;;
    changes_requested) pc=31 ;;
    draft) pc=90 ;;
    *) pc=35 ;;
  esac
  # OSC 8 hyperlink: cmd/ctrl+click opens the PR
  l1+="  ${e}]8;;$(j .pr.url)"$'\a'"${e}[${pc}m#${pr}${r}${e}]8;;"$'\a'
fi
((${add:-0} + ${del:-0})) && l1+="  ${e}[32m+${add:-0}${r} ${e}[31m−${del:-0}${r}"
l1+="  ${grey}\$$(printf '%.2f' "${cost:-0}")${r}"

l2=""
[ -n "$ctx" ] && l2+="$(gauge ctx "$ctx")   "
for w in five_hour:5h seven_day:7d; do
  p=$(j ".rate_limits.${w%%:*}.used_percentage")
  [ -n "$p" ] || continue
  l2+="$(gauge "${w#*:}" "$p") ${grey}↻$(left "$(j ".rate_limits.${w%%:*}.resets_at")")${r}   "
done
case $warm in
  true) [ -z "$exp" ] || l2+="${grey}cache${r} ${e}[36m$(left "$exp")${r}" ;;
  false) l2+="${grey}cache cold${r}" ;;
esac

printf '%s\n' "$l1" ${l2:+"$l2"}
