(define (domain wumpus_domain_a)
  (:requirements :strips :typing)
  (:types agent location object wumpus)
  (:predicates
    (adjacent ?square-1 - location ?square-2 - location)
    (pit ?square - location)
    (at ?who - (either agent object wumpus) ?square - location)
    (have ?who - agent ?what - object)
    (dead ?who - wumpus)
    (wumpus-in ?square - location)
    (is-agent ?who - agent)
    (is-wumpus ?who - wumpus)
    (is-gold ?what - object)
    (is-arrow ?what - object)
    (stench ?square - location)
  )
  
  (:action move
    :parameters (?who - agent ?from - location ?to - location)
    :precondition (and 
                    (is-agent ?who)
                    (at ?who ?from) 
                    (adjacent ?from ?to) 
                    (not (pit ?to)) 
                    (not (wumpus-in ?to))
                    (not (stench ?to))) ;; Added stench constraint
    :effect (and 
             (at ?who ?to) 
             (not (at ?who ?from)))
  )

  (:action take
    :parameters (?who - agent ?what - object ?where - location)
    :precondition (and 
                    (is-agent ?who)
                    (at ?who ?where) 
                    (at ?what ?where))
    :effect (and 
             (have ?who ?what) 
             (not (at ?what ?where)))
  )

  (:action shoot
    :parameters (?who - agent ?where - location ?with-what - object ?victim - wumpus ?where-victim - location)
    :precondition (and 
                    (is-agent ?who)
                    (have ?who ?with-what) 
                    (is-arrow ?with-what) 
                    (at ?who ?where) 
                    (is-wumpus ?victim) 
                    (at ?victim ?where-victim) 
                    (adjacent ?where ?where-victim))
    :effect (and 
             (dead ?victim) 
             (not (wumpus-in ?where-victim)) 
             (not (have ?who ?with-what)))
  )
)