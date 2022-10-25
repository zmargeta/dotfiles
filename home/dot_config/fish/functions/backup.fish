function backup -d 'Backup files'
  argparse 'h/help' 'e/extension=?' -- $argv; or return
  if set -ql _flag_help
    echo 'backup [-h] [-e extension] file_name ...'
    return 0
  end
  if set -ql _flag_extension
    set extension "$_flag_extension"
  else
    set extension bak
  end
  for file in $argv
    cp -i -v $file "$file.$extension"
  end
end
