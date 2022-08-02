
describe("Jungle add to cart", () => {
  beforeEach(() => {
    cy.visit('/');
    cy.viewport(1920, 1080)
  })

  it("Should add an item to the cart when the user clicks the add to cart button from the product page", () => {
    cy.get("article").first().click()
    cy.get('.end-0 > .nav-link').contains('My Cart').should('contain.text', 0)
    cy.get('.page-header > h1').should('contain.text', 'Scented Blade')
    cy.get('.btn').click()
    cy.get('.end-0 > .nav-link').contains('My Cart').should('contain.text', 1)
  });
  
  it("Should add an item to the cart when the user clicks the add to cart button from the product page", () => {
    cy.get('.end-0 > .nav-link').contains('My Cart').should('contain.text', 0)
    cy.get(':nth-child(1) > div > .button_to > .btn').first().click()
    cy.get('.end-0 > .nav-link').contains('My Cart').should('contain.text', 1)
  });

})