# Homerew-Cookies

The repo contains a [Homebrew] formula for [barnardb/cookies].

[Homebrew]: https://brew.sh/
[barnardb/cookies]: https://github.com/barnardb/cookies


## How do I install this formula?

`brew install barnardb/cookies/cookies`

Or `brew tap barnardb/cookies` and then `brew install cookies`.

Or install via URL (which will not receive updates):
```bash
brew install https://raw.githubusercontent.com/barnardb/homebrew-cookies/master/Formula/cookies.rb
```


## Updating

Run `./check.sh` to see if there's a newer version to or if brew has any opinions about improving the formula.

You to check that the formula works, run
```bash
brew install --reinstall Formula/cookies.rb && brew test cookies
```
