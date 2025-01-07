Feature: Buy products
    As a customer
    I want to buy products

Background:
    Given the store is ready to service customers
    And a product "Bread" with price 20.50 and stock of 5 exists
    And a product "Jam" with price 80.00 and stock of 10 exists
    And a product "Butter" with price 10.00 and stock of 10 exists

Scenario Outline: Buy one product
   When I buy <product> with quantity <quantity>
   Then total should be <total>
   Examples:
       | product  | quantity |  total  |
       | "Bread"  |     1    |   20.50 |
       | "Jam"    |     2    |  160.00 |

Scenario: Buy multiple products
    When I buy <product> with quantity <quantity>
    Then total should be <total>
    Then quantity of <product> should be <leftover>
    Examples:
           | product  | quantity |  total  |    leftover    |
           | "Bread"  |     2    |   41.00 |    3           |
           | "Jam"    |     1    |  80.00  |    9           |
           | "Butter" |     10   |  100    |    0           |
