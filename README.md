
# Nmap Shell Script

This is a simple but advanced shell script for running Nmap scans on a target IP address. It allows you to specify port ranges, scan types (TCP or UDP), verbose mode, timeouts, and output files for storing the results.

## Features

- **TCP and UDP Scanning**: Choose between TCP (`-sT`) or UDP (`-sU`) scanning.
- **Verbose Mode**: Display detailed information during the scan using the `-v` flag.
- **Timeout Support**: Set a timeout for the scan with the `--host-timeout` option.
- **Output to File**: Store the results in a user-specified output file using the `-oN` option.

## Requirements

- **Nmap** must be installed on your system.
  - Install Nmap using the following command (for Debian-based systems like Ubuntu):
    ```bash
    sudo apt-get install nmap
    ```

## Usage

### Syntax:

```bash
./nmap_scan.sh <Target IP> <Start Port> <End Port> [Output File] [Scan Type] [Verbose] [Timeout]
```

### Parameters:

- **Target IP** (`<Target IP>`): The IP address of the target you want to scan.
- **Start Port** (`<Start Port>`): The starting port of the range you want to scan.
- **End Port** (`<End Port>`): The ending port of the range you want to scan.
- **Output File** (`[Output File]`): (Optional) The file where scan results will be saved. Defaults to `nmap_scan_results.txt`.
- **Scan Type** (`[Scan Type]`): (Optional) The type of scan to perform:
  - `tcp` for a TCP scan (default).
  - `udp` for a UDP scan.
- **Verbose** (`[Verbose]`): (Optional) Use `yes` for verbose output to see more details during the scan.
- **Timeout** (`[Timeout]`): (Optional) Set a timeout duration for the scan (e.g., `60s`, `1m`, `1h`).

### Examples:

1. **Basic TCP Scan**:
   Scan ports 20 to 100 on `192.168.1.1` and save results to `nmap_scan_results.txt`.
   ```bash
   ./nmap_scan.sh 192.168.1.1 20 100
   ```

2. **Verbose UDP Scan**:
   Scan ports 1000 to 2000 on `192.168.1.1` in verbose mode and save results to `udp_scan_results.txt`.
   ```bash
   ./nmap_scan.sh 192.168.1.1 1000 2000 udp yes
   ```

3. **TCP Scan with Timeout**:
   Scan ports 22 to 80 on `192.168.1.1`, set a timeout of 30 seconds, and save the results.
   ```bash
   ./nmap_scan.sh 192.168.1.1 22 80 tcp no 30s
   ```

4. **UDP Scan with Timeout and Output File**:
   Scan ports 500 to 600 on `192.168.1.1`, set a timeout of 60 seconds, and save results to `udp_scan_output.txt`.
   ```bash
   ./nmap_scan.sh 192.168.1.1 500 600 udp no 60s udp_scan_output.txt
   ```

## Output

The script will generate an Nmap output file (default: `nmap_scan_results.txt`) that includes the results of the scan. The output will contain information about open ports, services, and any vulnerabilities detected depending on the scan type and options used.

## License

This script is open-source and free to use. Feel free to modify or extend it according to your needs.

## Contributions

If you'd like to contribute to this project, please fork the repository and create a pull request with your proposed changes. Contributions are always welcome!

---

Happy scanning!
