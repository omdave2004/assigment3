(define (problem wumpus_problem_stench)
  (:domain wumpus_domain_a)
  (:objects
    agent1 - agent
    sq-1-1 sq-1-2 sq-1-3 sq-1-4 sq-1-5 sq-1-6
    sq-2-1 sq-2-2 sq-2-3 sq-2-4 sq-2-5 sq-2-6
    sq-3-1 sq-3-2 sq-3-3 sq-3-4 sq-3-5 sq-3-6
    sq-4-1 sq-4-2 sq-4-3 sq-4-4 sq-4-5 sq-4-6
    sq-5-1 sq-5-2 sq-5-3 sq-5-4 sq-5-5 sq-5-6
    sq-6-1 sq-6-2 sq-6-3 sq-6-4 sq-6-5 sq-6-6 - location
    the-gold - object
    the-arrow - arrow
    wumpus1 - wumpus
  )
  (:init
    ;; Vertical adjacencies
    (adjacent sq-1-1 sq-1-2) (adjacent sq-1-2 sq-1-1)
    (adjacent sq-1-2 sq-1-3) (adjacent sq-1-3 sq-1-2)
    (adjacent sq-1-3 sq-1-4) (adjacent sq-1-4 sq-1-3)
    (adjacent sq-1-4 sq-1-5) (adjacent sq-1-5 sq-1-4)
    (adjacent sq-1-5 sq-1-6) (adjacent sq-1-6 sq-1-5)
    
    (adjacent sq-2-1 sq-2-2) (adjacent sq-2-2 sq-2-1)
    (adjacent sq-2-2 sq-2-3) (adjacent sq-2-3 sq-2-2)
    (adjacent sq-2-3 sq-2-4) (adjacent sq-2-4 sq-2-3)
    (adjacent sq-2-4 sq-2-5) (adjacent sq-2-5 sq-2-4)
    (adjacent sq-2-5 sq-2-6) (adjacent sq-2-6 sq-2-5)
    
    (adjacent sq-3-1 sq-3-2) (adjacent sq-3-2 sq-3-1)
    (adjacent sq-3-2 sq-3-3) (adjacent sq-3-3 sq-3-2)
    (adjacent sq-3-3 sq-3-4) (adjacent sq-3-4 sq-3-3)
    (adjacent sq-3-4 sq-3-5) (adjacent sq-3-5 sq-3-4)
    (adjacent sq-3-5 sq-3-6) (adjacent sq-3-6 sq-3-5)
    
    (adjacent sq-4-1 sq-4-2) (adjacent sq-4-2 sq-4-1)
    (adjacent sq-4-2 sq-4-3) (adjacent sq-4-3 sq-4-2)
    (adjacent sq-4-3 sq-4-4) (adjacent sq-4-4 sq-4-3)
    (adjacent sq-4-4 sq-4-5) (adjacent sq-4-5 sq-4-4)
    (adjacent sq-4-5 sq-4-6) (adjacent sq-4-6 sq-4-5)
    
    (adjacent sq-5-1 sq-5-2) (adjacent sq-5-2 sq-5-1)
    (adjacent sq-5-2 sq-5-3) (adjacent sq-5-3 sq-5-2)
    (adjacent sq-5-3 sq-5-4) (adjacent sq-5-4 sq-5-3)
    (adjacent sq-5-4 sq-5-5) (adjacent sq-5-5 sq-5-4)
    (adjacent sq-5-5 sq-5-6) (adjacent sq-5-6 sq-5-5)
    
    (adjacent sq-6-1 sq-6-2) (adjacent sq-6-2 sq-6-1)
    (adjacent sq-6-2 sq-6-3) (adjacent sq-6-3 sq-6-2)
    (adjacent sq-6-3 sq-6-4) (adjacent sq-6-4 sq-6-3)
    (adjacent sq-6-4 sq-6-5) (adjacent sq-6-5 sq-6-4)
    (adjacent sq-6-5 sq-6-6) (adjacent sq-6-6 sq-6-5)
    
    ;; Horizontal adjacencies
    (adjacent sq-1-1 sq-2-1) (adjacent sq-2-1 sq-1-1)
    (adjacent sq-2-1 sq-3-1) (adjacent sq-3-1 sq-2-1)
    (adjacent sq-3-1 sq-4-1) (adjacent sq-4-1 sq-3-1)
    (adjacent sq-4-1 sq-5-1) (adjacent sq-5-1 sq-4-1)
    (adjacent sq-5-1 sq-6-1) (adjacent sq-6-1 sq-5-1)
    
    (adjacent sq-1-2 sq-2-2) (adjacent sq-2-2 sq-1-2)
    (adjacent sq-2-2 sq-3-2) (adjacent sq-3-2 sq-2-2)
    (adjacent sq-3-2 sq-4-2) (adjacent sq-4-2 sq-3-2)
    (adjacent sq-4-2 sq-5-2) (adjacent sq-5-2 sq-4-2)
    (adjacent sq-5-2 sq-6-2) (adjacent sq-6-2 sq-5-2)
    
    (adjacent sq-1-3 sq-2-3) (adjacent sq-2-3 sq-1-3)
    (adjacent sq-2-3 sq-3-3) (adjacent sq-3-3 sq-2-3)
    (adjacent sq-3-3 sq-4-3) (adjacent sq-4-3 sq-3-3)
    (adjacent sq-4-3 sq-5-3) (adjacent sq-5-3 sq-4-3)
    (adjacent sq-5-3 sq-6-3) (adjacent sq-6-3 sq-5-3)
    
    (adjacent sq-1-4 sq-2-4) (adjacent sq-2-4 sq-1-4)
    (adjacent sq-2-4 sq-3-4) (adjacent sq-3-4 sq-2-4)
    (adjacent sq-3-4 sq-4-4) (adjacent sq-4-4 sq-3-4)
    (adjacent sq-4-4 sq-5-4) (adjacent sq-5-4 sq-4-4)
    (adjacent sq-5-4 sq-6-4) (adjacent sq-6-4 sq-5-4)
    
    (adjacent sq-1-5 sq-2-5) (adjacent sq-2-5 sq-1-5)
    (adjacent sq-2-5 sq-3-5) (adjacent sq-3-5 sq-2-5)
    (adjacent sq-3-5 sq-4-5) (adjacent sq-4-5 sq-3-5)
    (adjacent sq-4-5 sq-5-5) (adjacent sq-5-5 sq-4-5)
    (adjacent sq-5-5 sq-6-5) (adjacent sq-6-5 sq-5-5)
    
    (adjacent sq-1-6 sq-2-6) (adjacent sq-2-6 sq-1-6)
    (adjacent sq-2-6 sq-3-6) (adjacent sq-3-6 sq-2-6)
    (adjacent sq-3-6 sq-4-6) (adjacent sq-4-6 sq-3-6)
    (adjacent sq-4-6 sq-5-6) (adjacent sq-5-6 sq-4-6)
    (adjacent sq-5-6 sq-6-6) (adjacent sq-6-6 sq-5-6)
    
    ;; Initial positions
    (at agent1 sq-1-1)
    (at the-gold sq-4-4)
    (at wumpus1 sq-3-3)
    (have agent1 the-arrow)
    (is-agent agent1)
    (is-wumpus wumpus1)
    (is-gold the-gold)
    (is-arrow the-arrow)
    (wumpus-in sq-3-3)

    ;; Pits
    (pit sq-2-2)
    (pit sq-2-6)
    (pit sq-5-2)
    (pit sq-4-2)
    (pit sq-4-6)
    (pit sq-6-2)
    (pit sq-6-6)
    

    ;; Stench locations
    (stench sq-2-3)
    (stench sq-3-2)
    (stench sq-3-4)
    (stench sq-4-3)
  )
  (:goal
    (and (have agent1 the-gold) (at agent1 sq-1-1))
  )
)
