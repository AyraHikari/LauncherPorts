#!/system/bin/sh
# DerpLauncher

# DT2S Fix
[[ -e "/sys/touchpanel/double_tap" ]] && {
  chmod 0666 "/sys/touchpanel/double_tap" 2>/dev/null
  echo "1" > "/sys/touchpanel/double_tap"
}

# Increase system's smoothness and launcher's smoothness by increasing priority of some specified processes
for pid in $(pidof -s surfaceflinger) $(pidof -s system_server) $(pgrep -f com.android.systemui) $(pgrep -f com.android.launcher3); do
  echo "-17" > "/proc/${pid}/oom_adj"
  renice -n "-18" -p "$pid"
done