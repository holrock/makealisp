
let read x = x
let eval x = x
let print x = x

let rep x =
  x |> read |> eval |> print

let rec main_loop () =
  print_string "user> ";
  let inp = read_line () in
  print_endline (rep inp);
  main_loop ()

let _ = main_loop ()
