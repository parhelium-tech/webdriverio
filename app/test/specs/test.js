var assert = require('assert');

describe('my awesome website', function() {
    it('should do some chai assertions', function() {
        browser.pause(10000)
        browser.url('/');
        browser.getTitle().should.be.equal('CS Docs');
    });
});
