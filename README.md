# SubWalker
[![](https://img.shields.io/twitter/follow/m8r0wn?color=blue&label=Twitter&logo=twitter&style=plastic)](https://twitter.com/m8sec)&nbsp;&nbsp;
[![](https://img.shields.io/github/followers/m8r0wn?color=gray&label=GitHub&logo=github&style=plastic)](https://github.com/m8sec)&nbsp;&nbsp;
[![](https://img.shields.io/badge/Sponsor-GitHub-green?style=plastic&logo=github)](https://github.com/sponsors/m8sec)&nbsp;&nbsp;
[![](https://img.shields.io/badge/Donate-PayPal-blue?style=plastic&logo=paypal)](https://www.paypal.com/donate?hosted_button_id=68W8UCUF4SMTC)

SubWalker is a simple Bash recon script that will simultaneously execute various subdomain enumeration tools, aggregate the results, and write entries to a file free of duplicates. This helps prevent discrepancies in enumeration tools, even those claiming to use similar sources. 

**Tools used:**
* [SubScraper](https://github.com/m8sec/subscraper)
* [Sublist3r](https://github.com/aboul3la/Sublist3r)
* [AssetFinder](https://github.com/tomnomnom/assetfinder)

### Install
Written for Debian-based Linux distributions (*Kali* & *Ubuntu*):

```text
git clone https://github.com/m8sec/subwalker
cd subwalker; chmod +x install.sh subwalker.sh
sudo ./install.sh
```

### Usage
```text
#> ./subwalker.sh example.com
[*] Executing SubWalker against: example.com
[*] Launching SubScraper
[*] Launching Sublist3r
[*] Launching assetfinder
[*] Waiting until all scripts complete...

[+] SubWalker complete with 107 results
[+] Output saved to: /opt/subwalker/subwalker.txt
```

### Write-Up 
* [Tool Chaining with Bash *(m8sec.medium.com)*](https://infosecwriteups.com/intro-to-bug-bounty-automation-tool-chaining-with-bash-13e11348016f)

