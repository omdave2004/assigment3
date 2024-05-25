(define (problem wumpus_problem)
  (:domain wumpus_domain_a)
  (:objects
    agent1 - agent
    sq-1-1 sq-1-2 sq-1-3 sq-1-4
    sq-2-1 sq-2-2 sq-2-3 sq-2-4
    sq-3-1 sq-3-2 sq-3-3 sq-3-4
    sq-4-1 sq-4-2 sq-4-3 sq-4-4 - location
    the-gold - object
    the-arrow - arrow  ;; Specified as arrow
    wumpus1 - wumpus
  )
  (:init
    (adjacent sq-1-1 sq-1-2) (adjacent sq-1-2 sq-1-1)
    (adjacent sq-1-2 sq-1-3) (adjacent sq-1-3 sq-1-2)
    (adjacent sq-1-3 sq-1-4) (adjacent sq-1-4 sq-1-3)
    (adjacent sq-2-1 sq-2-2) (adjacent sq-2-2 sq-2-1)
    (adjacent sq-2-2 sq-2-3) (adjacent sq-2-3 sq-2-2)
    (adjacent sq-2-3 sq-2-4) (adjacent sq-2-4 sq-2-3)
    (adjacent sq-3-1 sq-3-2) (adjacent sq-3-2 sq-3-1)
    (adjacent sq-3-2 sq-3-3) (adjacent sq-3-3 sq-3-2)
    (adjacent sq-3-3 sq-3-4) (adjacent sq-3-4 sq-3-3)
    (adjacent sq-4-1 sq-4-2) (adjacent sq-4-2 sq-4-1)
    (adjacent sq-4-2 sq-4-3) (adjacent sq-4-3 sq-4-2)
    (adjacent sq-4-3 sq-4-4) (adjacent sq-4-4 sq-4-3)
    (adjacent sq-1-1 sq-2-1) (adjacent sq-2-1 sq-1-1)
    (adjacent sq-2-1 sq-3-1) (adjacent sq-3-1 sq-2-1)
    (adjacent sq-3-1 sq-4-1) (adjacent sq-4-1 sq-3-1)
    (adjacent sq-1-2 sq-2-2) (adjacent sq-2-2 sq-1-2)
    (adjacent sq-2-2 sq-3-2) (adjacent sq-3-2 sq-2-2)
    (adjacent sq-3-2 sq-4-2) (adjacent sq-4-2 sq-3-2)
    (adjacent sq-1-3 sq-2-3) (adjacent sq-2-3 sq-1-3)
    (adjacent sq-2-3 sq-3-3) (adjacent sq-3-3 sq-2-3)
    (adjacent sq-3-3 sq-4-3) (adjacent sq-4-3 sq-3-3)
    (adjacent sq-1-4 sq-2-4) (adjacent sq-2-4 sq-1-4)
    (adjacent sq-2-4 sq-3-4) (adjacent sq-3-4 sq-2-4)
    (adjacent sq-3-4 sq-4-4) (adjacent sq-4-4 sq-3-4)
    (at agent1 sq-1-1)
    (at the-gold sq-3-3)
    (at wumpus1 sq-2-3)
    (have agent1 the-arrow)
    (is-agent agent1)
    (is-wumpus wumpus1)
    (is-gold the-gold)
    (is-arrow the-arrow)
    (wumpus-in sq-2-3)
    (pit sq-4-2)
    (pit sq-4-4)
    (pit sq-1-4)
    (pit sq-3-2)
  )
  (:goal
    (and (have agent1 the-gold) (at agent1 sq-1-1))
  )
)
