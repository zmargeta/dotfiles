function gradle -d 'Run Gradle Wrapper or Gradle'
  set current_dir (pwd)
  while test -n $current_dir; and not set -qf project_dir
    if test -f $current_dir/gradlew
      set project_dir $current_dir
      break
    end
    set current_dir (string split -r -m1 -f1 / $current_dir)
  end
  if set -qf project_dir; and test -f $project_dir/gradlew
    echo -e '\nExecuting Gradle Wrapper'
    bash -c {$project_dir}'/gradlew "$@"' _ $argv
  else
    command gradle $argv
  end
end
