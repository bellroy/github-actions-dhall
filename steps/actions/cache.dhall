let Step = ../../schemas/Step.dhall

let Text/concatMapSep =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/refs/tags/v17.1.0/Prelude/Map/package.dhall
        sha256:598e9c76103b2686fbbda6cc30078f9e60dd846d9eaf155d0149cf0ae06c21c5

let List/null =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/refs/tags/v17.1.0/Prelude/List/null.dhall
        sha256:2338e39637e9a50d66ae1482c0ed559bbcc11e9442bfca8f8c176bbcd9c4fc80

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
