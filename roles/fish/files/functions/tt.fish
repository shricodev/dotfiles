# Either attach or create a new tmux session
function tt
  tmux new-session -A -s $argv
end
