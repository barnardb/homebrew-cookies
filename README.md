# Homebrew-Cookies

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

Run `./update.sh` to check if there's a new upstream release and make and push an update to the formula if there is.

Run `./check-reinstall-test.sh` after making other changes to the formula
to see if there's a newer upstream version,
if brew has any opinions about improving the formula,
and if the we can successfully install the formula.
