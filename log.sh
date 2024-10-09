#!/bin/bash

# Log file location
LOG_FILE=$(pwd)/log.txt

# ANSI color codes
RESET_COLOR="\033[0m"
INFO_COLOR="\033[1;34m"    # Blue
WARNING_COLOR="\033[1;33m" # Yellow
ERROR_COLOR="\033[1;31m"   # Red
DEBUG_COLOR="\033[1;36m"   # Cyan

# Function to write log messages with color
log_message() {
  local log_level=$1
  local log_message=$2
  local timestamp=$(date +"%Y-%m-%d %H:%M:%S")
  local color=$3

  # Log to console with color
  echo -e "${color}${timestamp} [${log_level}] : ${log_message}${RESET_COLOR}"

  # Log to file without color
  echo "${timestamp} [${log_level}] : ${log_message}" >>"$LOG_FILE"
}

# Helper functions for different log levels
info() {
  log_message "INFO" "$1" "$INFO_COLOR"
}

warn() {
  log_message "WARNING" "$1" "$WARNING_COLOR"
}

error() {
  log_message "ERROR" "$1" "$ERROR_COLOR"
}

debug() {
  log_message "DEBUG" "$1" "$DEBUG_COLOR"
}

# Usage examples:
# log_info "This is an info message"
# log_warning "This is a warning message"
# log_error "This is an error message"
# log_debug "This is a debug message"
