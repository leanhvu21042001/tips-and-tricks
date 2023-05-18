# Vmmem - RAM - HIGH

## Do steps below

- `wsl --shutdown`
- `vim "$(wslpath "C:\Users\YourUsername\.wslconfig")"`
- value in file `.wslconfig` and Save
```
[wsl2] 
memory=4GB
```
- check again: `free -h --giga`
