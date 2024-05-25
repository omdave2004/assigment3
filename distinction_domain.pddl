(define (domain wumpus_domain_a)
  (:requirements :strips :typing)
  (:types 
    agent
    location
    object
    wumpus
    arrow  ;; Added arrow type
  )
  (:predicates
    (adjacent ?loc-1 - location ?loc-2 - location)
    (pit ?loc - location)
    (at ?entity - (either agent object wumpus arrow) ?loc - location)  ;; Included arrow
    (have ?agent - agent ?item - (either object arrow))  ;; Included arrow
    (dead ?wumpus - wumpus)
    (wumpus-in ?loc - location)
    (is-agent ?entity - agent)
    (is-wumpus ?entity - wumpus)
    (is-gold ?item - object)
    (is-arrow ?item - arrow)  ;; Specified arrow
  )
  (:action move
    :parameters (?agent - agent ?from-loc - location ?to-loc - location)
    :precondition (and 
                    (is-agent ?agent)
                    (at ?agent ?from-loc)
                    (adjacent ?from-loc ?to-loc)
                    (not (pit ?to-loc))
                    (not (wumpus-in ?to-loc)))
    :effect (and 
             (at ?agent ?to-loc)
             (not (at ?agent ?from-loc)))
  )
  (:action take
    :parameters (?agent - agent ?item - (either object arrow) ?loc - location)
    :precondition (and 
                    (is-agent ?agent)
                    (at ?agent ?loc)
                    (at ?item ?loc))
    :effect (and 
             (have ?agent ?item)
             (not (at ?item ?loc)))
  )
  (:action shoot
    :parameters (?agent - agent ?agent-loc - location ?arrow - arrow ?wumpus - wumpus ?wumpus-loc - location)
    :precondition (and 
                    (is-agent ?agent)
                    (have ?agent ?arrow)
                    (is-arrow ?arrow)
                    (at ?agent ?agent-loc)
                    (is-wumpus ?wumpus)
                    (at ?wumpus ?wumpus-loc)
                    (adjacent ?agent-loc ?wumpus-loc))
    :effect (and 
             (dead ?wumpus)
             (not (wumpus-in ?wumpus-loc))
             (not (have ?agent ?arrow)))
  )
)
