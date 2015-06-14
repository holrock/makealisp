open Core.Std
open Re2

let reg = Regex.create_exn
  "[\\s,]*(~@|[\\[\\]{}()'`~^@]|\"(?:\\.|[^\\\"])*\"|;.*|[^\\s\\[\\]{}('\"`,;)]*)"

let tokenizer s = Regex.find_all ~sub:(`Index 1) reg s

let read_atom s =
  try Types.Number (int_of_string s)
  with Failure _ -> Types.Symbol s

let rec read_list acc = function
  | [] -> (Or_error.error_string "invalid list"), []
  | ")"::xs -> ((Ok (Types.List (List.rev acc))), xs)
  | "("::xs -> (match read_list [] xs with
		| Error _ as e, rest -> e, rest
		| Ok list, rest -> read_list (list::acc) rest)
  | x::xs -> read_list ((read_atom x)::acc) xs

let read_form = function
  | [] -> Or_error.error_string "empty input"
  | x::xs ->
     match x with
      | "(" -> (match read_list [] xs with
		| Error _ as e, _ -> e
		| Ok _ as s, _ -> s)
      | _ -> Ok (read_atom x)

let rec sl = function
  | [] -> print_endline ""
  | x::xs -> Printf.printf "[%s]\n" x;
	     sl xs

let read_str str =
  match tokenizer str with
  | Ok list -> sl list; read_form list
  | Error _ as e-> e
