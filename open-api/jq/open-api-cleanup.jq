# remove basePath
del(.basePath?)

# remove / path
| del(.paths?."/"?)

# remove all non-get actions from paths
| .paths |= with_entries(.value |= with_entries(select(.key == "get")))

# remove all *_id parameters from paths
| .paths |= with_entries(.value |= with_entries(.value |= (. | if .parameters == null then . else .parameters |= map(. | select(."$ref" | test("_id$") | not)) end)))

# remove all *_id fields from definition properties
| .definitions |= with_entries(.value |= (. | .properties |= with_entries(select(.key|test("_id$")|not))))
