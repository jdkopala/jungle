describe("Jungle product detail page", () => {
  beforeEach(() => {
    cy.visit('/');
  })

  it("Should navigate to the product detail page when user clicks a product", () => {
    cy.get("article").first().click()
    cy.get('.page-header > h1').should('contain.text', 'Scented Blade')
  });

  it("Should add an item to the cart when the user clicks the add button", () => {
    cy.get("article").first().click()
    cy.get('.page-header > h1').should('contain.text', 'Scented Blade')
    cy.get('.btn').click()
    cy.get('.end-0 > .nav-link').contains('My Cart').should('contain.text', 1)
  });
})