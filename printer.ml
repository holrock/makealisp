let rec pr_str = function
  | Types.Symbol s -> s
  | Types.Number n -> string_of_int n
  | Types.List sl -> "(" ^ (String.concat " " (List.map pr_str sl)) ^ ")"
