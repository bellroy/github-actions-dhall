let Step = ../../schemas/Step.dhall

let Text/concatMapSep =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/refs/tags/v17.1.0/Prelude/Map/package.dhall
        

let List/null =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/refs/tags/v17.1.0/List/null.dhall

in  λ(args : { path : Text, key : Text, hashFiles : List Text }) →
      let keyComponent = "\${{ runner.os }}-${args.key}"

      let quote = λ(x : Text) → "'${x}'"

      let hashFilesArg = Text/concatMapSep ", " Text quote args.hashFiles

      let hashFilesComponent =
            if    List/null Text args.hashFiles
            then  ""
            else  "-\${{ hashFiles(${hashFilesArg}) }}"

      in  Step::{
          , name = Some "${args.path} cache"
          , uses = Some "actions/cache@v4"
          , `with` = Some
              ( toMap
                  { path = args.path
                  , key = "${keyComponent}${hashFilesComponent}"
                  , restore-keys =
                      ''
                      ${keyComponent}
                      ''
                  }
              )
          }
