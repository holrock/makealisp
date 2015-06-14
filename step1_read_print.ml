open Core.Std

let read = Reader.read_str
let eval x = x
let print = Printer.pr_str

let rep str =
  match read str with
  | Ok sexp -> print (eval sexp)
  | Error e -> Error.to_string_hum e

let rec main_loop () =
  print_string "user> ";
  print_endline (rep (read_line ()));
  main_loop ()

let _ = try main_loop () with End_of_file -> print_endline "bye"
