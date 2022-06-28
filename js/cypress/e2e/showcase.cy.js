function test(id, what) {
  it(id, () => {
    cy.visit(`#!/${id}`);
    cy.get(`[data-example-id=${id}]`).as('app');
    what()
  })
}

describe('showcase', () => {
  test('Button', () => {
    for (const text of ['Refresh', 'Export', 'OK', 'Next'])
      cy.get('@app').contains(text).click();
    cy.get('@app').contains('Clicks: 4');
  })
})
