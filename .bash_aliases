# aliases
alias aliases='nvim ~/.bash_aliases'
alias aliasesup='source ~/.bash_aliases'

# admin
alias killmosh='pgrep mosh-server | xargs -r kill'

# claude
alias cc='claude --continue --dangerously-skip-permissions'

# imfdb-browser
alias git-pull-imfdb-browser='sudo /opt/imfdb-browser/deploy/git-pull-imfdb-browser.sh'
alias copy-database-from-dev-imfdb-browser='sudo /opt/imfdb-browser/deploy/copy-database-from-dev-imfdb-browser.sh'
alias uvicorn-dev='ENABLE_ADMIN=true uv run uvicorn keeping_up_appearances.web.app:app --reload --port 8080'

# popref
alias apiup='/home/bunni/workspace/popref-api/scripts/api-up.sh'
alias djangoup='/home/bunni/workspace/popref-django/scripts/django-up.sh'
alias popup='/home/bunni/workspace/popref-django/scripts/pop-up.sh'

# tmux
alias t='tmux'
alias tl='tmux ls'
alias tn='tmux new -s "$(basename "$PWD")"'

loc() {
  git ls-files | while read f; do
    n=$(wc -l < "$f" 2>/dev/null); [ "$n" -gt 1 ] && echo "${f##*.} $n"
  done | awk '{a[$1]+=$2} END {for(e in a) printf "%-15s %8d\n","."e,a[e]}' | sort -k2 -rn | tee >(awk '{s+=$2} END {printf "%-15s %8d\n","TOTAL",s}')
}
