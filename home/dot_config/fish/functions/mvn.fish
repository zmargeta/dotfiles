function mvn -d 'Run Maven Wrapper or Maven'
  set current_dir (pwd)
  while test -n $current_dir; and not set -qf project_dir
    if test -f $current_dir/mvnw
      set project_dir $current_dir
      break
    end
    set current_dir (string split -r -m1 -f1 / $current_dir)
  end
  if set -qf project_dir; and test -f $project_dir/mvnw
    echo -e '\nExecuting Maven Wrapper'
    bash -c {$project_dir}'/mvnw "$@"' _ $argv
  else
    command mvn $argv
  end
end
