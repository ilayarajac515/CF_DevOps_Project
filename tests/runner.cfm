component extends="testbox.system.BaseSpec" {

    function run() {
        describe("Sample Test", function() {
            it("should pass this dummy test", function() {
                expect(1 + 1).toBe(2);
            });
        });
    }
}
