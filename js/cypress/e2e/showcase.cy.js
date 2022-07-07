function test(id, callback) {
  it(id, () => {
    cy.visit(`#!/${id}`);
    cy.get(`[data-example-id=${id}]`).should('be.visible').within(callback);
  })
}

describe('showcase', () => {
  test('Button', () => {
    for (const text of ['Refresh', 'Export', 'OK', 'Next'])
      cy.contains(text).click();
    cy.contains('Clicks: 4');
  })

  test('Overlay', () => {
    cy.contains('Show').click();
    cy.get('.bp4-overlay-open').contains('Close');
  })

  test('Dialog', () => {
    cy.contains('Show').click();
    cy.get('.bp4-dialog').contains('Close');
  })

  test('MultistepDialog', () => {
    cy.contains('Show').click();
    const selector = '.bp4-dialog';
    for( const text of ['Next', 'Next', 'Step 2', 'Next', 'Submit'])
      cy.get(selector).contains(text).click()
  })
});
