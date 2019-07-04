# Haskell CLI Starter

A very basic starting point for command line applications with Haskell.

No external libraries, no build scripts, no cabal, no stack - just compile and run.
Check out the comments in the source files to find out how everything works.

See [scalez](https://github.com/nkleemann/scalez) as an example.

## Usage

Data flows as follows: 

```
main = getArgs >>= parse >>= handleArgs
```

### `getArgs`

Command line arguments are passed as an array of strings.

Example:
```
$ sayHello -user Nik
// getArgs returns: IO ["-user", "Nik"]
```

### `parse`

Pattern match on those strings and depending on those pattern pass
them together with your defined flags in tuples to `handleArgs`

Example:
```
parse :: [String] -> IO (Maybe String, Flag)
parse args =
    case args of
        ["-user", userName] -> return (Just userName, Greet)
```

### `handleArgs`

Pass this data to your top level functions.

Example:

```
handleArgs :: (Maybe String, Flag) -> IO ()
handleArgs :: (Maybe String, Flag)
    handleArgs args =
        case args of
        [Just userName, Greet] -> greetTheUserWith userName
```

## Notes & Trobleshooting

### `hlint(Redundant bracket)`

In the original state those *Tuples* in `Main.hs` are just a pair
of brackets and not really tuples. That's why hlint is complaining.

I provided them as: *"Your data goes here"* hints.

You make them tuples by adding your
own types and data accordingly.

You can safely remove the brackets when you just use flags as switches
without any data.

### I need more complex parsing

If you want more complex parsing (f.e. switching positions of flags) please use
another bolder library such as: [parseargs](https://hackage.haskell.org/package/parseargs). 

This starter will be kept as simple and small as possible.