# TurboBoostToggle  

**A script to disable CPU Turbo Boost, reducing heat and fan noise, especially on gaming laptops. Works on Windows and Linux.**  

## Features  
- Detects and disables/enables CPU Turbo Boost.  
- Supports Windows and Linux platforms.  
- Reduces CPU temperatures and improves thermal performance.  
- Easy-to-use command-line script.  

## Why Disable Turbo Boost?  
Turbo Boost increases CPU clock speeds for better performance but can cause:  
- High temperatures.  
- Excessive fan noise.  
- Reduced laptop longevity due to heat stress.  

Disabling Turbo Boost helps maintain stable temperatures, especially during gaming or heavy workloads.  

## How to Use  

### Windows  
1. Download the `Windows/turboboost_disable.ps1` script.  
2. Run PowerShell as Administrator.  
3. Execute the script:  
   ```powershell
   ./turboboost_disable.ps1

### Linux  
1. Download the `Linux/turboboost_disable.sh` script.  
2. Make the script executable:  
   ```bash
   chmod +x turboboost_disable.sh
3. Run the script with sudo:
   sudo ./turboboost_disable.sh

## Demo  
<p align="center">
  <img src="demo.gif" alt="Turbo Boost Toggle Demo">
</p>  

## Contributing  
We welcome contributions! 

## License  
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
