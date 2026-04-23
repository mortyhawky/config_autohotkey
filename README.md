### Autohotkey configuration


#### Create repo in pwsh
```pwsh
bat README.md
git status 
git init -v
echo "## Autohotkey configuration" >> README.me
git add -A -v
scoop install grep
git status | grep --color=always "new file:"
git commit -m "$(date)" -v
```

#### Login with gh
```pwsh
gh auth status
  gh auth login
```

#### Create repo with gh
```pwsh
gh repo create "config_autohotkey" --public --source=. --remote=origin
git push -u origin main
```


