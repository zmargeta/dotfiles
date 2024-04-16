if type -q coursier
  set -gx COURSIER_BIN_DIR ~/.local/share/coursier/bin
  set -gx COURSIER_INSTALL_DIR ~/.local/share/coursier/bin
  set -gx COURSIER_CACHE ~/.cache/coursier/v1
  set -gx COURSIER_JVM_CACHE ~/.cache/coursier/jvm
  set -gx COURSIER_ARCHIVE_CACHE ~/.cache/coursier/arc
end

