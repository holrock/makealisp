open Core.Std

val tokenizer : string -> string list Or_error.t
val read_atom : string -> Types.sexp
val read_list : Types.sexp list -> string list ->
		(Types.sexp Or_error.t * string list)
val read_form : string list -> Types.sexp Or_error.t
val read_str : string -> Types.sexp Or_error.t
