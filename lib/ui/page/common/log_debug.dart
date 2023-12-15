bool debug = true;

void Greethy_LogDebug(String TAG, String log) {
  if (debug) print("Class: " + TAG + " log: " + log);
}
