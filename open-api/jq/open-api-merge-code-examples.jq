. as $spec | $source as $examples | $spec | .paths |= with_entries(.key as $k | .value |= (.get."x-codeSamples" = $examples[$k]))
