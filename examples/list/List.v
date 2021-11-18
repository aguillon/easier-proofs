Require Import CoqOfOCaml.CoqOfOCaml.
Require Import CoqOfOCaml.Settings.
From Test Require Import CpdtTactics.


Inductive myList (a : Set) : Set :=
| Nil : myList a
| Cons : a -> myList a -> myList a.

Arguments Nil {_}.
Arguments Cons {_}.

Definition length {a : Set} (l : myList a) : int :=
  let fix aux (acc : int) (l' : myList a) : int :=
    match l' with
    | Nil => 0
    | Cons el tl => aux (Z.add acc 1) tl
    end in
  aux 0 l.

Fixpoint append {a : Set} (l : myList a) (d : myList a) : myList a :=
  match l with
  | Nil => d
  | Cons el tl => Cons el (append tl d)
  end.
